require 'rubygems'
require 'tmpdir'
require 'rubyXL'

describe RubyXL::Parser do

  before do
    @test_sheet_name = "This is a very long sheet name that should be trimmed to 31 characters for compatibility with MS Excel"
    @workbook = RubyXL::Workbook.new
    @workbook.add_worksheet("Test Worksheet")
    @time = Time.at(Time.now.to_i) # Excel only saves times with 1-second precision.
    @time2 = @time + 123456

    ws = @workbook.add_worksheet("Escape Test")
    ws.add_cell(0, 0, "&")
    ws.add_cell(0, 1, "<")
    ws.add_cell(0, 2, ">")
    ws.add_cell(0, 3, "")

    ws.add_cell(1, 0, "&")#TODO#.datatype = RubyXL::Cell::SHARED_STRING
    ws.add_cell(1, 1, "<")#TODO#.datatype = RubyXL::Cell::SHARED_STRING
    ws.add_cell(1, 2, ">")#TODO#.datatype = RubyXL::Cell::SHARED_STRING
    ws.add_cell(1, 3, "")

    ws.add_cell(2, 0, 0)
    ws.add_cell(2, 1, 12345)
    ws.add_cell(2, 2, 123.456e78)
    ws.add_cell(2, 3, 123.456e-78)

    ws.add_cell(3, 0, -0)
    ws.add_cell(3, 1, -12345)
    ws.add_cell(3, 2, -123.456e78)
    ws.add_cell(3, 3, -123.456e-78)

    @workbook.add_worksheet(@test_sheet_name)

    @workbook.creator = "test creator"
    @workbook.modifier = "test modifier"
    @workbook.created_at = @time
    @workbook.modified_at = @time2

    @time_str = Time.now.to_s
    @file = Dir::Tmpname.make_tmpname(['rubyXL', '.xlsx'], nil)
    @workbook.write(@file)
  end

  describe '.parse' do
    it 'should parse a valid Excel xlsx or xlsm workbook correctly' do
      @workbook2 = RubyXL::Parser.parse(@file)

      expect(@workbook2.worksheets.size).to eq(@workbook.worksheets.size)
      @workbook2.worksheets.each_index { |i|
        expect(@workbook2[i].extract_data).to eq(@workbook[i].extract_data)
      }
    end

    it 'should cause an error if an xlsx or xlsm workbook is not passed' do
      expect {@workbook2 = RubyXL::Parser.parse("nonexistent_file.tmp")}.to raise_error
    end

    it 'should not cause an error if an xlsx or xlsm workbook is not passed but the skip_filename_check option is used' do
      filename = @time_str
      FileUtils.cp(@file, filename)
      
      expect {@workbook2 = RubyXL::Parser.parse(filename)}.to raise_error
      expect {@workbook2 = RubyXL::Parser.parse(filename, :skip_filename_check => true)}.not_to raise_error

      File.delete(filename)
    end
    
    it 'should only read the data and not any of the styles (for the sake of speed) when passed true' do
      @workbook2 = RubyXL::Parser.parse(@file, :data_only => true)

      expect(@workbook2.worksheets.size).to eq(@workbook.worksheets.size)
      expect(@workbook2[0].extract_data).to eq(@workbook[0].extract_data)
      expect(@workbook2[0].extract_data).to eq(@workbook[0].extract_data)
    end

=begin
    it 'should construct consistent number formats' do
      @workbook2 = RubyXL::Parser.parse(@file)
      @workbook2.num_fmts.should be_an(Array)
      @workbook2.num_fmts.size.should == @workbook2.num_fmts[:attributes][:count]
    end
=end

    it 'should unescape HTML entities properly' do
      @workbook2 = RubyXL::Parser.parse(@file)
      expect(@workbook2["Escape Test"][0][0].value).to eq("&")
      expect(@workbook2["Escape Test"][0][1].value).to eq("<")
      expect(@workbook2["Escape Test"][0][2].value).to eq(">")

      expect(@workbook2["Escape Test"][1][0].value).to eq("&")
      expect(@workbook2["Escape Test"][1][1].value).to eq("<")
      expect(@workbook2["Escape Test"][1][2].value).to eq(">")
    end

    it 'should parse Core properties correctly' do
      @workbook2 = RubyXL::Parser.parse(@file)
      expect(@workbook2.creator).to eq("test creator")
      expect(@workbook2.modifier).to eq("test modifier")
      expect(@workbook2.created_at).to eq(@time)
      expect(@workbook2.modified_at).to eq(@time2)
    end

    it 'should trim excessively long sheet names on save' do
      @workbook2 = RubyXL::Parser.parse(@file)
      expect(@workbook2[@test_sheet_name]).to be_nil
      expect(@workbook2[@test_sheet_name[0..30]]).not_to be_nil
    end

  end

  after do
    if File.exist?(@file)
      File.delete(@file)
    end
  end
end
