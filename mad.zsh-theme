# vim: filetype=sh

# Prompt symbol
COMMON_PROMPT_SYMBOL="❯"

# Colors
COMMON_COLORS_GIT_STATUS_DEFAULT=green
COMMON_COLORS_GIT_STATUS_STAGED=red
COMMON_COLORS_GIT_STATUS_UNSTAGED=yellow
COMMON_COLORS_GIT_PROMPT_SHA=green

# Left Prompt
 PROMPT='$(os_icon)$(common_host)$(common_current_dir)$(common_bg_jobs)$(common_return_status)'

# Right Prompt
 RPROMPT='$(zsh_command_time)$(common_git_status)'

# Icon
os_icon() {
  echo "%{$fg[gray42]%}\ue711 "
}

# Host
common_host() {
  echo -n "%{$fg[gray42]%}$SHORT_HOST "
}

# Current directory
common_current_dir() {
  echo -n "%{$fg[green]%}%c "
}

# Prompt symbol
common_return_status() {
  echo -n "%(?.%F{yellow}.%F{red})$COMMON_PROMPT_SYMBOL%f "
}

# Git status
common_git_status() {
    local message=""
    local message_color="%F{$COMMON_COLORS_GIT_STATUS_DEFAULT}"

    # https://git-scm.com/docs/git-status#_short_format
    local staged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU]")
    local unstaged=$(git status --porcelain 2>/dev/null | grep -e "^[MADRCU? ][MADRCU?]")

    if [[ -n ${staged} ]]; then
        message_color="%F{$COMMON_COLORS_GIT_STATUS_STAGED}"
    elif [[ -n ${unstaged} ]]; then
        message_color="%F{$COMMON_COLORS_GIT_STATUS_UNSTAGED}"
    fi

    local branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [[ -n ${branch} ]]; then
        message+="${message_color}\ue725 ${branch}%f"
    fi

    echo -n "${message}"
}

# Git prompt SHA
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{%F{$COMMON_COLORS_GIT_PROMPT_SHA}%}"
ZSH_THEME_GIT_PROMPT_SHA_AFTER="%{$reset_color%} "

# Background Jobs
common_bg_jobs() {
  bg_status="%{$fg[yellow]%}%(1j.↓%j .)"
  echo -n $bg_status
}

# Command execution time
zsh_command_time() {
    if [ -n "$ZSH_COMMAND_TIME" ]; then
        hours=$(($ZSH_COMMAND_TIME/3600))
        min=$(($ZSH_COMMAND_TIME/60))
        sec=$(($ZSH_COMMAND_TIME%60))
        echo -n "%{$fg[cyan]%}\uf252 $hours:$min:$sec "
    fi
}
