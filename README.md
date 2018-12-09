MakeDemo
========
PowerPoint, Keynote, Slides, there are many presentation apps available, but none are very good for command-line and code-heavy demos; MakeDemo aims to support these.

_((Goals: no nervous fingers - don't type in front of people; present sequentially and show up-next; all setup to prep / pre-demo; ...but enable easy on-the-fly random access))_

How it works
------------

### Usage


####  

To Do
-----
- Columnator - pass a delim like ## and it will make a two-column format from stdin lines; should ^## mean left-justify-anyway?  Center?  ## Heading ##?; could I tricksy produce markdown table format?

- overarching makedemo help - maybe chunk a usage section out of the top-level readme?
- harden for spaces in MakeDemoDir path (among others)
- harden makenext to not go negative or go off the end

- create init script that copies example Makefile into the current dir and creates a demosetup cover?

- Pattern to strip trailing \n?  If chunk ends with '\' can sed s/\\\n//?  or just good ol' tr -d \n and just use it for things that ought to be one line anyway?
- Pattern for "run in new Terminal"

### Doneyard
- DONE: include meta targets
- DONE: include seq aliases

- DONE: manage path to MakeDemo tools, makefiles, etc
  - DONE: something like . activate?
  - DONE: or maybe an 'init' that sets up a starter makefile etc.
- DONE: source completion.sh
  `complete -W "\`grep -oE '^[a-zA-Z0-9_.-]+:([^=]|$)' Makefile | sed 's/[^a-zA-Z0-9_.-]*$//'\`" make`
- PUNT: Also add MakeDemoDir to the path

- DONE: Set make shell to be bash if I'm using bashisms

- DONE: make aliases depend on Makefile and creates sequence
- DONE: sed print section pattern
  - DONE: something like `sed -n -e "/^### $Name/,/^---/ p"`  (useful to have distinct "bookend" for each section, especially the last one)
  - DONE: Work out non-bookend-including version for piping to pbcopy:
    `$ cat LessonPlan.md | sed -e'1,/^### Munging/ d' -e'/^---/,$ d'`
- DONE: better / DRYer pattern for notes?
  - NO: Maybe notes should have an ascii box around them?  Or would that be terrible?

- DONE: Better/more portable pattern for pbcopy
- DONE: This both prints (via stderr) and copies:
  `$ echo "hello" | tee /dev/fd/2 | pbcopy`
  DONE: Better: `$ echo "hello" | tee >(tr -d '\n' | pbcopy)` this strips all \n, just use `| tee >(pbcopy)``

---
