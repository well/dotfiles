# How you get it

Run the following in a terminal:

    bash <(curl http://github.com/mtrudel/dotfiles/raw/master/bootstrap.sh)

*Beware* that this will overwrite any changes you've made to your dotfiles. 
Your original files (if present) will be left in place with a .orig extension.
 
# What you get

## New Commands

    ssh-copy-id:				copies your public key to the indicated server. Only installed if your system doesn't have it by default

## Sensible Defaults

Sensible sorting defaults for common commands (`ls`, `df`, etc) are aliased by default
`ls` now has similar workalikes in `l`, `ll` and `dir`

`cd` now prints a directory listing after every directory change. 

## Command Completion

A local copy of `bash_completion` has been installed. This provides context sensitive argument expansion (for example, try tab completing host names on an ssh command)

Note that if a machine already has global bash completion installed (in `/etc/bash_completion`) then the local completion included herein is turned off.

## Automatic updates

You can get the latest version of dotfiles at any time by running `dotfiles update`. 

## Directory Stacks

The `cd` command now tracks directories you move in and out of. To pop the stack and go back to directories you were just in, run `popd` (or its alias, `cdb`). 

# Making local mods
These scripts evaluate `.bashrc.local`, which can be used to hold commands 
specific to a given machine. Note that the `.bashrc.local` file is NOT managed
by dotfiles.
