rfun := $(wildcard R/*.R)
rman := $(wildcard man/)
rtes := $(wildcard tests/testthat/*.R)
rsrc := $(wildcard src/)
rdm = README.Rmd
md = README.md
chk = record_updates.txt
rscr = ../pkg2date.R


all: $(md) $(chk)

$(md): $(rdm)
	Rscript --no-site-file  --no-init-file $(rscr) `pwd` 0

$(chk): $(rfun) $(rtes) $(rman) $(rsrc)
	Rscript --no-site-file  --no-init-file $(rscr) `pwd` 1

clean:
	rm -rf man/* NAMESPACES
