# justBASH

With justBASH you can run BASH scripts under UNIX, OSX and Windows machines using the same commands, making it easy to distribute your projects to developers and users alike.

## Setup

Run those commands on your system's terminal / command prompt:

```sh
echo Failed to setup justBASH>no.just&&echo See: https://github.com/justORG/justBASH/blob/master/ERROR.md>>no.just
:;S=justSETUP.sh;U=https://github.com/justORG/justBASH/raw/master/$S;h(){ type $1 >/dev/null 2>&1||return 1;};h curl&&curl -O "$U"||h wget&&wget "$U"||h lynx&&lynx -source "$U">$S;clear;[ -f $S ]&&chmod +x $S&&./$S||cat no.just;rm no.just;unset S U h;<<:
cmd /v /c "set F=justSETUP.bat&set "B=%CD%\!F!"&set U=ttps://github.com/justORG/justBASH/raw/master/!F!&set "IF=for ^%X in ("&set "DO=.exe) do (set OK=^%~$PATH:X)^&if defined OK "&cmd /c "(!IF!bitsadmin!DO!(bitsadmin /transfer J h!U! "!B!")else (!IF!powershell!DO!(powershell -Command "(New-Object Net.WebClient).DownloadFile('h'+'!U!','!B!')")))^&cls^&(if exist !B! (!B!)else (more no.just))^&del no.just""&^
:
 
```

## Commands

&nbsp; | Command
------ | -------
  | <details><summary><b>Run bash</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just bash [arguments]`<br /><br />Runs bash on any platform. If any arguments are specified, those arguments are passed on to bash.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just bash script.sh`</p></details>
  | <details><summary><b>Install package</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just install package1 [package2 ...]`<br /><br />Installs the specified bash package(s) using the available package manager. If none is found, the most adequate package manager for the system is installed and used.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just install wget`</p></details>
  | <details><summary><b>Bash scripts from URL</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just <script_url>`<br /><br />Runs a bash script from the specified URL.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just https://www.domain.com/script.sh`</p></details>
  | <details><summary><b>justBASH tools</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just <tool_name> [arguments]`<br /><br />Installs the specified justBASH tool if necessary, then calls it. If any arguments are specified, those arguments are passed on to the tool.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just git`</p></details>
  | <details><summary><b>Custom justBASH tools</b></summary><p><br />Syntax<br />&nbsp;&nbsp;&nbsp;&nbsp;`just tool <custom_tool_folder>`<br /><br />Installs a custom justBASH tool from the specified folder.<br /><br />Examples</br>&nbsp;&nbsp;&nbsp;&nbsp;`just tool ./my-tool`</p></details>

<!-- <b>&#10003;</b> | <details><summary><b><i>Feature name</i></b></summary><p>Feature description</p></details> -->
