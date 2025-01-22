prefix=bundle exec
guide_dir=cd guide &&
nanoc_default_port=3005
nanoc_internal_checks=internal_links stale mixed_content
nanoc_external_checks=external_links

check: ruby-lint haml-lint rspec nanoc-check
nanoc-check: nanoc-check-all

ruby-lint:
	${prefix} rubocop lib spec guide/lib
haml-lint:
	${prefix} haml-lint guide

rspec:
	${prefix} rspec --format progress
nanoc-check-internal:
	( ${guide_dir} ${prefix} nanoc check ${nanoc_internal_checks} )
nanoc-check-external:
	( ${guide_dir} ${prefix} nanoc check ${nanoc_external_checks} )
nanoc-check-all: build-guide
	( ${guide_dir} ${prefix} nanoc check ${nanoc_internal_checks} ${nanoc_external_checks} )
build:
	${prefix} gem build dsfr-view-components.gemspec
build-guide:
	( ${guide_dir} ${prefix} nanoc )
view-guide: build-guide
	( ${guide_dir} ${prefix} nanoc view --port ${nanoc_default_port} )
watch-guide:
	( ${guide_dir} ${prefix} nanoc live --port ${nanoc_default_port} )
docs-server:
	bundle exec yard server --reload
code-climate:
	codeclimate analyze {lib,spec,guide/lib}
clean:
	rm -rf guide/output/**/*
deploy_gem:
	bundle exec rails runner scripts/deploy_gem.rb $$VERSION
