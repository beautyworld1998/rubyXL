# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "rubyXL"
  s.version = "2.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vivek Bhagwat"]
  s.date = "2014-01-16"
  s.description = "rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents"
  s.email = "bhagwat.vivek@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "lib/rubyXL.rb",
    "lib/rubyXL/cell.rb",
    "lib/rubyXL/generic_storage.rb",
    "lib/rubyXL/objects/border.rb",
    "lib/rubyXL/objects/cell_style.rb",
    "lib/rubyXL/objects/color.rb",
    "lib/rubyXL/objects/column_range.rb",
    "lib/rubyXL/objects/data_validation.rb",
    "lib/rubyXL/objects/defined_name.rb",
    "lib/rubyXL/objects/fill.rb",
    "lib/rubyXL/objects/font.rb",
    "lib/rubyXL/objects/formula.rb",
    "lib/rubyXL/objects/ooxml_object.rb",
    "lib/rubyXL/objects/reference.rb",
    "lib/rubyXL/objects/sheet_view.rb",
    "lib/rubyXL/objects/worksheet.rb",
    "lib/rubyXL/parser.rb",
    "lib/rubyXL/private_class.rb",
    "lib/rubyXL/shared_strings.rb",
    "lib/rubyXL/workbook.rb",
    "lib/rubyXL/worksheet.rb",
    "lib/rubyXL/writer/app_writer.rb",
    "lib/rubyXL/writer/calc_chain_writer.rb",
    "lib/rubyXL/writer/content_types_writer.rb",
    "lib/rubyXL/writer/core_writer.rb",
    "lib/rubyXL/writer/generic_writer.rb",
    "lib/rubyXL/writer/root_rels_writer.rb",
    "lib/rubyXL/writer/shared_strings_writer.rb",
    "lib/rubyXL/writer/styles_writer.rb",
    "lib/rubyXL/writer/theme_writer.rb",
    "lib/rubyXL/writer/workbook_rels_writer.rb",
    "lib/rubyXL/writer/workbook_writer.rb",
    "lib/rubyXL/writer/worksheet_writer.rb",
    "lib/rubyXL/zip.rb",
    "rdoc/created.rid",
    "rdoc/fonts.css",
    "rdoc/fonts/Lato-Light.ttf",
    "rdoc/fonts/Lato-LightItalic.ttf",
    "rdoc/fonts/Lato-Regular.ttf",
    "rdoc/fonts/Lato-RegularItalic.ttf",
    "rdoc/fonts/SourceCodePro-Bold.ttf",
    "rdoc/fonts/SourceCodePro-Regular.ttf",
    "rdoc/images/add.png",
    "rdoc/images/arrow_up.png",
    "rdoc/images/brick.png",
    "rdoc/images/brick_link.png",
    "rdoc/images/bug.png",
    "rdoc/images/bullet_black.png",
    "rdoc/images/bullet_toggle_minus.png",
    "rdoc/images/bullet_toggle_plus.png",
    "rdoc/images/date.png",
    "rdoc/images/delete.png",
    "rdoc/images/find.png",
    "rdoc/images/loadingAnimation.gif",
    "rdoc/images/macFFBgHack.png",
    "rdoc/images/package.png",
    "rdoc/images/page_green.png",
    "rdoc/images/page_white_text.png",
    "rdoc/images/page_white_width.png",
    "rdoc/images/plugin.png",
    "rdoc/images/ruby.png",
    "rdoc/images/tag_blue.png",
    "rdoc/images/tag_green.png",
    "rdoc/images/transparent.png",
    "rdoc/images/wrench.png",
    "rdoc/images/wrench_orange.png",
    "rdoc/images/zoom.png",
    "rdoc/js/darkfish.js",
    "rdoc/js/jquery.js",
    "rdoc/js/navigation.js",
    "rdoc/js/search.js",
    "rdoc/js/search_index.js",
    "rdoc/js/searcher.js",
    "rdoc/rdoc.css",
    "rubyXL.gemspec",
    "spec/lib/cell_spec.rb",
    "spec/lib/color_spec.rb",
    "spec/lib/parser_spec.rb",
    "spec/lib/workbook_spec.rb",
    "spec/lib/worksheet_spec.rb"
  ]
  s.homepage = "http://github.com/gilt/rubyXL"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.23"
  s.summary = "rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_runtime_dependency(%q<rubyzip>, [">= 1.0.0"])
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, [">= 0"])
      s.add_development_dependency(%q<simplecov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.4"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_dependency(%q<rubyzip>, [">= 1.0.0"])
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, [">= 0"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<simplecov>, [">= 0"])
      s.add_dependency(%q<rspec>, [">= 1.3.4"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
    s.add_dependency(%q<rubyzip>, [">= 1.0.0"])
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, [">= 0"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<simplecov>, [">= 0"])
    s.add_dependency(%q<rspec>, [">= 1.3.4"])
  end
end

