#!/bin/zsh

# Set workspace project location
WORKSPACE_DIR="$HOME/workspace"
THEME_NAME="prpl"
VERSION="0.0.1"
EXT_NAME="${THEME_NAME}-theme"
EXT_DIR="${WORKSPACE_DIR}/${EXT_NAME}"
THEME_FILE="${THEME_NAME}-color-theme.json"

# Create the extension directory structure
mkdir -p "${EXT_DIR}/themes"

# Create a minimal package.json with GitHub repository info
cat > "${EXT_DIR}/package.json" <<EOF
{
  "name": "${EXT_NAME}",
  "displayName": "prpl Theme",
  "description": "it is prpl",
  "version": "${VERSION}",
  "repository": {
    "type": "git",
    "url": "https://github.com/ocodo/prpl-theme.git"
  },
  "engines": {
    "vscode": "^1.70.0"
  },
  "categories": ["Themes"],
  "contributes": {
    "themes": [
      {
        "label": "prpl",
        "uiTheme": "vs-dark",
        "path": "./themes/${THEME_FILE}"
      }
    ]
  }
}
EOF

echo "\n✅ Created theme project at: ${EXT_DIR}"
echo "👉 Now copy your theme file to:"
echo "   ${EXT_DIR}/themes/${THEME_FILE}"

echo "\n📦 To package and install locally (in WSL2):"
echo "   cd ${EXT_DIR}"
echo "   vsce package"
echo "   code --install-extension ${EXT_NAME}-${VERSION}.vsix"

echo "\n📡 To install remotely:"
echo "   scp ${EXT_DIR}/${EXT_NAME}-${VERSION}.vsix user@remote:~/workspace/"
echo "   ssh user@remote"
echo "   code --install-extension ~/workspace/${EXT_NAME}-${VERSION}.vsix"

echo "\n💡 If you haven't already, install vsce with:"
echo "   npm install -g @vscode/vsce"
