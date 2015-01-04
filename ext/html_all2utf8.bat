cd /d %~dp0

set dst=D:\4_work\GitHub\wiki

@echo off&setlocal enabledelayedexpansion
@for /r %%i in (*.html) do (
  set str=%%i
  set str=!str:%cd%=!
  set newfile=%dst%!str!
  set newpath=!newfile:%%~nxi=!
  if exist !newpath! ( echo !newpath!) else (md !newpath!)
  iconv.exe -f GBK -t UTF-8 %%i > !newfile!
)
endlocal

cd %dst%
::for /f "tokens=*" %%a in ('dir/b *.html') do (
::(for /f "tokens=*" %%i in (%%a) do (
::set s=%%i
::set s=!s:cp936=utf-8!
::echo !s!))>temp.html
::move /y temp.html "%%a" ) 
 
      
::@echo off
::for /f "delims=" %%i in ('dir /s/b *.html') do (
::        for /f "delims=" %%a in ('type "%%~fi"') do (
::                set "foo=%%a"
::                call,set foo=%%foo:cp936=utf-8%%
::                call,echo/%%foo%%>>"%%~fi._"
::)
::move "%%~fi._" "%%~fi"
::)

::@echo off                                      ::关闭回显，不会看到执行的代码
::setlocal enabledelayedexpansion                ::使用!作为分隔符启用延迟的环境变量
::for /r %%c in (*.html) do (
::(for /f "tokens=*" %%i in (%%c) do (
::set s=%%i
::set s=!s:cp936=utf-8!
::endlocal
::echo !s!))>temp.html
::move /y temp.html "%%c" ) 

::for /r %%c in (*.html) do (
::setlocal enabledelayedexpansion
::(for /f "tokens=1* delims=:" %%a in ('findstr /n ".*" %%c') do ( 
::    set str=%%b 
::    if "!str!" neq "" ( 
::        set str=!str:cp936=utf-8! 
::    ) 
::    echo,!str! 
::))>temp.html
::endlocal
::move /y temp.html "%%c"
::)

@pause