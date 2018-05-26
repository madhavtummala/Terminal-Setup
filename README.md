# COLORFUL TERMINAL SETUP WITH GIT INFO

The macOS or Linux terminal is often very confusing. With the commands, prompts, and the outputs, all alike, it becomes very difficult to distinguish one from the other.
Also, while working on git repositories, it is very helpful to see the branch you are on, and to autocomplete the Commit ID's. 
The included files provide this functionality.

1. git-completion.bash - To Tab-Completion for commitID's.
2. git-promt.sh - To Get Git-Repo Info in the promt.
3. bash_profile - A sample .bash_profile file to change the colors of different parts of the prompt.

# SETTING UP

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
8. You can change the appearance of terminal by going to Preferences/Profiles. You can change the font, font size, window size, font colors, opacity, blur, background color, actually you can change whatever you want.

Hope it Helps to make your work easier. The git files have been provided by Udacity.

