MakeDemo Meta-Demo
==================

### Intro -- What & why of MakeDemo
MakeDemo is a framework for command-line demos
- `Makefile` with named targets
- Auto-generated "sequence" targets
- `makenext` script to step
- Text "chunks" - code snippets, "slides", complex commands...
- Pasteboard helpers for macOS (does Linux have this?)

### Makenext -- What it does
- Runs (documented) targets in order
- Shows upcoming target
- `-p` "Can you show us that again?"
- Quick access to numbered target
- Not a replacement for named targets and `make list`
- Must be `sourced` to keep its place

### Make magic -- Special sauce
MakeDemo.make has a number of helpful things to import and use in your demos
- Meta-targets like `make list` to display all your targets with `## doc comments`
- Those targets are also used by `make sequence` to generate the file that drives `makenext`
- Aliases to get text chunks and work with the pasteboard

### Why make?
Isn't `make` a build system?  Why would you abuse it like this?
- Basically a bunch of little, named, shell scripts in one file
- ...And much more, very flexible and powerful
- Ubiquitous (on unix at least)
- Useful for lots of other things, too - transferrable knowledge

On the other hand...
- _Really_ wan't meant to do this
- Needs lots of other unix tools to work this way and be useful
  - Hidden bonus: you can learn a _lot_, I sure have
- Quoting and other syntax issues are tricky

### Chunks -- Keep text out of the Makefile
Chunks are text snippets; they can be free-form, code, commands, whatever.
- `getchunk` script prints the text between lines starting with a delimiter, by default `###`
  - Top line must start with the delimiter, at least one space, and the "label"; may have other text after the label
  - Bottom line is the next one starting with the delimiter
  - Neither delimiter line is included in the chunk
  - `GetChunkDelim` environment variable sets delimiter
- Pulls from whatever text file you choose -- like the README:
  - `###` is a Markdown `h3`, so these are "chunks"!
- `$(AtChunk)`, from MakeDemo.make, automatically gets the text for the current target (there are also other, more flexible, versions)
  - They can be printed to stdout or piped to other commands

See!  No quoting issues with any of these strings!

####  

Outline
-------
- Intro
- makenext - Quick overview
- Make magic
- Why make?
- Chunks
- Copy-paste

- Appendix - Tips & tricks
---
