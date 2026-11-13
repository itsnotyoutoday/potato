#!/bin/bash
# Build Potato.app for macOS (native arm64/x86_64 via Homebrew).
# Requires modern Tcl/Tk 9 and TLS:  brew install tcl-tk tcltls
set -e
cd "$(dirname "$0")"
TK="$(brew --prefix tcl-tk)"; TLS="$(brew --prefix tcltls)"
WISH="${WISH:-$TK/bin/wish}"
[ -x "$WISH" ] || { echo "wish not found; run: brew install tcl-tk tcltls"; exit 1; }
[ -d "$TLS/lib" ] || { echo "tcltls not found; run: brew install tcltls"; exit 1; }
APP=build/Potato.app
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
cp -R potato.vfs "$APP/Contents/Resources/potato.vfs"
cp potato.vfs/lib/app-potato/macosx/potato.icns "$APP/Contents/Resources/"
VER=$(grep -oE '2\.[0-9]+\.[0-9]+[a-z0-9]*' potato.vfs/lib/potato-version.tcl | head -1)
cat > "$APP/Contents/Info.plist" <<PL
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0"><dict>
<key>CFBundleName</key><string>Potato</string>
<key>CFBundleExecutable</key><string>Potato</string>
<key>CFBundleIdentifier</key><string>com.potatomushclient.potato</string>
<key>CFBundleIconFile</key><string>potato</string>
<key>CFBundleShortVersionString</key><string>${VER:-2.0}</string>
<key>CFBundlePackageType</key><string>APPL</string>
<key>NSHighResolutionCapable</key><true/>
</dict></plist>
PL
cat > "$APP/Contents/MacOS/Potato" <<LA
#!/bin/bash
D="\$(cd "\$(dirname "\$0")/../Resources" && pwd)"
export TCLLIBPATH="$TLS/lib"
exec "$WISH" "\$D/potato.vfs/main.tcl" "\$@"
LA
chmod +x "$APP/Contents/MacOS/Potato"
echo "Built $APP"
