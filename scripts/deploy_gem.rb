version = ARGV[0]
match_data = version&.match(/v?([0-9]+\.[0-9]+\.[0-9]+)/)
raise ArgumentError, "misformed version, should look like '1.0.13' (no v)" unless match_data

current_git_branch = `git rev-parse --abbrev-ref HEAD`.strip
raise StandardError, "you need to be on main branch" if current_git_branch != "main"

raise StandardError, "your branch needs to be clean, no changes" if `git status --porcelain`.present?

version_without_v = match_data[1]
version_with_v = "v#{version_without_v}"

`sed -E -i '' "s/[0-9]+.[0-9]+.[0-9]+/#{version_without_v}/" lib/dsfr/components/version.rb`

`git add lib/dsfr/components/version.rb`
`git commit -m "release version #{version_with_v}"`
`git tag -a "#{version_with_v}"`
`git push`
`gem build dsfr-view-components.gemspec`
`gem push dsfr-view-components-#{version_without_v}.gem`
