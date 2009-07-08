# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{slides}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Craig"]
  s.date = %q{2009-07-08}
  s.email = %q{daniel@wearebeef.co.uk}
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
     "VERSION",
     "app/controllers/admin/slides_controller.rb",
     "app/controllers/slides_controller.rb",
     "app/helpers/slides_helper.rb",
     "app/models/slide.rb",
     "app/views/admin/slides/index.html.erb",
     "app/views/admin/slides/show.html.erb",
     "app/views/slides/index.html.erb",
     "config/routes.rb",
     "generators/slides_migration/slides_migration_generator.rb",
     "generators/slides_migration/templates/migration.rb",
     "lib/slides.rb",
     "public/javascripts/swfobject.js",
     "test/slides_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/dougle/slides}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.4}
  s.summary = %q{Slide show generation}
  s.test_files = [
    "test/slides_test.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
