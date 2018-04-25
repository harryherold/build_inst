# build_inst
A lightweight shell based build infrastructure for Linux systems.

Build recipes are located in ```build``` and has the extension ```*.blt.sh```.
The ```build_inst.sh``` executes four steps which can be overwritten by the regarding recipe
and provides the following defaults:
  - prepare_build: *empty*
  - configure_build: *empty* 
  - make_build: *make -j5*
  - install_build: *make install*

When ```build_inst.sh``` gets no arguments, it executes all recipes(*.blt.sh) in builds folder.
However the script also takes a list of recipes(just the name without .blt.sh extension)
that should be used.
