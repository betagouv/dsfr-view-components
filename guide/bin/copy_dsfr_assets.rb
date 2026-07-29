require 'fileutils'

gem_dir = Gem::Specification.find_by_name('dsfr-assets').gem_dir

%w[fonts icons artwork].each do |d|
  FileUtils.cp_r("#{gem_dir}/vendor/assets/stylesheets/#{d}", 'guide/content')
end

FileUtils.cp_r("#{gem_dir}/vendor/assets/images/favicon", 'guide/content')

FileUtils.mkdir_p('guide/content/javascripts')
Dir["#{gem_dir}/vendor/assets/javascripts/*"].each do |f|
  FileUtils.cp(f, 'guide/content/javascripts')
end
