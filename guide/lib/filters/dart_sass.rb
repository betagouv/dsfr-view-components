Nanoc::Filter.define(:dart_sass) do |_, opts|
  Sass.compile(opts[:target], style: :compressed).css
end
