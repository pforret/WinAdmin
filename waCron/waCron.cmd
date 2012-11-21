@echo off
setlocal

:: ===== PARAMETER PROCESSING

set UNIQUE=%RANDOM%

set DAY=%DATE:/=_%
set DAY=%DAY:~-10%

:: ALTER THE DESTINATON OF THE LOGFILE
set LOGFILE=waCron_%DAY%.log
set TEMPOUT=%TEMP%\waCron_%UNIQUE%_out.log
set TEMPERROR=%TEMP%\waCron_%UNIQUE%_err.log
set TEMPFILE=%TEMP%\tempfile_%UNIQUE%.txt

set PROG_NAME=waCron.cmd
set PROG_VERS=v1.0
set PROG_AUTH=schuur_@users.sourceforge.net

:: ==== EMAIL PARAMETERS


:: ===== BASIC TESTS

if "%1" == ""     goto usage
if "%1" == "/?"   goto usage
if "%1" == "/ver" goto license

:: ===== START REAL PROGRAM

:execute

(
call %*
) > %TEMPOUT% 2> %TEMPERROR%

IF %ERRORLEVEL% NEQ 0 goto :alert

for %%I in ( %TEMPOUT% %TEMPERROR% ) do (
	if %%~zI GTR 0 goto :alert
	)

:: ==== EVERYTHING WAS OK

( 
echo %DATE% %TIME% - [%*] - result: OK 
echo ---
) >> %LOGFILE%

del %TEMPOUT%
del %TEMPERROR%

endlocal

goto :end

:: ==== ALERT HANDLING

:alert
(
echo RUN AT  : [%DATE% %TIME%]
echo COMMAND : [%*]
echo IDENTITY: [%USERNAME%@%USERDNSDOMAIN%]
echo ERRLEVEL: [%ERRORLEVEL%] should be 0
echo ===   STDOUT - should be empty  ===
type %TEMPOUT%
echo ===   STDERR - should be empty  ===
type %TEMPERROR%
echo ===
) > %TEMPFILE%

:: DEFAULT ACTION: save error to log
type %TEMPFILE% >> %LOGFILE%

:: OPTIONALLY: send email, send SMS
:: 
::   set RECIPIENT=alert@%USERDNSDOMAIN%
::   set SUBJECT=ALERT waCron: [%*]
::   set SUBJECT=%SUBJECT:"='%
::   set FROM=%USERNAME%@%USERDNSDOMAIN%
::   set SERVER=localhost
::
::   your_script_to_email %RECIPIENT% "%SUBJECT%" %TEMPFILE% /server:%SERVER%

del %TEMPOUT%
del %TEMPERROR%
del %TEMPFILE%

endlocal

goto :end

:: ########## START OF GENERIC PROCEDURES ##########

:usage
	echo _____  %PROG_NAME% %PROG_VERS% - by %PROG_AUTH%  _____
	echo.
	echo Usage: %PROG_NAME% [COMMAND] [PARAMETERS]
	echo.
	echo - will execute [COMMAND] [PARAMETERS]
	echo - if ERRORLEVEL is not 0, STDOUT or STDERR are not empty
	echo   then log error to file (%LOGFILE%)
	echo   Optionally, let script send email/sms/...
	echo - to be used in Scheduled Tasks or AT schedules
	echo - %PROG_NAME% /ver will give version and license info
goto :end

:license
	call :safe_echo "_____   %PROG_NAME% %PROG_VERS% - by %PROG_AUTH%   _____"
	call :safe_echo "+======================================================================+"
	call :safe_echo "| (c) 2003 WinAdminUtils -  http://winadmin.sourceforge.net by pforret |"
	call :safe_echo "| Open Software License  -  http://opensource.org/licenses/osl-1.1.txt |"
	call :safe_echo "| The Original Work is provided under this License on an 'AS IS' BASIS |"
	call :safe_echo "| and WITHOUT WARRANTY,  either express or implied, including, without |"
	call :safe_echo "| limitation,  the warranties of NON-INFRINGEMENT,  MERCHANTABILITY or |"
	call :safe_echo "| FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY |"
	call :safe_echo "| OF THE ORIGINAL WORK IS WITH YOU.                                    |"
	call :safe_echo "+======================================================================+"
goto :end

:safe_echo
	set LINE=%1
	set LINE=%LINE:|=^|%
	set LINE=%LINE:<=^<%
	set LINE=%LINE:>=^>%
	set LINE=%LINE:&=^&%
	echo %LINE:"=%
goto :end


::------------------------------------------------
:end
