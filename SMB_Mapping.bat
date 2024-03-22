@echo off
color 1F
setlocal

echo Please enter your department:
echo 1 - IT
echo 2 - Sales
echo 3 - Engineering
echo 4 - Accounting
echo 5 - Production
echo 6 - Parts or Service
echo 7 - Assembly
set /p DeptChoice=Choice: 

echo Please enter your userid:
set /p Username=Employee id:
echo Please enter your password:
for /f "delims=" %%i in ('powershell -Command "$p = Read-Host -AsSecureString; $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($p); [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)"') do set Password=%%i

REM Adding credentials for server-a and server-b and sever-c
cmdkey /add:server-a /user:%Username% /pass:%Password%
cmdkey /add:server-b /user:%Username% /pass:%Password%
cmdkey /add:server-c /user:%Username% /pass:%Password%

REM Clearing existing network drives
NET USE * /delete /y

REM Mapping drives based on department choice
if %DeptChoice%==1 goto IT
if %DeptChoice%==2 goto Sales
if %DeptChoice%==3 goto Engineering
if %DeptChoice%==4 goto Accounting
if %DeptChoice%==5 goto Production
if %DeptChoice%==6 goto PorS
if %DeptChoice%==7 goto Assembly

:IT
REM LOGIC FOR IT
NET USE Y: "\\server-a\somepath\space space"
NET USE A: \\server-a\somepath /persistent:yes
NET USE H: \\server-b\somepath /persistent:yes
NET USE I: \\server-a\somepath /persistent:yes
NET USE N: \\server-a\somepath /persistent:yes
NET USE M: \\server-b\%Username%\%Username% /persistent:yes
REM NET USE P: \\server-a\somepath /persistent:yes
NET USE R: \\server-a\somepath /persistent:yes
NET USE S: \\server-c\%Username%\%Username% /persistent:yes
NET USE T: \\server-a\somepath /persistent:yes
NET USE U: \\server-b\somepath /persistent:yes
NET USE V: \\server-a\somepath /persistent:yes
NET USE W: \\server-a\somepath /persistent:yes
NET USE X: \\server-a\somepath /persistent:yes
NET USE Z: \\server-a\somepath /persistent:yes
goto End

:Sales
REM LOGIC FOR SALES
NET USE M: \\server-b\%Username%\%Username% /persistent:yes
NET USE R: \\server-a\somepath /persistent:yes
NET USE S: \\server-c\%Username% /persistent:yes
NET USE T: \\server-a\somepath /persistent:yes
NET USE V: \\server-a\somepath /persistent:yes
NET USE W: \\server-a\somepath /persistent:yes
NET USE Y: \\server-a\somepath /persistent:yes
NET USE Z: \\server-a\somepath /persistent:yes
goto End

:Engineering
REM LOGIC FOR ENGINEERING
NET USE M: \\server-b\%Username%\%Username% /persistent:yes
NET USE O: \\server-b\somepath /persistent:yes
NET USE P: \\server-a\somepath /persistent:yes
NET USE R: \\server-a\somepath /persistent:yes
NET USE S: \\server-c\%Username% /persistent:yes
NET USE T: \\server-a\somepath /persistent:yes
NET USE V: \\server-a\somepath /persistent:yes
NET USE W: \\server-a\somepath /persistent:yes
NET USE X: \\server-a\somepath /persistent:yes
NET USE Y: \\server-a\somepath /persistent:yes
NET USE Z: \\server-a\somepath /persistent:yes
goto End

:Accounting
REM LOGIC FOR ACCOUNTING
NET USE J: \\server-a\somepath /persistent:yes
NET USE M: \\server-b\%Username%\%Username% /persistent:yes
NET USE R: \\server-a\somepath /persistent:yes
NET USE S: \\server-c\%Username% /persistent:yes
NET USE T: \\server-a\somepath /persistent:yes
NET USE V: \\server-a\somepath /persistent:yes
NET USE W: \\server-a\somepath /persistent:yes
NET USE Y: \\server-a\somepath /persistent:yes
NET USE Z: \\server-a\somepath /persistent:yes
goto End

:Production
REM PRODUCTION LOGIC
NET USE M: \\server-b\%Username%\%Username% /persistent:yes
NET USE R: \\server-a\somepath /persistent:yes
NET USE S: \\server-c\%Username% /persistent:yes
NET USE T: \\server-a\somepath /persistent:yes
NET USE V: \\server-a\somepath /persistent:yes
NET USE W: \\server-a\somepath /persistent:yes
NET USE X: \\server-a\somepath /persistent:yes
NET USE Y: \\server-a\somepath /persistent:yes
NET USE Z: \\server-a\somepath /persistent:yes
goto End

:PorS
REM PARTS OR SERVICE
NET USE M: \\server-b\%Username%\%Username% /persistent:yes
NET USE R: \\server-a\somepath /persistent:yes
NET USE S: \\server-c\%Username%\%Username% /persistent:yes
NET USE T: \\server-a\somepath /persistent:yes
NET USE V: \\server-a\somepath /persistent:yes
NET USE W: \\server-a\somepath /persistent:yes
NET USE Y: \\server-a\somepath /persistent:yes
NET USE Z: \\server-a\somepath /persistent:yes
goto End

:Assembly
REM ASSEMBLY LOGIC
NET USE M: \\server-b\%Username%\%Username% /persistent:yes
NET USE R: \\server-a\somepath /persistent:yes
NET USE T: \\server-a\somepath /persistent:yes
NET USE V: \\server-a\somepath /persistent:yes
NET USE W: \\server-a\somepath /persistent:yes
NET USE Y: \\server-a\somepath /persistent:yes
NET USE Z: \\server-a\somepath /persistent:yes
goto End

:End
echo Operation completed.
endlocal
