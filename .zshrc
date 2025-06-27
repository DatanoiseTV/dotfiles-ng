# ============================================================================
# Zsh Configuration for Multi-Disciplinary Developer
# Embedded C++, Go, Vue, DevOps, SysAdmin
# ============================================================================

# Performance: Enable completion caching
autoload -Uz compinit
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# History Configuration
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

# Directory Navigation
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Completion Options
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END
setopt AUTO_MENU
setopt AUTO_LIST
setopt AUTO_PARAM_SLASH
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'

# ============================================================================
# PROMPT CONFIGURATION
# ============================================================================

autoload -U colors && colors

# Git prompt function
git_prompt_info() {
    local ref
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    echo " %F{yellow}(${ref#refs/heads/})%f"
}

# Build the prompt
setopt PROMPT_SUBST
PROMPT='%F{green}➜%f %F{cyan}%2~%f$(git_prompt_info) %F{red}❯%f '
RPROMPT='%F{magenta}%T%f'

# ============================================================================
# ENVIRONMENT VARIABLES
# ============================================================================

# Editor preferences
export EDITOR='vim'
export VISUAL='vim'

# Development paths (cross-platform)
export GOPATH="$HOME/go"
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS with Homebrew
    export GOROOT="$(brew --prefix)/opt/go/libexec"
    export PATH="/opt/homebrew/bin:$GOROOT/bin:$GOPATH/bin:$PATH"
else
    # Linux
    export GOROOT="/usr/local/go"
    export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
fi

# C++ development
export CC=clang
export CXX=clang++
export CMAKE_EXPORT_COMPILE_COMMANDS=1

# Node.js and Vue development
export NODE_ENV=development
export PATH="$HOME/.npm-global/bin:$PATH"

# PostgreSQL (cross-platform)
if [[ "$OSTYPE" == "darwin"* ]]; then
    export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
else
    export PATH="/usr/lib/postgresql/17/bin:$PATH"
fi

# Docker
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# ============================================================================
# ALIASES - GENERAL
# ============================================================================

# Basic commands
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -- -='cd -'

# File operations
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -pv'

# System monitoring (cross-platform)
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias htop='htop'
    alias free='vm_stat'
    alias ports='netstat -tulan'
else
    alias htop='htop -C'
    alias free='free -h'
    alias ports='netstat -tulanp'
fi
alias df='df -h'
alias du='du -h'
alias ps='ps auxf'
alias psg='ps aux | grep -v grep | grep -i -e VSZ -e'

# Network
alias ping='ping -c 5'
alias wget='wget -c'

# ============================================================================
# ALIASES - DEVELOPMENT SPECIFIC
# ============================================================================

# Git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gac='git add . && git commit -m'
alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gc='git commit -v'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gcom='git checkout main'
alias gcd='git checkout develop'
alias gd='git diff'
alias gdc='git diff --cached'
alias gds='git diff --stat'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gl='git pull'
alias glo='git pull origin'
alias glom='git pull origin main'
alias glog='git log --oneline --decorate --graph'
alias glol='git log --oneline --decorate --graph --all'
alias glog5='git log --oneline --decorate --graph -5'
alias gp='git push'
alias gpo='git push origin'
alias gpom='git push origin main'
alias gpu='git push -u origin'
alias gr='git reset'
alias grh='git reset --hard'
alias grs='git reset --soft'
alias grst='git restore'
alias gs='git status'
alias gss='git status --short'
alias gst='git stash'
alias gsta='git stash apply'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gwt='git worktree'
alias gwtl='git worktree list'
alias gwtd='git worktree remove'

# Git shortcuts for microcommits workflow
alias gac='git add . && git commit -m'
alias quick='git add . && git commit -m "WIP: quick commit" && git push'
alias save='git add . && git commit -m "Save progress"'
alias sync='git add . && git commit -m "Sync changes" && git pull && git push'

# Help function
help() {
    cat << 'EOF'
=== Git Aliases ===
g       = git
ga      = git add                    gaa     = git add --all
gac     = git add . && git commit -m
gb      = git branch                 gba     = git branch -a
gbd     = git branch -d              gbD     = git branch -D
gc      = git commit -v              gcm     = git commit -m
gca     = git commit --amend         gcan    = git commit --amend --no-edit
gco     = git checkout               gcb     = git checkout -b
gcom    = git checkout main          gcd     = git checkout develop
gd      = git diff                   gdc     = git diff --cached
gds     = git diff --stat
gf      = git fetch                  gfa     = git fetch --all
gl      = git pull                   glo     = git pull origin
glom    = git pull origin main
glog    = git log --oneline --graph  glol    = git log --graph --all
glog5   = git log --graph -5
gp      = git push                   gpo     = git push origin
gpom    = git push origin main       gpu     = git push -u origin
gr      = git reset                  grh     = git reset --hard
grs     = git reset --soft           grst    = git restore
gs      = git status                 gss     = git status --short
gst     = git stash                  gsta    = git stash apply
gstd    = git stash drop             gstl    = git stash list
gstp    = git stash pop
gwt     = git worktree               gwtl    = git worktree list
gwtd    = git worktree remove

=== Quick Git Workflows ===
quick   = add all, commit "WIP", push
save    = add all, commit "Save progress"
sync    = add all, commit "Sync", pull, push

=== Project Setup ===
mkproject <name>  = create new project with git
mkcpp <name>      = create C++ project with CMake
mkgo <name>       = create Go project with module

=== Build & Run ===
buildrun <binary> = build and run C++ project
make-j            = make with all CPU cores

=== System ===
ll, la, l         = ls variants
.., ..., ....     = navigate up directories
htop, df, du      = system monitoring
ports             = show listening ports
extract <file>    = extract any archive format
backup <file>     = create .bak copy
weather [city]    = show weather
serve [port]      = start HTTP server (default: 8000)

=== Claude Code Shortcuts ===
claude-init       = initialize project setup
claude-go         = help with Go code
claude-cpp        = help with C++ code (embedded focus)
claude-vue        = help with Vue.js code
claude-debug-go   = debug Go issues
claude-debug-cpp  = debug C++ issues
claude-refactor   = refactor code for best practices
claude-security   = audit for security vulnerabilities
claude-privacy    = review for privacy compliance
claude-readme     = update README.md
claude-test       = write comprehensive tests
claude-build      = fix build system issues

=== Claude Code App Templates ===
claude-webapp     = full-stack Go + Vue.js application
claude-api        = REST API with Go backend
claude-cli        = CLI application with Go + Cobra
claude-embedded   = embedded C++ project
claude-microservice = microservice architecture
claude-dashboard  = Vue.js dashboard with charts
claude-electron   = Electron desktop app
EOF
}

# C++ Development
alias cmake-debug='cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
alias cmake-release='cmake -DCMAKE_BUILD_TYPE=Release -DCMAKE_EXPORT_COMPILE_COMMANDS=ON'
# Cross-platform CPU count
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias make-j='make -j$(sysctl -n hw.ncpu)'
else
    alias make-j='make -j$(nproc)'
fi
alias gdb-quiet='gdb -q'
alias valgrind-full='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes'

# Go Development
alias go-test='go test -v ./...'
alias go-bench='go test -bench=.'
alias go-cover='go test -coverprofile=coverage.out ./... && go tool cover -html=coverage.out'
alias go-deps='go mod tidy && go mod download'
alias go-vet='go vet ./...'

# Node.js/Vue Development
alias ni='npm install'
alias nr='npm run'
alias nrd='npm run dev'
alias nrb='npm run build'
alias nrt='npm run test'
alias yai='yarn add'
alias yad='yarn add --dev'
alias yr='yarn run'

# Docker & DevOps
alias d='docker'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcl='docker-compose logs -f'
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgs='kubectl get services'
alias kgd='kubectl get deployments'

# System Administration (cross-platform)
if [[ "$OSTYPE" == "darwin"* ]]; then
    alias syslog='sudo tail -f /var/log/system.log'
    alias ports-listening='netstat -tuln'
    alias process-tree='pstree'
else
    alias syslog='sudo tail -f /var/log/syslog'
    alias ports-listening='ss -tuln'
    alias process-tree='pstree -p'
fi

# Claude Code project shortcuts
alias claude-init='claude --print "initialize this project with proper structure, gitignore, and development setup"'
alias claude-go='claude --print "help me with this Go code - review, optimize, and suggest improvements"'
alias claude-cpp='claude --print "help me with this C++ code - review, optimize, and suggest improvements for embedded systems"'
alias claude-vue='claude --print "help me with this Vue.js code - review components, optimize performance, and improve UX"'
alias claude-debug-go='claude --print "debug this Go issue - analyze the error, trace the problem, and provide a fix"'
alias claude-debug-cpp='claude --print "debug this C++ issue - analyze the error, check memory management, and provide a fix"'
alias claude-refactor='claude --print "refactor this code to be more modular, maintainable, and follow best practices"'
alias claude-security='claude --print "audit this code for security vulnerabilities and suggest fixes"'
alias claude-privacy='claude --print "review this code for privacy issues and data handling compliance"'
alias claude-readme='claude --print "update the README.md with current project status, installation instructions, and usage examples"'
alias claude-test='claude --print "write comprehensive tests for this code following TDD principles"'
alias claude-build='claude --print "help me set up the build system and fix any compilation issues"'

# Claude Code application templates
alias claude-webapp='claude --print "create a full-stack web application with Go backend (websockets, REST API) and Vue.js frontend with modern UI"'
alias claude-api='claude --print "create a REST API with Go, include authentication, database models, and proper error handling"'
alias claude-cli='claude --print "create a CLI application in Go with cobra, configuration management, and proper logging"'
alias claude-embedded='claude --print "create an embedded C++ project with proper hardware abstraction, real-time capabilities, and testing"'
alias claude-microservice='claude --print "create a microservice architecture with Go, Docker, and proper service communication"'
alias claude-dashboard='claude --print "create a Vue.js dashboard with charts, real-time updates, and responsive design"'
alias claude-electron='claude --print "create an Electron desktop app with Vue.js frontend and native integrations"'

# ============================================================================
# FUNCTIONS
# ============================================================================

# Check if current directory is a Claude project
is_claude_project() {
    [[ -d "CLAUDE.md" ]] && return 0 || return 1
}

# Quick project setup
mkproject() {
    mkdir -p "$1" && cd "$1"
    git init
    echo "# $1" > README.md
    echo -e "*.log\n*.tmp\n.DS_Store\nTODO.md\nSTRUCTURE.md\nCLAUDE.md" > .gitignore
    git add .
    git commit -m "Initial project setup"
    echo "Project $1 created and initialized"
}

# C++ project setup
mkcpp() {
    mkproject "$1"
    mkdir -p src include tests
    cat > CMakeLists.txt << EOF
cmake_minimum_required(VERSION 3.16)
project($1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_executable($1 src/main.cpp)
target_include_directories($1 PRIVATE include)

enable_testing()
add_subdirectory(tests)
EOF
    echo '#include <iostream>\n\nint main() {\n    std::cout << "Hello, World!" << std::endl;\n    return 0;\n}' > src/main.cpp
    git add . && git commit -m "Add C++ project structure"
}

# Go project setup
mkgo() {
    mkproject "$1"
    go mod init "$1"
    echo 'package main\n\nimport "fmt"\n\nfunc main() {\n    fmt.Println("Hello, World!")\n}' > main.go
    git add . && git commit -m "Add Go module and main file"
}

# Quick build and run for C++
buildrun() {
    local ncpu
    if [[ "$OSTYPE" == "darwin"* ]]; then
        ncpu=$(sysctl -n hw.ncpu)
    else
        ncpu=$(nproc)
    fi
    
    if [[ -f CMakeLists.txt ]]; then
        cmake -B build -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
        cmake --build build -j$ncpu
        if [[ $? -eq 0 ]]; then
            ./build/$1
        fi
    elif [[ -f Makefile ]]; then
        make -j$ncpu && ./$1
    else
        echo "No build system found"
    fi
}

# Find and kill process by name
killbyname() {
    ps aux | grep "$1" | grep -v grep | awk '{print $2}' | xargs kill -9
}

# Extract various archive formats
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Quick backup
backup() {
    cp "$1"{,.bak}
    echo "Backed up $1 to $1.bak"
}

# Weather function
weather() {
    curl -s "wttr.in/${1:-}"
}

# Quick server for current directory
serve() {
    local port="${1:-8000}"
    python3 -m http.server "$port"
}

# Analyze environment files in current directory
envcheck() {
    if [[ -f .env || -f .env.local || -f .env.production || -f .env.development ]]; then
        echo "Environment files detected:"
        [[ -f .env ]] && echo "  - .env ($(wc -l < .env | tr -d ' ') variables)"
        [[ -f .env.local ]] && echo "  - .env.local ($(wc -l < .env.local | tr -d ' ') variables)"
        [[ -f .env.development ]] && echo "  - .env.development ($(wc -l < .env.development | tr -d ' ') variables)"
        [[ -f .env.production ]] && echo "  - .env.production ($(wc -l < .env.production | tr -d ' ') variables)"
        
        # Check for common security issues
        local security_issues=0
        local sensitive_vars=0
        for envfile in .env .env.local .env.development .env.production; do
            if [[ -f "$envfile" ]]; then
                local count=$(grep -c "PASSWORD\|SECRET\|KEY\|TOKEN\|PASS=" "$envfile" 2>/dev/null || echo 0)
                sensitive_vars=$((sensitive_vars + count))
                if [[ $count -gt 0 && $security_issues -eq 0 ]]; then
                    security_issues=1
                fi
            fi
        done
        
        if [[ $security_issues -eq 1 ]]; then
            echo "  Warning: $sensitive_vars sensitive variables detected (passwords/secrets/keys/tokens)"
            echo "  Recommendation: Ensure these files are in .gitignore"
        fi
        
        # Check if .env is in .gitignore
        if [[ -f .env && -f .gitignore ]]; then
            if ! grep -q "\.env" .gitignore 2>/dev/null; then
                echo "  Warning: .env file exists but may not be in .gitignore"
            fi
        fi
    else
        echo "No environment files found in current directory"
    fi
}

# ============================================================================
# LOAD ADDITIONAL CONFIGURATIONS
# ============================================================================

# Load local customizations if they exist
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Load work-specific configurations
[[ -f ~/.zshrc.work ]] && source ~/.zshrc.work

# ============================================================================
# STARTUP MESSAGE
# ============================================================================

echo "Development environment loaded"
echo "Current directory: $(pwd)"

# Show git information
if command -v git &> /dev/null && git rev-parse --git-dir > /dev/null 2>&1; then
    echo "Git repository: $(git remote get-url origin 2>/dev/null || echo 'local only')"
    echo "Current branch: $(git branch --show-current)"
fi

# Analyze environment files
if [[ -f .env || -f .env.local || -f .env.production || -f .env.development ]]; then
    echo ""
    echo "Environment files detected:"
    [[ -f .env ]] && echo "  - .env ($(wc -l < .env | tr -d ' ') variables)"
    [[ -f .env.local ]] && echo "  - .env.local ($(wc -l < .env.local | tr -d ' ') variables)"
    [[ -f .env.development ]] && echo "  - .env.development ($(wc -l < .env.development | tr -d ' ') variables)"
    [[ -f .env.production ]] && echo "  - .env.production ($(wc -l < .env.production | tr -d ' ') variables)"
    
    # Check for common security issues
    local security_issues=0
    for envfile in .env .env.local .env.development .env.production; do
        if [[ -f "$envfile" ]]; then
            if grep -q "PASSWORD\|SECRET\|KEY\|TOKEN" "$envfile" 2>/dev/null; then
                if [[ $security_issues -eq 0 ]]; then
                    echo "  Warning: Sensitive data detected in environment files"
                    security_issues=1
                fi
            fi
        fi
    done
fi

# Show Claude project status
if [[ -d "CLAUDE.md" ]]; then
    echo "Claude Code project detected"
fi

# Load any existing conda/pyenv if available
[[ -f ~/miniconda3/etc/profile.d/conda.sh ]] && source ~/miniconda3/etc/profile.d/conda.sh
[[ -d ~/.pyenv ]] && export PATH="$HOME/.pyenv/bin:$PATH" && eval "$(pyenv init -)"

# NVM for Node.js version management
[[ -s "$HOME/.nvm/nvm.sh" ]] && source "$HOME/.nvm/nvm.sh"
[[ -s "$HOME/.nvm/bash_completion" ]] && source "$HOME/.nvm/bash_completion"