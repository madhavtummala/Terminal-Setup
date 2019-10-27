# Colorful Terminal Setup with Git Info

The macOS or Linux terminal is often very confusing. With the commands, prompts, and the outputs, all alike, it becomes very difficult to distinguish one from the other.
Also, while working on git repositories, it is very helpful to see the branch you are on, and to autocomplete the Commit ID's. 
The included files provide this functionality.

1. git-completion.bash - To Tab-Completion for commitID's.
2. git-promt.sh - To Get Git-Repo Info in the promt.
3. bash_profile - A sample .bash_profile file to change the colors of different parts of the prompt.

### With Iterm
![Iterm2-Default](https://raw.githubusercontent.com/MadhavChoudhary/Terminal-Setup/master/Images/Iterm-Default.png)

### With Terminal - Oh-my-Zsh - Agnoster
![Terminal-Agnoster](https://raw.githubusercontent.com/MadhavChoudhary/Terminal-Setup/master/Images/Agnoster-OhmyZSH.png)

## Game Changers
1. Be sure to try iTerm2 and tmux, to get multiple panes and sessions.
More on it [here](https://hackernoon.com/a-gentle-introduction-to-tmux-8d784c404340)
```
	brew cask install iterm2
```
or if you don't have brew (which you should), download here - [iterm2](https://www.iterm2.com/downloads.html)

2. Try Oh My Zsh - [github_repo](https://github.com/robbyrussell/oh-my-zsh)

## Setting

## Getting Started
You could actually set up both, one for iTerm2 and other for macOS Terminal

For achieving the setup shown in images, you can use my profile files.   
[for mac os terminal](macProfile.terminal)  
[for iTerm](iTermProfile.json)  

Just install the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), keep default login shell in one and put the login command on the other as `/bin/zsh`.  
To change the default login shell to bash, run `chsh -s /bin/bash`.  
Bash shell will use `~/.bash_profile` or `~/.bashrc` for settings and zsh will use `~/.zshrc` for settings.  


## Setting up (Image 1)

Install Iterm2 from the link.

1. Clone the repository / Download individual files.
```	
	git clone https://github.com/MadhavChoudhary/Terminal-Setup.git
```	
2. Move git-completion.bash and git-prompt.sh to Home, replace path with git repo directory.
```
	cd 
	mv <path/git-completion.bash> git-completion.bash
	mv <path/git-prompt.sh> git-prompt.sh
```
3. You can check if you have a .bash_profile(for macOS)/ .bashrc(for Linux) file in home directory.
```
	ls -a
```
4. If you don't have one, you can copy this file too.
```
	mv <path/bash_profile> .bash_profile
```
   Else open the existing file and copy the contents to that file. (At the end would be fine)
```
	open '.bash_profile'
```
5. You can change the colors set in the .bash_profile file. These colors suit on a white background. Some colors are:
```
	Black       0;30     Dark Gray     1;30
	Blue        0;34     Light Blue    1;34
	Green       0;32     Light Green   1;32
	Cyan        0;36     Light Cyan    1;36
	Red         0;31     Light Red     1;31
	Purple      0;35     Light Purple  1;35
	Brown       0;33     Yellow        1;33
	Light Gray  0;37     White         1;37
```
6. To use sublime-text-editor for editing files from terminal and for git commit messages, you can use the command subl after this command.
```
	ln -s "/Applications/Sublime Text.app/Contents/SharedSupport/bin/subl" ~/bin/subl
	git config --global core.editor "subl -n -w"
```
7. Add required paths to $PATH variable to setup environment. Default paths are included in file given.
```
	export PATH=PATH:<your_path1>:<your_path2>
```
8. You can change the appearance of terminal by going to Preferences/Profiles. You can change the font, font size, window size, font colors, opacity, blur, background color, actually you can change whatever you want. (Solarised Dark Theme will be good)

## Setting up (Image 2)

### Install oh-my-zsh

with curl
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
```
with wget
```
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
```
Go [here](https://github.com/robbyrussell/oh-my-zsh) for more information on plugins, settins, themes in oh-my-zsh!

### Shorter Prompt

1. Set the 'DEFAULT_USER' to avoid complete 'user@hostname'.  
```
	cd ~/.oh-my-zsh/themes
	vi agnoster.zsh-theme
```
In Line `83`, you can see the working of this part of prompt. Set `DEFAULT_USER`, before this line or in `~/.zshrc` to match the `user` in `user@hostname`, ( or type `whoami` to get the user). Or change this section of code the way you want :)

2. In the same file, search for prompt_dir() function or go to line `190`. Change it like this.
```
	prompt_dir() {
	  prompt_segment blue black '%2~'
	}
```
If you set to `%3~` instead, you will see last tree directories in path instead of whole path. Experiment, and then set it the way you like it.

3. Fixing '?' for non-ascii characters (in agnoster.zsh-theme)
```
	git clone https://github.com/powerline/fonts.git --depth=1
	cd fonts
	./install.sh
	rm -rf fonts
```
Then use meslo for powerline font and use the same font for `non-ascii` text in termial profile settings.  

Hope it Helps to make your work easier.
