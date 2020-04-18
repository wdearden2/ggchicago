PACKAGE = ggchicago

package: check

docs:
	# Regenerate documentation with roxygen
	Rscript -e "devtools::document(pkg = '$(PACKAGE)')"

install: docs
	# Install ggchicago R package
	@Rscript -e "devtools::install(file.path(getwd(), '$(PACKAGE)'), force = TRUE, upgrade_dependencies = FALSE, build_vignettes = TRUE, metadata = list(GitRepo = '`basename $$(git config --get remote.origin.url)`', GitOrigin = '`git config --get remote.origin.url`', GitBranch = '`git rev-parse --abbrev-ref HEAD`', GitCommit = '`git rev-parse --verify HEAD`'))"

test: install
	@# Run unit tests.
	@Rscript run_tests.R

build: docs
	R CMD build $(PACKAGE)

check: build
	VERSION=$$(cat $(PACKAGE)/DESCRIPTION | grep ^Version | awk '{print $$2}') && \
	PKG_TAR=$(PACKAGE)_$$VERSION.tar.gz && \
	R CMD check $$PKG_TAR && \
	rm $$PKG_TAR && \
	rm -rf $(PACKAGE).Rcheck

pkgdown:
	Rscript -e "pkgdown::build_site('$(PACKAGE)', preview = TRUE)"
