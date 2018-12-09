# Meta-demo
# Copyright (c) 2018 Benjamin Holt -- MIT License

# Doc comments start with double-hash-space
# 'make list' prints documented targets
# Meta-targets are documented with 'hash-M-space'
# 'make list_meta' prints these
# Many targets push the demo command to the pasteboard, cmd-v to paste/edit/run
# Sequential aliases are for easily running targets one-after-another with 'source ./makenext'

default: list  #M Target to run if none is specified

# Requires https://github.com/inventhouse/MakeDemo
# $ ../demoinit
# $ source ./demonow
include $(MakeDemoDir)/MakeDemo.make

ChunkFile := "README.md"

## Meta-demo ##
Intro:  ## What and why of MakeDemo
	$(AtChunk)

Makenext:  ## What it does
	$(MakeDemoDir)/makenext -h
	@echo
	@echo "$@:"
	$(AtChunk)

Make\ magic:  ## Special sauce in MakeDemo.make
	$(AtChunk)
	@echo "make list" | $(QuietCopy)

Why\ make:  ## Pros and cons of make
	$(AtChunk)

Chunks:  ## Managing text
	$(AtChunk)

# # #  Sequential aliases  # # #
include sequence.tmp.mk
# # #
