# MakeDemo magic
# Copyright (c) 2018 Benjamin Holt -- MIT License

# Doc comments start with double-hash-space
# 'make list' prints documented targets
# Meta-targets are documented with 'hash-M-space'
# 'make list_meta' prints these
# Many targets push the demo command to the pasteboard, cmd-v to paste/edit/run
# Sequential aliases are for easily running targets one-after-another with 'source ./makenext'

SHELL := /bin/bash

QuietCopy := pbcopy
PrintCopy := tee >(pbcopy)

Note := @echo NOTE:

GetChunk = "$(MakeDemoDir)/getchunk"
ChunkNamed = $(GetChunk) $(ChunkFile)
AtChunk = @$(ChunkNamed) "$@"

###  Meta-targets  ###
list:          #M Lists the documented targets
	@egrep "^(\w(\w|[\\ .-])*:[^#]*\s+)?## " Makefile || :

list_meta:     #M Lists the meta-targets
	@egrep --no-filename "^\w(\w|[\\ .-])*:[^#]*\s+#M " Makefile "$(MakeDemoDir)/MakeDemo.make" || :

# list_all:      #M Lists all targets
# 	@egrep --no-filename '^\w(\w|[\\ .-])*:(\s|$$)' Makefile "$(MakeDemoDir)/MakeDemo.make" || :

sequence.tmp.mk: Makefile
	@egrep "^\w(\w|[\\ .-])*:[^#]*\s+## " Makefile | cut -d ":" -f 1 | cat -n | sed -n -E 's/^[[:space:]]+([[:digit:]]+)[[:space:]]+(.+)/\1: \2/gp' > sequence.tmp.mk
	@echo "Refreshed sequence targets"

sequence: sequence.tmp.mk  #M Re-create the sequence aliases from documented targets

# better_sequence: # Re-create the sequence aliases from documented targets, must be copy-pasted into Makefile - recognize targets with dependencies and preserve doc comments; still wouldn't find targets with multiple things before the ':'
# 	@egrep "^\w+:(\s+\w+)*\s+## " Makefile | cat -n | sed -n -E 's/^[[:space:]]+([[:digit:]]+)[[:space:]]+([^:]+):([^#]+)#(#.*)/\1: \2  \4/gp'  # HACK: make sure aliases don't use hash-hash comments (maybe doesn't matter if I move to imported aliases?)

###
