version = ARGV[0]
match_data = version&.match(/v?([0-9]+\.[0-9]+\.[0-9]+)/)
raise ArgumentError, "misformed version, should look like '1.0.13' (no v)" unless match_data

current_git_branch = `git rev-parse --abbrev-ref HEAD`.strip
raise StandardError, "you need to be on main branch" if current_git_branch != "main"

raise StandardError, "your branch needs to be clean, no changes" unless `git status --porcelain`.empty?

version_without_v = match_data[1]
version_with_v = "v#{version_without_v}"

commands = <<~BASH.split("\n")
  sed -E -i '' "s/[0-9]+.[0-9]+.[0-9]+/#{version_without_v}/" lib/dsfr/components/version.rb
  bundle
  git add lib/dsfr/components/version.rb Gemfile.lock
  git commit -m "release version #{version_with_v}"
  gem build dsfr-view-components.gemspec
  git tag -a "#{version_with_v}" -m "release version #{version_with_v}"
  git push
  git push origin "#{version_with_v}"
  gh release create "#{version_with_v}" --verify-tag --generate-notes
BASH

commands.each do |command|
  puts command
  res = system(command)
  raise Exception, "command failed!" unless res

  puts
end

puts "\n🚀 Almost done!"
puts "last step is to run this command with a valid 2FA OTP token for your rubygems account:"
puts "gem push dsfr-view-components-#{version_without_v}.gem --otp 123456"
