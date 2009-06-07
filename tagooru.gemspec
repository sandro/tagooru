# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{tagooru}
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Sandro Turriate"]
  s.date = %q{2009-06-07}
  s.email = %q{sandro.turriate@gmail.com}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "lib/tagooru.rb",
     "lib/tagooru/playlist.rb",
     "script/console",
     "spec/fixtures/fix.m3u",
     "spec/spec.opts",
     "spec/spec_helper.rb",
     "spec/tagooru/playlist_spec.rb",
     "spec/tagooru_spec.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/sandro/tagooru}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Ruby wrapper for the tagoo search engine}
  s.test_files = [
    "spec/spec_helper.rb",
     "spec/tagooru/playlist_spec.rb",
     "spec/tagooru_spec.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
