# >_ Codex Now

**Launch OpenAI Codex CLI in 3 seconds with full bypass mode** 

---

## Credits & Inspiration

This project is a fork/adaptation of the excellent [**claude-code-now**](https://github.com/orange2ai/claude-code-now) by [**@orange2ai**](https://github.com/orange2ai). 

The original `claude-code-now` is hands-down the best CLI launcher I've used — simple, fast, and elegant. 5,000+ users can't be wrong. If you use Claude Code, go star their repo right now: [github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)

I needed the same experience for **OpenAI Codex CLI**, so I vibed this adaptation. All credit for the core concept, architecture, and terminal detection logic goes to orange2ai.

---

## What Does It Do?

One click to launch `codex --dangerously-bypass-approvals-and-sandbox` in any folder.

**Without Codex Now:**
```
Open Terminal -> cd /path/to/project -> codex --dangerously-bypass-approvals-and-sandbox -> Wait...
```

**With Codex Now:**
```
Click icon -> Start coding
```

| | Traditional | Codex Now |
|---|---|---|
| Time | ~30s | ~3s |
| Steps | 4-5 | 1 |

---

## Features

- **One-click launch** from Dock or Finder toolbar
- **Smart folder context** — launches Codex in the current Finder directory
- **Full bypass mode** — `--dangerously-bypass-approvals-and-sandbox` enabled by default
- **Multi-terminal support** — Terminal, iTerm2, Warp, Alacritty
- **Zero configuration** — works immediately after install
- **Auto-detects Codex** — Homebrew, npm, nvm, yarn, pnpm installations

---

## Install

### Option 1: Download & Drag

1. Download the latest release
2. Unzip and drag `Codex Now.app` to `/Applications`
3. Done

### Option 2: CLI Install

```bash
git clone https://github.com/patchescamerababy/codex-now.git
cd codex-now
chmod +x install.sh
./install.sh
```

### Prerequisites

Install OpenAI Codex CLI first:

```bash
# Recommended
brew install --cask codex

# Or via npm
npm install -g @openai/codex
```

---

## Usage

### Dock Launch
Drag `Codex Now.app` from Applications to your Dock. Click to launch — opens Codex in your last-used directory.

### Finder Toolbar Launch (Recommended)
Hold `Command` and drag the app to the Finder toolbar. Click it in any folder to launch Codex right there.

---

## How It Works

The app is a lightweight macOS `.app` bundle wrapping a shell script that:

1. Detects your preferred terminal (iTerm2 > Warp > Terminal)
2. Gets the current Finder directory (or last-used directory)
3. Finds the Codex binary (checks PATH, Homebrew, npm, nvm, etc.)
4. Launches `codex --dangerously-bypass-approvals-and-sandbox` in that directory

---

## Differences from claude-code-now

| | claude-code-now | codex-now |
|---|---|---|
| CLI Tool | Claude Code (`claude`) | OpenAI Codex (`codex`) |
| Launch Mode | `--permission-mode bypassPermissions` | `--dangerously-bypass-approvals-and-sandbox` |
| Install Methods | Homebrew, npm | Same |

Everything else — terminal detection, folder awareness, Dock/toolbar integration — works identically. Thank you orange2ai for the brilliant foundation.

---

## License

MIT License. See [LICENSE](LICENSE) for details.

Based on [claude-code-now](https://github.com/orange2ai/claude-code-now) by [@orange2ai](https://github.com/orange2ai).
