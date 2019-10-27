# Fresh Catalina Terminal Setup

## Clean Install macOS Catalina

* Backup files
* Restart and then press `⌘ + ⌥ + R` at startup chime
* Wait for latest macOS to download on wifi
* Erase all volumes in Disk Utility and install Catalina

## Installing tools

Our main goal is to keep our development tools separate from system tools.  
First step for this is installing homebrew.  
```bash
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
Next install a bunch of stuff, that is needed using brew.  
```bash
brew cask install iterm2
brew install python
brew cask install sublime-text
brew install vim nano bash zsh
```
All these tools will be in `/usr/local/bin` which doesn't require `sudo`.  
Change the default login shell in `Users and Groups > Advanced Options` to `/usr/local/bin/zsh`.  
Add the following line in `~/.zshrc`.  
```bash
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
```
This will first look for brewed binaries before system binaries.  
```bash
# User settings
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"
```

### Vim Warnings

If you get warnings while opening vim like this:  
```bash
Warning: Failed to set locale category LC_NUMERIC to en_CH.
Warning: Failed to set locale category LC_TIME to en_CH.
Warning: Failed to set locale category LC_COLLATE to en_CH.
Warning: Failed to set locale category LC_MONETARY to en_CH.
Warning: Failed to set locale category LC_MESSAGES to en_CH.
```
Add this to your `~/.zshrc`
```bash
export LC_ALL=en_US.UTF-8
```

## Setting up SSH and GPG keys

Install gnupg first.  
```bash
brew install gpg
```
Follow [this](https://help.github.com/en/github/authenticating-to-github/managing-commit-signature-verification) documentation for GPG keys and [this](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh) for SSH keys 

If you want to transfer gpg keys from backup or old computer.  

### Export keys (backup)
Import gpg keys from another computer. First lets get the key id.  
```bash
~ ❯ gpg --list-secret-keys --keyid-format LONG
/Users/Madhav/.gnupg/pubring.kbx
--------------------------------
sec   rsa4096/2E214BB6870E6584 2019-10-27 [SC]
      D633155EE585A691DE7B33602E214BB6870E6584
uid                 [ultimate] Madhav Tummala (Git) <madhavtummala@icloud.com>
ssb   rsa4096/FBB5221605FB333C 2019-10-27 [E]
```
Here, the keyid is `2E214BB6870E6584`.
Now, to export
```bash
gpg --armor --export <key-id> > public.asc
gpg --armor --export-secret-key <key-id> > private.asc
```

### Import keys
```bash
gpg --import private.asc
```
You will require to enter the pass-phrase while importing and exporting, so please remember the pass-phrase.
To edit the pass-phrase, after importing, 

### Changing the Passphrase
```bash
gpg --edit-key <key-id>
gpg> passwd #set the new pass-phrase
ggp> save
```

### Commit singing error
```bash
backup ❯ git commit -m 'added new gpg key'                               master
error: gpg failed to sign the data
fatal: failed to write commit object
```
Add this to your `~/.zshrc`
```bash
export GPG_TTY=$(tty)
```

## Set Up ZSH
Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh).  

### zsh theme
We will use my theme called [clear](https://github.com/MadhavChoudhary/clear).  
```bash
wget -O $ZSH_CUSTOM/themes/common.zsh-theme https://raw.githubusercontent.com/madhavchoudhary/clear/master/clear.zsh-theme
```
Set `ZSH_THEME="clear"` in `~/.zshrc`. For reference the final `~/.zshrc` file will look like:  
```bash
# Oh-my-zsh settings
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="clear"
plugins=(git zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# User settings
alias python="/usr/local/bin/python3"
alias pip="/usr/local/bin/pip3"
alias lc="colorls"
export LC_ALL=en_US.UTF-8
export GPG_TTY=$(tty)
export PATH=/usr/local/bin:/usr/local/sbin:$PATH
```

### iterm2 profile
You can import the [Mad](Mad.json) iTerm Profile inlcuded. It also has all the good keyboard shortcuts set.  
If you want to set your profile manually, these are the shortcuts I used.  

| Description | Keyboard Combination | Action | Code |
| --- | --- | --- | --- |
| Move cursor one word left | ⌥ + ← | Send Escape Sequence | Esc+ `b` |
| Move cursor one word right | ⌥ + → | Send Escape Sequence | Esc+ `f` |
| Move cursor to beginning of line  | ⌘ + ← | Send Hex Code | 0x01 |
| Move cursor to end of line  | ⌘ + → | Send Hex Code | 0x05 |
| Delete word | ⌥ + ←Delete | Send Hex Code | 0x1b 0x08 |
| Delete line | ⌘ + ←Delete | Send Hex Code | 0x15 |
| Undo | ⌘ + z | Send Hex Code | 0x1f |
| Select by word left | ⌥ + ⇧ + ←  | Move Start of Selection Back, Move by word  | - |
| Select by word right  | ⌥ + ⇧ + →  | Move End of Selection Forward, Move by word  | - |
| Select by line left | ⌘ + ⇧ + ←   | Move Start of Selection Back, Move by line  | - |
| Select by line right | ⌘ + ⇧ + →  | Move End of Selection Forward, Move by line  | - | 
