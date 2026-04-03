#!/bin/bash

# 🖥 Codex Now - Launch OpenAI Codex CLI instantly
# Based on Claude Code Now by orange2ai (https://github.com/orange2ai/claude-code-now)
# Shell script to launch Codex in current directory

# Detect and add nvm Node.js path dynamically
NVM_NODE_PATH=""
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" 2>/dev/null || true
    if command -v nvm >/dev/null 2>&1; then
        CURRENT_NODE_VERSION=$(nvm current 2>/dev/null | grep -v 'none' | head -1 || "")
        if [ -n "$CURRENT_NODE_VERSION" ] && [ "$CURRENT_NODE_VERSION" != "none" ] && [ "$CURRENT_NODE_VERSION" != "system" ]; then
            NVM_NODE_PATH="$HOME/.nvm/versions/node/$CURRENT_NODE_VERSION/bin"
        fi
    fi
    if [ -z "$NVM_NODE_PATH" ]; then
        LATEST_NODE_VERSION=$(ls "$HOME/.nvm/versions/node/" 2>/dev/null | sort -V | tail -1 || echo "")
        if [ -n "$LATEST_NODE_VERSION" ]; then
            NVM_NODE_PATH="$HOME/.nvm/versions/node/$LATEST_NODE_VERSION/bin"
        fi
    fi
fi

if [ -n "$NVM_NODE_PATH" ]; then
    export PATH="$NVM_NODE_PATH:$HOME/.npm-global/bin:$HOME/.npm/bin:$HOME/.local/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/share/npm/bin:$PATH"
else
    export PATH="$HOME/.npm-global/bin:$HOME/.npm/bin:$HOME/.local/bin:/usr/local/bin:/opt/homebrew/bin:/usr/local/share/npm/bin:$PATH"
fi

LAST_DIR_FILE="$HOME/.codex-now-last-dir"

if [ -n "$1" ]; then
    TARGET_DIR="$1"
elif [ -f "$LAST_DIR_FILE" ]; then
    TARGET_DIR=$(cat "$LAST_DIR_FILE")
else
    TARGET_DIR="$HOME"
fi

if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Directory '$TARGET_DIR' does not exist"
    exit 1
fi

cd "$TARGET_DIR" || exit 1

echo "🖥 Launching Codex in '$TARGET_DIR'..."

CODEX_PATH=""
if command -v codex >/dev/null 2>&1; then
    CODEX_PATH=$(command -v codex)
fi

if [ -z "$CODEX_PATH" ]; then
    for path in "/opt/homebrew/bin/codex" "$HOME/.npm-global/bin/codex" "$HOME/.npm/bin/codex" "/usr/local/bin/codex" "$HOME/.local/bin/codex"
    do
        if [ -f "$path" ] && [ -x "$path" ]; then
            CODEX_PATH="$path"
            break
        fi
    done
fi

if [ -z "$CODEX_PATH" ]; then
    echo "Error: OpenAI Codex CLI not found"
    echo ""
    echo "Install via Homebrew (recommended):"
    echo "  brew install --cask codex"
    echo ""
    echo "Or via npm:"
    echo "  npm install -g @openai/codex"
    exit 1
fi

echo "Found Codex: $CODEX_PATH"
echo "$TARGET_DIR" > "$LAST_DIR_FILE"

"$CODEX_PATH" --dangerously-bypass-approvals-and-sandbox
