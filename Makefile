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
npm-install:
	${guide_dir} npm ci --silent
nanoc-check-internal:
	( ${guide_dir} ${prefix} nanoc check ${nanoc_internal_checks} )
nanoc-check-external:
	( ${guide_dir} ${prefix} nanoc check ${nanoc_external_checks} )
nanoc-check-all: build-guide
	( ${guide_dir} ${prefix} nanoc check ${nanoc_internal_checks} ${nanoc_external_checks} )
build:
	${prefix} gem build dsfr-view-components.gemspec
build-guide: npm-install
	( ${guide_dir} ${prefix} nanoc )
view-guide: build-guide
	( ${guide_dir} ${prefix} nanoc view --port ${nanoc_default_port} )
watch-guide: npm-install
	( ${guide_dir} ${prefix} nanoc live --port ${nanoc_default_port} )
watch-guide-reload: npm-install
	@echo "Watching components... (Ctrl+C to stop)"
	@while true; do \
		( cd guide && ${prefix} nanoc live --port ${nanoc_default_port} ) & \
		NANOC_PID=$$!; \
		fswatch -1 -r app/components app/helpers; \
		echo "Components changed, reloading..."; \
		pkill -P $$NANOC_PID 2>/dev/null; \
		kill $$NANOC_PID 2>/dev/null; \
		lsof -ti:${nanoc_default_port} | xargs kill -9 2>/dev/null; \
		rm -rf guide/output/*; \
		sleep 2; \
	done
docs-server:
	bundle exec yard server --reload
clean:
	rm -rf guide/output/**/*
