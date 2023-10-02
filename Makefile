commit:
	git add -Av 
	git commit -m "$(shell date)"
	git push origin main
newday:
	git pull && mdbook-newday src/SUMMARY.md && mdbook serve
build:
	mdbook build
publish:
	mdbook build && surge book/ nnums.surge.sh