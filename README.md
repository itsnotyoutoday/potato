# **Potato** MUSH Client
### *A Graphical MUSH Client for Windows, Linux and Mac OS X*

**Potato** is a cross-platform graphical MUSH client written in Tcl/Tk.

The latest version can be download from the [Potato website](http://www.potatomushclient.com/downloads), or [checked out from GIT](https://github.com/potatomushclient/potato/wiki/RunFromSource#git-1).

Please see [the wiki](https://github.com/potatomushclient/potato/wiki) for more information.

## macOS (osx branch)

```
brew install tcl-tk@8
./build-osx.sh        # produces build/Potato.app
open build/Potato.app
```
Or run from source: `$(brew --prefix tcl-tk@8)/bin/wish8.6 potato.vfs/main.tcl`
