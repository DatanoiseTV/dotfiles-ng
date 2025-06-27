# Modern Dotfiles for Multi-Disciplinary Developers

A comprehensive and blazingly fast Zsh configuration designed for developers who work across multiple domains: **Embedded C++**, **Go**, **Vue.js**, **DevOps**, and **System Administration**.

## Features

### Beautiful & Informative Prompt
- Clean, colorful prompt with git branch information
- Real-time timestamp display
- Cross-platform compatibility (macOS & Linux)

### Performance Optimized
- Fast completion caching
- Intelligent history management (50k entries)
- Optimized for large codebases

### Development Tools Integration
- **Git**: 40+ aliases for efficient workflow
- **Tmux**: Session management with predefined development layouts
- **C++**: CMake, debugging, embedded development focus
- **Go**: Testing, benchmarking, module management
- **Vue.js**: NPM/Yarn shortcuts, development servers
- **Docker/K8s**: Container management shortcuts
- **Claude Code**: AI-powered development assistance

### Quick Project Setup
- `mkcpp <name>` - C++ project with CMake
- `mkgo <name>` - Go project with modules
- `mkproject <name>` - Generic project with git

### System Administration
- Cross-platform aliases that work on both macOS and Linux
- Network tools, process management, log monitoring
- Archive extraction for multiple formats

## Quick Start

### macOS Installation

```bash
# Clone the repository
git clone https://github.com/DatanoiseTV/dotfiles-ng.git ~/.dotfiles
cd ~/.dotfiles

# Run the macOS setup script (installs essential tools via Homebrew)
./install-macos.sh

# Install the configurations
cp .zshrc ~/.zshrc
cp .tmux.conf ~/.tmux.conf

# Reload your shell
source ~/.zshrc
```

### Manual Installation

```bash
# Clone and copy configuration
git clone https://github.com/DatanoiseTV/dotfiles-ng.git ~/.dotfiles
cp ~/.dotfiles/.zshrc ~/.zshrc
source ~/.zshrc
```

## Usage Guide

### Essential Commands

Type `help` in your terminal to see all available commands and shortcuts.

### Git Workflow (Microcommits & Professional Development)
```bash
# Quick status and operations
gs              # git status
gd              # git diff
ga file.go      # git add file.go
gcm "message"   # git commit -m "message"

# Branch management
gcb feature-x   # git checkout -b feature-x
gcom            # git checkout main
gp              # git push

# Quick workflows
quick           # add all, commit "WIP", push
save            # add all, commit "Save progress"
sync            # add all, commit "Sync", pull, push
```

### Development Shortcuts
```bash
# C++ Development
cmake-debug     # Configure with debug flags
make-j          # Parallel make using all CPU cores
buildrun app    # Build and run C++ project

# Go Development
go-test         # Run all tests with verbose output
go-cover        # Generate coverage report
go-deps         # Tidy and download dependencies

# Vue.js Development
nrd             # npm run dev
nrb             # npm run build
nrt             # npm run test
```

### Claude Code Integration
```bash
# Code assistance
claude-go       # Get help with Go code
claude-cpp      # Get help with C++ code (embedded focus)
claude-vue      # Get help with Vue.js code

# Debugging
claude-debug-go     # Debug Go issues
claude-debug-cpp    # Debug C++ issues

# Security & Quality
claude-security     # Security audit
claude-privacy      # Privacy compliance check
claude-refactor     # Code refactoring suggestions
claude-env         # Analyze environment files

# Project templates
claude-webapp       # Full-stack Go + Vue app
claude-api          # REST API with Go
claude-cli          # CLI app with Cobra
claude-embedded     # Embedded C++ project
```

### System Administration
```bash
# Process management
htop            # System monitor
psg pattern     # Find processes by pattern
killbyname app  # Kill processes by name

# Network
ports           # Show listening ports
ping google.com # Ping with 5 packets

# File operations
ll              # Detailed file listing
extract file.tar.gz  # Extract any archive format
backup file.txt # Create .bak copy
```

## Design Philosophy

### Professional Development Workflow
- **Microcommits**: Encourages frequent, small commits
- **Feature Branches**: Built-in support for git-flow workflow
- **Cross-platform**: Works seamlessly on macOS and Linux
- **No Bloat**: Only essential tools, no unnecessary dependencies

### Multi-Domain Focus
- **Embedded Systems**: C++ with hardware abstraction focus
- **Backend Development**: Go with modern practices
- **Frontend Development**: Vue.js with performance optimization
- **DevOps**: Container orchestration and deployment
- **System Administration**: Network and process management

### Performance First
- Fast shell startup (<100ms)
- Efficient completion system
- Optimized for large repositories
- Minimal external dependencies

## Customization

### Local Customizations
Create `~/.zshrc.local` for personal customizations that won't be overwritten:

```bash
# Example local customizations
export CUSTOM_VAR="value"
alias myalias="my command"
```

### Work-Specific Settings
Create `~/.zshrc.work` for work-specific configurations:

```bash
# Example work customizations
export WORK_API_KEY="secret"
alias deploy="kubectl apply -f"
```

## What Gets Installed (macOS)

The `install-macos.sh` script installs only essential tools:

- **Development**: git, cmake, go, node, postgresql@17
- **Utilities**: ripgrep, tree, htop
- **Node Version Management**: NVM

No bloatware, no unnecessary GUI applications.

## Requirements

- **Zsh** (5.0+)
- **Git** (2.0+)
- **macOS** (10.15+) or **Linux** (Ubuntu 18.04+, CentOS 7+)

Optional but recommended:
- **Homebrew** (macOS)
- **Claude Code** (for AI assistance)

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test on both macOS and Linux if possible
5. Commit with descriptive messages
6. Push and create a Pull Request

## License

MIT License - feel free to use and modify for your own needs.

## Acknowledgments

Built for developers who value efficiency, performance, and professional workflows. Optimized for modern development practices including microservices, embedded systems, and full-stack web development.