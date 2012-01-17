# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{rubyXL}
  s.version = "1.2.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Vivek Bhagwat"]
  s.date = %q{2012-01-17}
  s.description = %q{rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents}
  s.email = %q{bhagwat.vivek@gmail.com}
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
    "lib/.DS_Store",
    "lib/rubyXL.rb",
    "lib/rubyXL/Hash.rb",
    "lib/rubyXL/cell.rb",
    "lib/rubyXL/color.rb",
    "lib/rubyXL/parser.rb",
    "lib/rubyXL/private_class.rb",
    "lib/rubyXL/workbook.rb",
    "lib/rubyXL/worksheet.rb",
    "lib/rubyXL/writer/app_writer.rb",
    "lib/rubyXL/writer/calc_chain_writer.rb",
    "lib/rubyXL/writer/content_types_writer.rb",
    "lib/rubyXL/writer/core_writer.rb",
    "lib/rubyXL/writer/root_rels_writer.rb",
    "lib/rubyXL/writer/shared_strings_writer.rb",
    "lib/rubyXL/writer/styles_writer.rb",
    "lib/rubyXL/writer/theme_writer.rb",
    "lib/rubyXL/writer/workbook_rels_writer.rb",
    "lib/rubyXL/writer/workbook_writer.rb",
    "lib/rubyXL/writer/worksheet_writer.rb",
    "lib/rubyXL/zip.rb",
    "rubyXL.gemspec",
    "spec/lib/cell_spec.rb",
    "spec/lib/color_spec.rb",
    "spec/lib/hash_spec.rb",
    "spec/lib/parser_spec.rb",
    "spec/lib/workbook_spec.rb",
    "spec/lib/worksheet_spec.rb"
  ]
  s.homepage = %q{http://github.com/gilt/rubyXL}
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{rubyXL is a gem which allows the parsing, creation, and manipulation of Microsoft Excel (.xlsx/.xlsm) Documents}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<shoulda>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_development_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_development_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_development_dependency(%q<rspec>, [">= 1.3.4"])
    else
      s.add_dependency(%q<shoulda>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0.0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
      s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
      s.add_dependency(%q<rspec>, [">= 1.3.4"])
    end
  else
    s.add_dependency(%q<shoulda>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0.0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6.0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 1.4.4"])
    s.add_dependency(%q<rubyzip>, [">= 0.9.4"])
    s.add_dependency(%q<rspec>, [">= 1.3.4"])
  end
end

