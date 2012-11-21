+======================================================================+
    waTemplate.wsf vX.X (Jan 2004) - http://winadmin.sourceforge.net
+======================================================================+

This is a base template for .wsf scripts. It is used for all waUtils scripts.
Use it for your own scripts, change it in whatever way you like.


Usage: waTemplate.wsf PARAM /option1:value [/option2:value] [/v] [/q] [/log:value] [/ver]

Options:

PARAM   : parameter (required)
option1 : server name
option2 : server port (default: 80)
v       : verbose - show debug output during execution
q       : quiet   - show no output during execution
log     : logfile - log output in file
	if filename='D' use [script name].YYYYMMDD.log as log file
	if filename='M' use [script name].YYYYMM.log as log file
	if no filename given use [script name].log as log file
ver     : version - show version and license information


Examples: 
waTemplate.wsf /option1:prod003 test1
  :: run script on server 'prod003'


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
* v1.4 - 2004-06-15 - /log bug, duration (H/D/W/M/Y) parsing
* v1.3 - 2004-01-05 - Named parameter parsing
* v1.2 - 2003-09-19 - Corrected logname bug - included program history
* v1.1 - 2003-09-05 - Enhanced logname generation (per day/month)
* v1.0 - 2003-09-04 - First public release

