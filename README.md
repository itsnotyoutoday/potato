# **Potato** MUSH Client
### *A Graphical MUSH Client for Windows, Linux and Mac OS X*

**Potato** is a cross-platform graphical MUSH client written in Tcl/Tk.

The latest version can be download from the [Potato website](http://www.potatomushclient.com/downloads), or [checked out from GIT](https://github.com/potatomushclient/potato/wiki/RunFromSource#git-1).

Please see [the wiki](https://github.com/potatomushclient/potato/wiki) for more information.

## macOS (osx branch)

Runs natively (Apple Silicon or Intel) on modern Tcl/Tk 9 with Homebrew's `tcltls`; no bundled prebuilt binaries.

```
brew install tcl-tk tcltls
./build-osx.sh        # produces build/Potato.app
open build/Potato.app
```
Or from source: `TCLLIBPATH=$(brew --prefix tcltls)/lib $(brew --prefix tcl-tk)/bin/wish potato.vfs/main.tcl`
