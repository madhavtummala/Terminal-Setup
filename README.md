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

You could actually set up both, one for iTerm2 and other for macOS Terminal

Just install the [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh), keep default login shell in one and command on the other as `/bin/zsh` on the other.  
To change the default login shell to bash, run `chsh -s /bin/bash`.  
Bash shell will use `~/.bash_profile` or `.bashrc` for settings and zsh will use `~/.zshrc` for settings.  

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

Install [oh-my-zsh](https://github.com/robbyrussell/oh-my-zsh) and follow the instructions to set the agnoster theme as the default theme.

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

Hope it Helps to make your work easier.

## Setting up Iterm Shell Integration

[Instructions](https://www.iterm2.com/documentation-shell-integration.html)

The most amazing feature is drag and drop for scp. This feature will not work right out the box.
Install iterm shell intergration in remote pc also, (not necessarily iterm, can be gnome terminal also), then if any hostname related error occurs during transfer, add the line 
```
	export iterm2_hostname=<ip-address-of-remote-pc>
```
in ~/.bash_profile or ~/.profile. We are basically hardcoding the hostname. Be sure to add :< portnumber > if ssh is working on some other port.


## Basic Shortcuts 

| Shortcut | Description |
| ----------- | ----------- |
| ⌘ + <- | Go to the beginning of the line you are currently typing on. |
| ⌘ + -> | Go to the end of the line you are currently typing on. |
| ⌘ + ⇧ + <- | Select till the beginning of the line form the current cursor position |
| ⌘ + ⇧ + -> | Select till the ending of the line form the current cursor position |
| Option + ->  | Move cursor one word forward |
| Option + <- | Move cursor one word backward |
| Option + ⇧ + ->  | Add one more word to selection, forward |
| Option + ⇧ + <- | Add one more word to selection, backward |
| Tab  | Auto-complete files and folder names |
| ⌘ + Del | Delete the line/command |
| Option + Del | Delete a word to left of cursor |
| Option + fn + Del | Delete a word to right of cursor |
| Ctrl + C   | Kill whatever you are running |
| Ctrl + D   | Exit the current shell when no process is running, or send EOF to a the running process |
| Ctrl + Z   | Puts whatever you are running into a suspended background process. fg restores it. |  

Note that the `delete` button in mac keyboard acts as backspace and `fn+delete` acts as traditional delete button.  

### Iterm Specific

| Shortcut | Description |
| ----------- | ----------- |
|  ⌘ + Enter  | Fullscreen  |
|  ⌘ + ⇧ + d | Split Window Horizontally (same profile) |
|  ⌘ + d  | plit Window Vertically (same profile) |
|  ⌘ + W  | Close Window or Tab |
|  '⌘ + [' and '⌘ + ]' | Go to Split Pane by Order of Use |  

### Setting iTerm to work with macOS shortcuts

The above basic shortcuts to move around the command and text selection, won't work in iTerm by default, so we need to make some key-bindings for that to work.  
iTerm2 -> Preferences (⌘ + ,) in “Keys” tab and add the following Global Shortcut Keys / Profile shortcuts keys

Don't forget to remove the previous bindings if adding in global:  
Open the “Profiles” tab    
Click the sub-tab ”Keys”   
Remove the mappings for key combinations ⌥ + ← and ⌥ + →

| Description | Keyboard Combination | Action | Code |
| ----------- | ----------- | ----------- | ----------- |
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

### Searching in Command History

**Function** | **Shortcut**
-------- | --------
Search as you type | `Ctrl` + `r` and type the search term; Repeat `Ctrl` + `r` to loop through result
Search the last remembered search term | `Ctrl` + `r` twice
End the search at current history entry  | `Ctrl` + `y`
Cancel the search and restore original line | `Ctrl` + `g`

### Using Multiple Commands

| Key/Command | Description |
| ----------- | ----------- |
| [command-a]; [command-b] | Run command A and then B, regardless of success of A |
| [command-a] && [command-b] | Run command B if A succeeded |
| [command-a] \|\| [command-b] | Run command B if A failed |
| [command-a] & | Run command A in background |
| [command-a] \| [command-b] | Run command A and then pass the result to command B |

### Saving Terminal Output to a File

|  Syntax  | visible in terminal | visible in terminal |  visible in file   |  visible in file   | existing file|
| :---: | :---: | :---: | :---: | :---: | :---: | 
|     |	StdOut | StdErr | StdOut | StdErr | 	|
|    >     |    no    |   yes    |   yes    |    no    | overwrite|
|    >>    |    no    |   yes    |   yes    |    no    |  append|
|          |          |          |          |          |	|
|   2>     |   yes    |    no    |    no    |   yes    | overwrite|
|   2>>    |   yes    |    no    |    no    |   yes    |  append|
|          |          |          |          |          |	|
|   &>     |    no    |    no    |   yes    |   yes    | overwrite|
|   &>>    |    no    |    no    |   yes    |   yes    |  append|
|          |          |          |          |          |	|
| \| tee    |   yes    |   yes    |   yes    |    no    | overwrite|
| \| tee -a |   yes    |   yes    |   yes    |    no    |  append|
|          |          |          |          |          |	|
| n.e. (*) |   yes    |   yes    |    no    |   yes    | overwrite|
| n.e. (*) |   yes    |   yes    |    no    |   yes    |  append|
|          |          |          |          |          |	|
| \|& tee    |   yes    |   yes    |   yes    |   yes    | overwrite|
| \|& tee -a |   yes    |   yes    |   yes    |   yes    |  append|

### File/Directory Management

| Key/Command | Description |
| ----------- | ----------- |
| touch [file] |   Create a new file |
| pwd | Full path to working directory |
| . |  Current folder, e.g. `ls .` |
| .. | Parent/enclosing directory, e.g. `ls ..` |
| ls -l .. | Long listing of parent directory |
| cd ../../ | Move 2 levels up |
| cat | Concatenate to screen |
| rm [file] |  Remove a file, e.g. `rm data.tmp` |
| rm -r [dir] | Remove a directory and contents |
| cp [file] [newfile] | Copy file to file |
| cp [file] [dir] | Copy file to directory |
| mv [file] [new filename] |  Move/Rename, e.g. `mv file1.ad /tmp` |
| pbcopy < [file] | Copies file contents to clipboard |
| pbpaste | Paste clipboard contents |
| pbpaste > [file] | Paste clipboard contents into file, `pbpaste > paste-test.txt` |
| mkdir [dir] | Create new directory |
| mkdir -p [dir]/[dir] |  Create nested directories |
| rmdir [dir] | Remove directory ( only operates on empty directories ) |
| rm -R [dir] | Remove directory and contents |

### Important Tools

| Key/Command | Description |
| ----------- | ----------- |
| find [dir] -name [search_pattern] | Search for files |
| grep [search_pattern] [file] | Search for all lines that contain the pattern |
| mdfind [search_pattern] | Spotlight search for files (names, content, other metadata)|
| brew | Package Installer and manager for macOS |
| sed | Edit files based on patter match | 
| awk | Print/Operate on input text |
| ps -ef | List of all Processes running |
| htop | Processors and RAM Usage and managing processes | 
| kill [PID] | kills the process with the process ID |   
