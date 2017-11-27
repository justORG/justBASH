# justBASH

With justBASH you can run BASH scripts under UNIX (Linux and macOS) and Windows machines using the same commands, making it easy to distribute your projects to developers and users alike.

## Setup

The setup of justBASH currently deppends on either Perl or wget being available on UNIX systems.

### Automatic setup

Run those commands on your system's terminal / command prompt:

```sh
echo Failed to setup justBASH>no.just&&echo See: https://github.com/justPLACE/justBASH/blob/master/ERROR.md>>no.just
:;S=just.cmd;U=https://raw.githubusercontent.com/justPLACE/justBASH/master/$S;h(){ type $1 >/dev/null 2>&1||return 1;};h curl&&curl -O "$U"||(h wget&&wget "$U")||(h lynx&&lynx -source "$U">$S);clear;[ -f $S ]&&chmod +x $S&&./$S||cat no.just;rm no.just;unset S U h;<<:
cmd /v /c "set "B=%CD%\just.cmd"&set U=ttps://raw.githubusercontent.com/justPLACE/justBASH/master/just.cmd&set "IF=for ^%X in ("&set "DO=.exe) do (set OK=^%~$PATH:X)^&if defined OK "&cmd /c "(!IF!bitsadmin!DO!(bitsadmin /transfer J h!U! "!B!" ^>nul)else (!IF!powershell!DO!(powershell -Command "(New-Object Net.WebClient).DownloadFile('h'+'!U!','!B!')")))^&cls^&(if exist !B! (!B!)else (more no.just))^&del no.just""&^
:
 
```

### Manual setup

Download this file to your project's directory and run it:
[just.cmd](https://github.com/justPLACE/justBASH/raw/master/just.cmd)

## Commands

![Windows](https://png.icons8.com/windows-xp/color/24) | ![macOS](https://png.icons8.com/apple-mac/color/24) | ![Ubuntu](https://png.icons8.com/ubuntu/color/24) | Command<br />(click to expand)
-- | -- | -- | --
  |  |  | <details><summary><b>Run bash</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just bash [arguments]`<br /><br />Runs bash on any platform. If any arguments are specified, those arguments are passed on to bash.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just bash script.sh`</p></details>
  |  |  | <details><summary><b>Install package/script</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just install item1 [item2 ...]`<br /><br />Installs the specified item(s). Each item can be the name of a bash package (to be installed using the available package manager), or the URL to an installation script.<br />If a package is to be installed and no package manager is found, the most adequate package manager for the system is installed and used.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just install wget`</br>&nbsp;&nbsp;&nbsp;&nbsp;`just install http://www.domain.com/script.sh`</p></details>
 <b>&#10003;</b> | <b>&#10003;</b> | <b>&#10003;</b> | <details><summary><b>URL commands</b></summary><p><b>decode</b><br /><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just url decode <url>`<br /><br />Decodes URL-encoded characters from the specified `<url>` and prints the result.<br /><br /><b>info</b><br /><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just url info <url>`<br /><br />Prints a line for each available URL information, in the following format:<br />`protocol=<protocol>`<br />`hostname=<hostname>`<br />`port=<port>`<br />`path=<path>`<br />`search=<search>`<br />`filename=<filename>`<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just url decode just%20an%20example`</br>&nbsp;&nbsp;&nbsp;&nbsp;`just url info https://www.domain.com/file.ext`</p></details>
 <b>&#10003;</b> | <b>&#10003;</b> | <b>&#10003;</b> | <details><summary><b>Download file</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just download [-o <output_path>] <url>`<br /><br />Downloads the file from the specified `<url>`, saving it under the current folder if no `<output_path>` is specified.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just download https://www.domain.com/file.ext`</p></details>
  |  |  | <details><summary><b>justBASH tools</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just <tool_name> [arguments]`<br /><br />Installs the specified justBASH tool if necessary, then calls it. If any arguments are specified, those arguments are passed on to the tool.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just git push`</p></details>
  |  |  | <details><summary><b>Custom justBASH tools</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just tool <custom_tool_name> <custom_tool_folder>`<br /><br />Installs a custom justBASH tool with the name specified by `<custom_tool_name>` and from the folder specified by `<custom_tool_folder>`.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just tool my-tool ./my-tool`</p></details>
  |  |  | <details><summary><b>Portable justBASH</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just portable`<br /><br />Moves justBASH and all packages and tools installed for the current project to the project's `.just` subdirectory, making it possible to copy the project directory to any other machine with the same OS and continue to use justBASH, even without internet access.<br /><br />To install justBASH from the portable version and revert the changes, run `just installed`.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just portable`</br>&nbsp;&nbsp;&nbsp;&nbsp;`just installed`</p></details>

<!-- <b>&#10003;</b> -->

<a href="https://icons8.com">Icon pack by Icons8</a>
