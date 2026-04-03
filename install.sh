#!/bin/bash

# Codex Now - One-click installer
# Based on Claude Code Now by orange2ai (https://github.com/orange2ai/claude-code-now)

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
NC='\033[0m'

REPO_URL="https://github.com/patchescamerababy/codex-now"
API_URL="https://api.github.com/repos/patchescamerababy/codex-now/releases/latest"
APP_NAME="Codex Now.app"
INSTALL_DIR="/Applications"

show_welcome() {
    clear
    echo -e "${BLUE}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     >_ Codex Now                            ║"
    echo "║                                                              ║"
    echo "║         The Fastest OpenAI Codex CLI Launcher                ║"
    echo "║              One-Click Install Script                        ║"
    echo "║                                                              ║"
    echo "║    Inspired by claude-code-now by orange2ai                  ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
}

check_system() {
    echo -e "${BLUE}Checking system requirements...${NC}"
    if [[ "$(uname)" != "Darwin" ]]; then
        echo -e "${RED}Error: This installer only supports macOS${NC}"
        exit 1
    fi
    macos_version=$(sw_vers -productVersion)
    echo -e "${GREEN}macOS version: $macos_version${NC}"

    if ! command -v codex >/dev/null 2>&1; then
        echo -e "${YELLOW}Warning: OpenAI Codex CLI not found${NC}"
        echo -e "${YELLOW}Install it first: brew install --cask codex${NC}"
        echo -e "${YELLOW}Or: npm install -g @openai/codex${NC}"
    else
        echo -e "${GREEN}Codex CLI found: $(which codex)${NC}"
    fi
    echo ""
}

install_app() {
    echo -e "${BLUE}Installing Codex Now...${NC}"

    SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

    if [ -d "$SCRIPT_DIR/$APP_NAME" ]; then
        if [ -d "$INSTALL_DIR/$APP_NAME" ]; then
            rm -rf "$INSTALL_DIR/$APP_NAME"
        fi
        cp -R "$SCRIPT_DIR/$APP_NAME" "$INSTALL_DIR/"
        chmod +x "$INSTALL_DIR/$APP_NAME/Contents/MacOS/"*
        echo -e "${GREEN}Installed to $INSTALL_DIR/$APP_NAME${NC}"
    else
        echo -e "${RED}Error: $APP_NAME not found in current directory${NC}"
        exit 1
    fi
    echo ""
}

show_completion() {
    echo -e "${GREEN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                  Installation Complete!                      ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo ""
    echo -e "${BLUE}Location:${NC} $INSTALL_DIR/$APP_NAME"
    echo ""
    echo -e "${PURPLE}Usage:${NC}"
    echo "1. Drag to Dock from Applications, click to launch"
    echo "2. Hold Command and drag to Finder toolbar for folder-aware launch"
    echo ""
    echo -e "${YELLOW}Note:${NC} Launches Codex with --dangerously-bypass-approvals-and-sandbox"
    echo ""
    echo -e "${GREEN}Enjoy! Inspired by the amazing claude-code-now by orange2ai${NC}"
}

main() {
    show_welcome
    check_system
    install_app
    show_completion
}

main "$@"
