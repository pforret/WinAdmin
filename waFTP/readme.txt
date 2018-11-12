
Simple FTP script, uploads file to an FTP server

Usage: waFTP.wsf command file server path [/u:value] [/p:value] [/ver] [/v] [/q] [/log:value]

Options:

command : command    - currently only 'UPLOAD' is supported
file    : filename   - local file name
server  : ftp server - ftp server name
path    : ftp path   - path on ftp server
u       : username   - username to log in
p       : password   - password to log in
ver     : version - show version and license information
	
v       : verbose - show debug output during execution
q       : quiet   - show no output during execution
log     : logfile - log output in file
	if filename='D' use [script name].YYYYMMDD.log as log file
	if filename='M' use [script name].YYYYMM.log as log file
	if no filename given use [script name].log as log file

Examples: 
waFTP.wsf UPLOAD readme.txt ftp.myserver.com submissions /u:john /p:qpublic /log:D

