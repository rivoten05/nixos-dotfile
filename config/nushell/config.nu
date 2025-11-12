def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

# Navigation
alias e = exit
alias . = cd ..
alias .. = cd ../.. 
alias ... = cd ../../..
alias p = pwd

#Editor
alias v = nvim
alias vi = nvim

# Git (Enhanced)
alias gc = git commit -m
alias gp = git push
alias ga = git add .
alias gpl = git pull
alias gs = git status
alias gss = gss  # Use our custom git status
alias gcl = git clone
alias gr = git restore
alias gi = git init
alias gd = git diff
alias gco = git checkout
alias gb = git branch
alias gl = git log --oneline --graph --all

# Misc Utilities
alias hist = history
alias cls = clear
alias c = clear
alias time = timeit 

# Environment variables
$env.EDITOR = "nvim"
$env.VISUAL = "nvim"
$env.BAT_THEME = "TwoDark"
$env.MANPAGER = "sh -c 'col -bx | bat -l man -p'"
$env.config.buffer_editor = "nvim"
$env.config.show_banner = false


# Quick directory listing with icons (simplified)
def lsg [] {
    ls | each {|file|
        let extension = ($file.name | path parse | get extension)
        let icon = match $extension {
            "nu" => "🐚",
            "rs" => "🦀", 
            "py" => "🐍",
            "js" => "📜",
            "ts" => "📘",
            "md" => "📝",
            "txt" => "📄",
            "zip" => "📦",
            "pdf" => "📕",
            _ => { if $file.type == "dir" { "📁" } else { "📄" } }
        }
        $"($icon) ($file.name)"
    }
}

# Enhanced git status with formatting
def gss [] {
    git status -s | lines | each {|line|
        let parts = ($line | split row ' ')
        let status = $parts.0
        let file = $parts.1
        match $status {
            "M" => { $"[(ansi green)modified(ansi reset)] ($file)" }
            "A" => { $"[(ansi yellow)added(ansi reset)] ($file)" }
            "D" => { $"[(ansi red)deleted(ansi reset)] ($file)" }
            "??" => { $"[(ansi blue)untracked(ansi reset)] ($file)" }
            _ => $line
        }
    }
}


# Quick directory navigation
def q [dir: string] {
    let target = match $dir {
        "d" => "~/Downloads",
        "c" => "~/.config",
        "p" => "~/Projects",
        "doc" => "~/Documents",
        _ => $dir
    }
    cd $target
}

