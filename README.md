# justBASH

With justBASH you can run BASH scripts under UNIX (Linux and macOS) and Windows machines using the same commands, making it easy to distribute your projects to developers and users alike.

## Setup

Run those commands on your system's terminal / command prompt:

```sh
echo Failed to setup justBASH>no.just&&echo See: https://github.com/justORG/justBASH/blob/master/ERROR.md>>no.just
:;S=just.cmd;U=https://github.com/justORG/justBASH/raw/master/$S;h(){ type $1 >/dev/null 2>&1||return 1;};h curl&&curl -O "$U"||h wget&&wget "$U"||h lynx&&lynx -source "$U">$S;clear;[ -f $S ]&&chmod +x $S&&./$S||cat no.just;rm no.just;unset S U h;<<:
cmd /v /c "set "B=%CD%\just.cmd"&set U=ttps://github.com/justORG/justBASH/raw/master/just.cmd&set "IF=for ^%X in ("&set "DO=.exe) do (set OK=^%~$PATH:X)^&if defined OK "&cmd /c "(!IF!bitsadmin!DO!(bitsadmin /transfer J h!U! "!B!")else (!IF!powershell!DO!(powershell -Command "(New-Object Net.WebClient).DownloadFile('h'+'!U!','!B!')")))^&cls^&(if exist !B! (!B!)else (more no.just))^&del no.just""&^
:
 
```

### Manual setup

Download this file and run it:
[just.cmd](https://github.com/justORG/justBASH/raw/master/just.cmd)

## Commands

![Windows](https://png.icons8.com/windows-xp/color/24) | ![macOS](https://png.icons8.com/apple-mac/color/24) | ![Ubuntu](https://png.icons8.com/ubuntu/color/24) | Command<br />(click to expand)
-- | -- | -- | --
  |  |  | <details><summary><b>Run bash</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just bash [arguments]`<br /><br />Runs bash on any platform. If any arguments are specified, those arguments are passed on to bash.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just bash script.sh`</p></details>
  |  |  | <details><summary><b>Install package</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just install package1 [package2 ...]`<br /><br />Installs the specified bash package(s) using the available package manager. If none is found, the most adequate package manager for the system is installed and used.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just install wget`</p></details>
  |  |  | <details><summary><b>Bash scripts from URL</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just <script_url>`<br /><br />Runs a bash script from the specified URL.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just https://www.domain.com/script.sh`</p></details>
  |  |  | <details><summary><b>justBASH tools</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just <tool_name> [arguments]`<br /><br />Installs the specified justBASH tool if necessary, then calls it. If any arguments are specified, those arguments are passed on to the tool.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just git`</p></details>
  |  |  | <details><summary><b>Custom justBASH tools</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just tool <custom_tool_folder>`<br /><br />Installs a custom justBASH tool from the specified folder.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just tool ./my-tool`</p></details>
  |  |  | <details><summary><b>Portable justBASH</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just portable`<br /><br />Moves justBASH and all packages and tools installed to the current working directory, making it possible to copy that directory to any other machine with the same OS and continue to use justBASH, even without internet access.<br /><br />To install justBASH from the portable version and revert the changes, run `just installed`.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just portable`</br>&nbsp;&nbsp;&nbsp;&nbsp;`just installed`</p></details>

<!-- <b>&#10003;</b> -->

<a href="https://icons8.com">Icon pack by Icons8</a>
