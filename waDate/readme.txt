+======================================================================+
    waDate.wsf v1.0 (Sep 2004) - http://winadmin.sourceforge.net
+======================================================================+

Outputs a formatted date/time, for use in .CMD scripts

Usage: waDate.wsf dummy [/i:value] [/d:value] [/t:value] [/ver]

Options:

dummy : any string  (if not present: show usage) 
i     : interval    (default: 0 (hrs)  , example: -1w, +12h) 
d     : date format (default: YYYYMMDD , example: DD/MM/YY)
t     : time format (default: none     , example: HHNNSS)
ver   : version - show version and license information

Examples: 
:: IIS log file name of yesterday
waDate now /i:-1 /d:exYYMMDD.log
:: detailed string for this exact second
waDate now /t:HHNN.SS
:: using it in a CMD script
for /f "usebackq" %%d in (`waDate now /i:-1m`) do ( set ONEMONTHAGO=%%d )


*** LICENSE ***
+======================================================================+
| (c) 2004 WinAdminUtils -  http://winadmin.sourceforge.net by pforret |
| Open Software License  -  http://opensource.org/licenses/osl-1.1.txt |
| The Original Work is provided under this License on an "AS IS" BASIS |
| and WITHOUT WARRANTY,  either express or implied, including, without |
| limitation,  the warranties of NON-INFRINGEMENT,  MERCHANTABILITY or |
| FITNESS FOR A PARTICULAR PURPOSE.  THE ENTIRE RISK AS TO THE QUALITY |
| OF THE ORIGINAL WORK IS WITH YOU.                                    |
+======================================================================+

*** HISTORY ***
* v1.0 - 2004-09-13 - First public release
