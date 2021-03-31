cd ..\..\curly\tools\help
call convert.bat
cd ..\..\..\curly-de-DE\tools

xcopy /Y /s ..\..\curly\oxt ..\oxt\
copy /Y ..\..\curly\src\*.xba ..\oxt\curly_de-DE\

