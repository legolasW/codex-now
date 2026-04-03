# >_ Codex Now

**一键启动 OpenAI Codex CLI，全自动绕过审批模式**

---

## 致谢

本项目基于 [**claude-code-now**](https://github.com/orange2ai/claude-code-now)（作者 [**@orange2ai**](https://github.com/orange2ai)）改编而来。

原版 `claude-code-now` 是我用过最好的 CLI 启动器 — 简单、快速、优雅，5000+ 用户的选择。如果你用 Claude Code，强烈推荐去 star 他们的仓库：[github.com/orange2ai/claude-code-now](https://github.com/orange2ai/claude-code-now)

我需要一个同样体验的 **OpenAI Codex CLI** 版本，所以 Vibe 了这个适配版。核心概念、架构设计、终端检测逻辑全部归功于 orange2ai。

---

## 它做什么？

一键启动 `codex --dangerously-bypass-approvals-and-sandbox`，在任意文件夹中。

| | 传统方式 | Codex Now |
|---|---|---|
| 耗时 | ~30 秒 | ~3 秒 |
| 步骤 | 4-5 步 | 1 步 |

---

## 功能特性

- **一键启动** — 从 Dock 或 Finder 工具栏点击即用
- **智能目录感知** — 自动在当前 Finder 目录启动 Codex
- **全自动模式** — 默认启用 `--dangerously-bypass-approvals-and-sandbox`
- **多终端支持** — Terminal、iTerm2、Warp、Alacritty
- **零配置** — 安装即用
- **自动检测 Codex** — 支持 Homebrew、npm、nvm、yarn、pnpm 安装方式

---

## 安装

### 方式一：下载拖拽

1. 下载最新 Release
2. 解压后将 `Codex Now.app` 拖到 `/Applications`
3. 完成

### 方式二：命令行安装

```bash
git clone https://github.com/patchescamerababy/codex-now.git
cd codex-now
chmod +x install.sh
./install.sh
```

### 前置条件

先安装 OpenAI Codex CLI：

```bash
# 推荐
brew install --cask codex

# 或通过 npm
npm install -g @openai/codex
```

---

## 使用方法

### Dock 启动
将 `Codex Now.app` 从应用程序拖到 Dock。点击启动，自动在上次使用的目录打开 Codex。

### Finder 工具栏启动（推荐）
按住 `Command` 键，将 app 拖到 Finder 工具栏。在任意文件夹点击即可在当前目录启动 Codex。

---

## 许可

MIT License

基于 [claude-code-now](https://github.com/orange2ai/claude-code-now)（[@orange2ai](https://github.com/orange2ai)）。
