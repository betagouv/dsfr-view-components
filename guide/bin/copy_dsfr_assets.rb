require 'fileutils'

gem_dir = Gem::Specification.find_by_name('dsfr-assets').gem_dir
destination = File.expand_path('guide/content')

Dir.chdir(gem_dir) do
  %w[fonts icons artwork utility].each do |d|
    FileUtils.cp_r("vendor/assets/stylesheets/#{d}", "#{destination}/")
  end

  FileUtils.cp_r('vendor/assets/images/favicon', "#{destination}/")

  FileUtils.mkdir_p("#{destination}/javascripts")
  Dir['vendor/assets/javascripts/*'].each do |f|
    FileUtils.cp(f, "#{destination}/javascripts/")
  end
end
