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

## Tips

### Ignoring `.DS_Store` files from git repositories

Remove existing files from the repository:
```
find . -name .DS_Store -print0 | xargs -0 git rm -f --ignore-unmatch
```
Add the line
```
.DS_Store
```
to the file .gitignore, which can be found at the top level of your repository (or created if it isn't there already). You can do this easily with this command in the top directory
```
echo .DS_Store >> .gitignore
```
Then
```
git add .gitignore
git commit -m '.DS_Store banished!'
```

### Killing a process running in background

If you just pushed the process to background (like by pressing ctrl+z), you can bring it back by `fg` and kill it by `ctrl+c`.  
If you know the PID of the process, (shown when pressed ctrl+z), in a new terminal, run 
```
kill <pid> or
kill -SIGQUIT <pid> or
kill -SIGTERM <pid>
```
If you know just the name or part of name of that process.  
You can see all the processes running in the local env, by `ps` and all process system wide by `ps -ef`.  
Now, let us go step-by-step
```
ps -ef | grep <your_process_name>
```
This gives all the processes with matching name, now we need to exclude the grep <your_process_name> as that is not we want to kill for sure!
```
ps -ef | grep <your_process_name> | grep -v 'grep'
```
Now, we get the required process, hopefully only one. We need to extract the PID of this process. If you see carefully, it is the second column. We will use a simple awk command to pull it out.
```
ps -ef | grep <your_process_name> | grep -v 'grep' | awk 'print {$2}'
```
Now we need to kill that PID :)
```
ps -ef | grep <your_process_name> | grep -v 'grep' | awk 'print {$2}' | xargs kill	
```
