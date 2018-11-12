@echo off
setlocal
set PROG_NAME=%0
set PROG_VERS=v1.1
set PROG_AUTH=peter@forret.com

:: ===== BASIC TESTS
if "%1" == ""     goto usage
if "%1" == "/?"   goto usage
if "%1" == "/ver" goto license
set INVOKER=call 
if /I "%1" == "/I" set INVOKER=start /WAIT

:: ===== START REAL PROGRAM
:execute
echo ____  START @ [%DATE% %TIME%] ____

set ID=%PROG_NAME%
waTimer START %ID%

%INVOKER% %*

waTimer STOP %ID% /calc /scale:hr

echo ____ FINISH @ [%DATE% %TIME%] ____
endlocal

goto :end
:: ########## START OF GENERIC PROCEDURES ##########
:usage
	echo === %PROG_NAME% %PROG_VERS% - by %PROG_AUTH%
	echo.
	echo Will execute a program and show waTimer statistics afterwards
	echo Usage: %PROG_NAME% [/ver] [/I] COMMAND [PARAM1] [PARAM2] ...
	echo.
	echo Options :
	echo /ver    : version - show version and license info
	echo /I      : COMMAND is executed in popup CMD window (e.g. for programs with a lot of output)
	echo COMMAND : command that has to be timed
	echo PARAM1/2: parameters for this command
	echo.
	echo Example: %PROG_NAME% xcopy d:\folder1 d:\folder2
	echo          %PROG_NAME% ping www.sun.com
goto :end

:license
	echo === %PROG_NAME% %PROG_VERS% - by %PROG_AUTH%
	echo ======================================================================+
	echo + (c) 2003-2018 WinAdminUtils  -  https://github.com/pforret/WinAdmin  +
	echo + Open Software License  -  http://opensource.org/licenses/osl-1.1.txt +
	echo + The Original Work is provided under this License on an 'AS IS' BASIS +
	echo + and WITHOUT WARRANTY,  either express or implied, including, without +
	echo + limitation,  the warranties of NON-INFRINGEMENT,  MERCHANTABILITY or +
	echo + FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY +
	echo + OF THE ORIGINAL WORK IS WITH YOU.                                    +
	echo +======================================================================+
goto :end

::------------------------------------------------
:end
