$LOAD_PATH.push File.expand_path("lib", __dir__)

require "dsfr/components/version"

DEFAULT_RAILS_VERSION = "~> 8"

METADATA = {
  "bug_tracker_uri" => "https://github.com/betagouv/dsfr-view-components/issues",
  "changelog_uri" => "https://github.com/betagouv/dsfr-view-components/releases",
  "documentation_uri" => "https://www.rubydoc.info/gems/dsfr-view-components/",
  "homepage_uri" => "https://github.com/betagouv/dsfr-view-components",
  "source_code_uri" => "https://github.com/betagouv/dsfr-view-components"
}

Gem::Specification.new do |spec|
  spec.name        = "dsfr-view-components"
  spec.version     = Dsfr::Components::VERSION
  spec.authors     = ["BetaGouv developers"]
  spec.email       = [
    "antoine.girard@beta.gouv.fr",
    "stephane.maniaci@beta.gouv.fr",
    "adrien.di_pasquale@beta.gouv.fr"
  ]
  spec.homepage    = "https://github.com/betagouv/dsfr-view-components"
  spec.summary     = "Composants ViewComponent pour le Système de Design de l'État (DSFR)"
  spec.description = "Cette librairie de composants vise à simplifier l’usage du DSFR (Système de Design de l'État) dans les applications web utilisant Ruby On Rails"
  spec.license = "MIT"
  spec.metadata = METADATA

  spec.files = Dir["{app,config,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.required_ruby_version = '>= 3.2'

  spec.add_dependency "html-attributes-utils", "~> 1"
  spec.add_dependency "view_component", "~> 3"
  spec.add_dependency "dsfr-assets", "~> 1.13.2"

  spec.add_development_dependency "deep_merge"
  spec.add_development_dependency "debug"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rspec-html-matchers", "~> 0.9"
  spec.add_development_dependency "rubocop"
  spec.add_development_dependency "simplecov", "~> 0.20"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "yard"


  # Required for the guide
  spec.add_development_dependency("rails", ENV.fetch("RAILS_VERSION", DEFAULT_RAILS_VERSION))
  spec.add_development_dependency("propshaft")
  spec.add_development_dependency("haml", "~> 6.1.1")
  spec.add_development_dependency("haml_lint")
  spec.add_development_dependency("htmlbeautifier", "~> 1.4.1")
  spec.add_development_dependency("kramdown", "~> 2.4.0")
  spec.add_development_dependency("nanoc", "~> 4.11")
  spec.add_development_dependency("rouge", "~> 4.0.0")
  spec.add_development_dependency("rubypants", "~> 0.7.0")
  spec.add_development_dependency("webrick", "~> 1.7.0")
  spec.metadata['rubygems_mfa_required'] = 'true'
end
