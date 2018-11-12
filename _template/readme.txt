
### [[waTemplate.wsf]] vX.X (MMM YYYY)
### Peter Forret - https://github.com/pforret/WinAdmin
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


