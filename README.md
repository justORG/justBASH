# justBASH

With justBASH you can run BASH scripts under UNIX, OSX and Windows machines using the same commands, making it easy to distribute your projects to developers and users alike.

## Setup

Run those commands on your system terminal / command prompt:

```sh
echo Failed to setup justBASH>no.just&&echo See: https://github.com/justORG/justBASH/ERROR.md>>no.just
:;S=justSETUP.sh;U=https://github.com/justORG/justBASH/raw/master/$S;h(){ type $1 >/dev/null 2>&1||return 1;};h curl&&curl -O "$U"||h wget&&wget "$U"||h lynx&&lynx -source "$U">$S;clear;[ -f $S ]&&chmod +x $S&&./$S||cat no.just;rm no.just;unset S U h;<<:
cmd /v /c "set F=justSETUP.bat&set "B=%CD%\!F!"&set U=ttps://github.com/justORG/justBASH/raw/master/!F!&set "IF=for ^%X in ("&set "DO=.exe) do (set OK=^%~$PATH:X)^&if defined OK "&cmd /c "(!IF!bitsadmin!DO!(bitsadmin /transfer J h!U! "!B!")else (!IF!powershell!DO!(powershell -Command "(New-Object Net.WebClient).DownloadFile('h'+'!U!','!B!')")))^&cls^&(if exist !B! (!B!)else (more no.just))^&del no.just""&^
:

```

## Features

  | Feature
-------- | --------------------------------------------------------------------------------
<b>&#10003;</b> | <details><summary><b><i>Feature 1 name</i></b></summary><p>Feature 1 description</p></details>
<b>&#10003;</b> | <details><summary><b><i>Feature 2 name</i></b></summary><p>Feature 2 description</p></details>
  | <details><summary><i>Feature 3 name</i></summary><p>Feature 3 description</p></details>
