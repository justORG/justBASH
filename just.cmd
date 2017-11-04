:$(echo $_) 2>/dev/null; JUST_PATH="$_"; [ "${JUST_PATH:0:1}" == ":" ] && JUST_PATH="${JUST_PATH:1}";<<'@echo off'
@echo off
set "JUST_BASH_PACKAGES=" \&set "JUST_BASH_URLS=" \&set "JUST_BASH_TOOL_PARAMETERS=" \&rem "$@"  #
:; ( JUST_PATH="`[ -f "$0" ] && ([ "$JUST_PATH" == "$0" ] && echo "\"$0\"" || echo \"$JUST_PATH\" \"$0\") || ([ -f "./$JUST_PATH" ] && echo "\"./$JUST_PATH\"" || echo "\"$JUST_PATH\"")`"; JUST_PARAMS=("$@"); eval "${JUST_PARAMS[0]};${JUST_PARAMS[2]};${JUST_PARAMS[4]}"; unset JUST_PARAMS[5] JUST_PARAMS[4] JUST_PARAMS[3] JUST_PARAMS[2] JUST_PARAMS[1] JUST_PARAMS[0]; set -- "${JUST_PARAMS[@]}"; unset JUST_PARAMS  #
  :;  if [ "$1" == "url" ]; then  #
  :;    if [ "$2" == "decode" ]; then  #
  :;      url="${*:3}";  #
  :;      url="${url//\\/\\\\}";  #
  :;      url=`echo "${url// /%20}" | sed "s@+@ @g;s@%@\\\\\\\\x@g"`;  #
  :;      printf "$url\n";  #
  :;    else  #
  :;      if [ "$2" == "info" ]; then  #
  :;        url="${*:3}";  #
  :;        url="${url// /%20}";  #
  :;        protocol="${url%://*}";  #
  :;        hostname="${url#*://}";  #
  :;        if [ "$protocol" == "$hostname" ]; then  #
  :;          hostname="";  #
  :;        fi  #
  :;        if [ "$protocol" != "" ] && [ "$hostname" != "" ]; then  #
  :;          path="${hostname#*/}";  #
  :;          hostname="${hostname%%/*}";  #
  :;          if [ "$path" != "$hostname" ]; then  #
  :;            search="${path#*\?}";  #
  :;            path="${path%%\?*}";  #
  :;            if [ "$search" == "$path" ]; then  #
  :;              search="";  #
  :;            fi  #
  :;            filename="${path##*/}";  #
  :;          else  #
  :;            path="";  #
  :;            filename="";  #
  :;            search="";  #
  :;          fi  #
  :;          port="${hostname#*:}";  #
  :;          if [ "$port" == "$hostname" ]; then  #
  :;            port="";  #
  :;          fi  #
  :;          hostname="${hostname%:*}";  #
  :;        fi  #
  :;        if [ "$protocol" != "" ] && [ "$hostname" != "" ]; then  #
  :;          echo "protocol=$protocol";  #
  :;          echo "hostname=$hostname";  #
  :;          [ "$port" != "" ] && echo "port=$port";  #
  :;          [ "$path" != "" ] && echo "path=$path";  #
  :;          [ "$search" != "" ] && echo "search=$search";  #
  :;          [ "$filename" != "" ] && echo "filename=$filename";  #
  :;        else  #
  :;          echo "ERROR: '$url' is not a valid URL.";  #
  :;          exit 1;  #
  :;        fi  #
  :;      else  #
  :;        echo "ERROR: '$2' is not a valid url command.";  #
  :;        exit 2;  #
  :;      fi  #
  :;    fi  #
  :;  else  #
  :;    if [ "$1" == "download" ]; then  #
  :;      if [ "$2" == "-o" ]; then  #
  :;        url="${*:4}";  #
  :;        output_path="$3";  #
  :;      else  #
  :;        url="${*:2}";  #
  :;        output_path="$PWD";  #
  :;      fi  #
  :;      if [ -d "$output_path" ]; then  #
  :;        urlinfo=`"$JUST_PATH" url info $url`;  #
  :;        filename=${urlinfo##*$'\n'};  #
  :;        if [ "${filename%%=*}" == "filename" ]; then  #
  :;          output_path="$output_path/`\"$JUST_PATH\" url decode ${filename#*=}`";  #
  :;        else  #
  :;          echo "ERROR: Could not extract the filename from URL '$url'.";  #
  :;          exit 3;  #
  :;        fi  #
  :;      fi  #
  :;      exists(){ type $1 >/dev/null 2>&1||return 1;}  #
  :;      if exists perl && LWP_VER="$(perl -MLWP -le 'print(LWP->VERSION)')" && { [ $LWP_VER != "" ] || [ "${url%/*}" != "https:/" ]; }; then  #
  :;        if [ "$LWP_VER" != "" ]; then  #
  :;          perl -MLWP::Simple -e "getstore('$url', '$output_path')"  #
  :;        else  #
  :;          perl -MFile::Fetch -e "File::Fetch->new(uri => '$url')->fetch(to => '$output_path')"  #
  :;        fi  #
  :;      elif exists curl; then  #
  :;        curl -s -L -o "$output_path" "$url"  #
  :;      elif exists wget; then  #
  :;        wget -O "$output_path" "$url"  #
  :;      fi  #
  :;    else  #
  :;      if [ -f ".just/path" ]; then #
  :;        JUST_BASH_PATH="`cat .just/path`";  #
  :;      fi  #
  :;      if [ ! -f "$JUST_BASH_PATH" ]; then  #
  :;        rm -f justSETUP.sh  #
  :;        "$JUST_PATH" download -o justSETUP.sh https://github.com/justORG/justBASH/raw/master/justSETUP.sh  #
  :;        if [ -f justSETUP.sh ]; then  #
  :;          chmod +x justSETUP.sh  #
  :;          JUST_BASH_PATH=./justSETUP.sh  #
  :;        fi  #
  :;      fi  #
  :;      if [ -f "$JUST_BASH_PATH" ]; then  #
  :;        "$JUST_BASH_PATH" "$@"  #
  :;      else  #
  :;        echo "justBASH setup failed!";  #
  :;        echo ""; #
  :;        echo "Could not download the setup script using perl, curl or wget. At least one of them is required to setup justBASH.";  #
  :;        exit 4;  #
  :;      fi  #
  :;    fi  #
  :;  fi  #
:; );<<')'
(
      setlocal EnableDelayedExpansion
      set "JUST_PATH=%0"
      IF "%1" == "url" (
        IF "%2" == "decode" (
          set "url=%*"
          set "url=!url:~11!"
          for /f "tokens=* delims= " %%a in ("!url!") do set "url=%%a"
          set "result="
          :decodebuffer
          set "buffer=!url:~0,100!"
          set "url=!url:~100!"
          for /f "tokens=1,* delims=%%" %%a in ("!url!") do (
            IF "%%b" == "" (
              set "buffer=!buffer!!url:~0,2!"
              set "url=!url:~2!"
            ) ELSE (
              set "buffer=!buffer!%%a"
              set "url=!buffer:~102!%%%%b"
              set "buffer=!buffer:~0,102!"
            )
          )
          set "buffer=!buffer:"=""!"
          set "buffer=!buffer:'=\'!"
          for /f "tokens=*" %%N in ('%SystemRoot%\system32\mshta.exe "javascript:code(close(new ActiveXObject('Scripting.FileSystemObject').GetStandardStream(1).Write( decodeURIComponent('!buffer:http=h'+'ttp!') )));"') do set "buffer=%%N"
          set "result=!result!!buffer:""="!"
          IF NOT "!url!" == "" goto decodebuffer
          echo !result!
          goto :EOF
        ) ELSE (
          IF "%2" == "info" (
            set "url=%*"
            set "url=!url:~9!"
            for /f "tokens=* delims= " %%a in ("!url!") do set "url=%%a"
            for /f "tokens=1,* delims=" %%a in ("!url:://=!") do (
              set "protocol=%%a"
              set "hostname=%%b"
              IF NOT "!hostname!" == "" set "hostname=!hostname:=://!"
            )
            IF NOT "!protocol!" == "" IF NOT "!hostname!" == "" (
              for /f "tokens=1,* delims=/" %%a in ("!hostname!") do (
                set "hostname=%%a"
                set "path=%%b"
              )
              IF NOT "!path!" == "" (
                for /f "tokens=1,* delims=?" %%a in ("!path!") do (
                  set "path=%%a"
                  set "search=%%b"
                )
                set "fnaux=!path!"
                :setfilename
                set "filename=!fnaux!"
                for /f "tokens=1,* delims=/" %%a in ("!fnaux!") do set "fnaux=%%b"
                IF NOT "!fnaux!" == "" goto setfilename
                IF NOT "!filename:/=!" == "!filename!" set "filename="
                goto endif1
              ) ELSE (
                set "path="
                set "filename="
                set "search="
              )
              :endif1
              for /f "tokens=1,* delims=:" %%a in ("!hostname!") do (
                IF NOT "%%b" == "" (
                  IF "!hostname!" == "%%a:%%b" (
                    set "hostname=%%a"
                    set "port=%%b"
                  ) ELSE (
                    set "hostname="
                  )
                ) ELSE (
                  IF "!hostname!" == "%%a" (
                    set "hostname=%%a"
                  ) ELSE (
                    set "hostname="
                  )
                )
              )
            )
            IF NOT "!protocol!" == "" IF NOT "!hostname!" == "" (
              echo protocol=!protocol!
              echo hostname=!hostname!
              IF NOT "!port!" == "" echo port=!port!
              IF NOT "!path!" == "" echo path=!path!
              IF NOT "!search!" == "" echo search=!search!
              IF NOT "!filename!" == "" echo filename=!filename!
              goto :EOF
            ) ELSE (
              echo ERROR: '!url!' is not a valid URL.
              EXIT /B 1
            )
          ) ELSE (
            echo ERROR: '%2' is not a valid url command.
            EXIT /B 2
          )
        )
      ) ELSE (
        IF "%1" == "download" (
          IF "%2" == "-o" (
            set begin=4
            set "output_path=%~f3"
          ) ELSE (
            set begin=2
            set "output_path=%CD%"
          )
          call set "url=%%~!begin!"
          :loop1
          shift
          call set "next=%%!begin!"
          IF "!next!" == "" goto done1
          set "url=!url! !next!"
          goto loop1
          :done1
          IF EXIST "!output_path!\*" (
            for /f "tokens=*" %%N in ('"!JUST_PATH!" url info !url!') do set "filename=%%N"
            IF "!filename:~0,9!" == "filename=" (
              for /f "tokens=*" %%N in ('"!JUST_PATH!" url decode !filename:~9!') do set "filename=%%N"
            ) ELSE (
              echo ERROR: Could not extract the filename from URL '!url!'.
              EXIT /B 3
            )
            set "output_path=!output_path!\!filename!"
          )
          for %%X in (bitsadmin.exe) do set OK=%%~$PATH:X
          IF defined OK (
            bitsadmin /transfer J "!url!" "!output_path!" >nul
          ) ELSE (
            for %%X in (powershell.exe) do set OK=%%~$PATH:X
            IF defined OK (
              powershell -Command "(New-Object Net.WebClient).DownloadFile('!url!','!output_path!')"
            )
          )
          goto :EOF
        ) ELSE (
          IF EXIST "%CD%\.just\path" (
            set /p JUST_BASH_PATH=<%CD%\.just\path
          )
          IF NOT EXIST "!JUST_BASH_PATH!" (
            IF EXIST "%CD%\justSETUP.bat" del /q justSETUP.bat
            call "!JUST_PATH!" download -o justSETUP.bat https://github.com/justORG/justBASH/raw/master/justSETUP.bat
            set "JUST_BASH_PATH=%CD%\justSETUP.bat"
          )
          IF EXIST "!JUST_BASH_PATH!" (
            set "params=""%~1"""
            :loop2
            shift
            IF "%1" == "" goto done2
            set "params=!url! ""%~1"""
            goto loop2
            :done2
            "!JUST_BASH_PATH!" "!JUST_PATH!" !params!
          ) ELSE (
            echo justBASH setup failed!
            echo.
            echo Could not download the setup script using bitsadmin or powershell. At least one of them is required to setup justBASH.
            EXIT /B 4
          )
        )
      )
)
