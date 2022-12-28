$LOAD_PATH.push File.expand_path("lib", __dir__)

require "dsfr/components/version"
require_relative "util/version_formatter"

METADATA = {
  "bug_tracker_uri" => "https://github.com/betagouv/dsfr-view-components/issues",
  "changelog_uri" => "https://github.com/betagouv/dsfr-view-components/releases",
  "documentation_uri" => "https://www.rubydoc.info/gems/govuk-components/",
  "homepage_uri" => "https://github.com/betagouv/dsfr-view-components",
  "source_code_uri" => "https://github.com/betagouv/dsfr-view-components"
}.freeze

Gem::Specification.new do |spec|
  spec.name        = "dsfr-view-components"
  spec.version     = Dsfr::Components::VERSION
  spec.authors     = ["BetaGouv developers"]
  spec.email       = ["stephane.maniaci@beta.gouv.fr", "adrien.di_pasquale@beta.gouv.fr"]
  spec.homepage    = "https://github.com/betagouv/dsfr-view-components"
  spec.summary     = "View Components for the Système de Design de l'État (DSFR)"
  spec.description = "A collection of components based on ViewComponent intended to ease the
  building of web applications with the Système de Design de l'État
  (DSFR)"
  spec.license = "MIT"

  spec.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  exact_rails_version = ENV.key?("RAILS_VERSION")
  rails_version = ENV.fetch("RAILS_VERSION") { "6.1.5" }

  %w(actionpack activemodel railties).each do |lib|
    spec.add_dependency(*VersionFormatter.new(lib, rails_version, exact_rails_version).to_a)
  end

  spec.add_dependency("html-attributes-utils", "~> 0.9", ">= 0.9.2")
  spec.add_dependency("pagy", "~> 5.10.1")
  spec.add_dependency "view_component", "~> 2.74.1"

  spec.add_development_dependency "deep_merge"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "pry-byebug"
  spec.add_development_dependency "rspec-html-matchers", "~> 0.9"
  spec.add_development_dependency "rspec-rails"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "rubocop-rails"
  spec.add_development_dependency "sassc-rails"
  spec.add_development_dependency("simplecov", "~> 0.20")
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "yard"

  # Required for the guide
  spec.add_development_dependency("htmlbeautifier", "~> 1.4.1")
  spec.add_development_dependency("kramdown", "~> 2.4.0")
  spec.add_development_dependency("nanoc", "~> 4.11")
  spec.add_development_dependency("rouge", "~> 4.0.0")
  spec.add_development_dependency("rubypants", "~> 0.7.0")
  spec.add_development_dependency("sass")
  spec.add_development_dependency("sassc", "~> 2.4.0")
  spec.add_development_dependency("slim", "~> 4.1.0")
  spec.add_development_dependency("slim_lint", "~> 0.22.0")
  spec.add_development_dependency("haml", "~> 6.1.1")
  spec.add_development_dependency("haml_lint")
  spec.add_development_dependency("webrick", "~> 1.7.0")
  spec.metadata['rubygems_mfa_required'] = 'true'
end
