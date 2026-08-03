require 'sass-embedded'

Nanoc::Filter.define(:dart_sass) do |_, opts|
  gem_dir = Gem::Specification.find_by_name('dsfr-assets').gem_dir
  Sass.compile(
    opts[:target],
    load_paths: ["#{gem_dir}/vendor/assets/stylesheets"],
    style: :compressed
  ).css
end
