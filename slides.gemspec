# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{slides}
  s.version = "1.1.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Daniel Craig"]
  s.date = %q{2009-09-07}
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
     "app/controllers/admin/slide_shows_controller.rb",
     "app/controllers/admin/slides_controller.rb",
     "app/controllers/slide_shows_controller.rb",
     "app/controllers/slides_controller.rb",
     "app/helpers/slides_helper.rb",
     "app/models/slide.rb",
     "app/models/slide_show.rb",
     "app/views/admin/slide_shows/index.html.erb",
     "app/views/admin/slide_shows/show.html.erb",
     "app/views/admin/slides/index.html.erb",
     "app/views/admin/slides/show.html.erb",
     "config/routes.rb",
     "generators/slides_migration/slides_migration_generator.rb",
     "generators/slides_migration/templates/migration.rb",
     "lib/slides.rb",
     "public/javascripts/swfobject.js",
     "slides.gemspec",
     "test/slide_show_test.rb",
     "test/slides_test.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/dougle/slides}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.5}
  s.summary = %q{Slide show generation}
  s.test_files = [
    "test/slide_show_test.rb",
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
