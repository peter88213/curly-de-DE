@echo off
REM
REM summary: Removes the OOTyW_de-DE software package.
REM 
REM author: Peter Triesberger
REM see: https://github.com/peter88213/OOTyW_de-DE
REM license: The MIT License (https://opensource.org/licenses/mit-license.php)
REM copyright: (c) 2019, Peter Triesberger
REM 
REM note: This script is to be executed manually.
REM 
REM Preconditions:
REM * OOTyW_de-DE is installed.
REM * OpenOffice.org 3.x or Apache OpenOffice 4.x is installed.
REM 
REM Postconditions:
REM * Previously auto-installed items of OOTyW_de-DE are removed.
REM * The template remains, if user wants it.

set _release=2.0.1

set _OpenOffice4_w64=c:\Program Files (x86)\OpenOffice 4
set _OpenOffice4_w32=c:\Program Files\OpenOffice 4
set _OpenOffice3_w64=c:\Program Files (x86)\OpenOffice.org 3
set _OpenOffice3_w32=c:\Program Files\OpenOffice.org 3
set _LibreOffice6_w64=c:\Program Files (x86)\LibreOffice
set _LibreOffice6_w32=c:\Program Files\LibreOffice

set _OpenOffice4_Userprofile=AppData\Roaming\OpenOffice\4\user
set _OpenOffice3_Userprofile=AppData\Roaming\OpenOffice.org\3\user
set _LibreOffice_Userprofile=AppData\Roaming\LibreOffice\4\user

echo -----------------------------------------------------------------
echo OOTyW_de-DE (OpenOffice typography tools for yWriter users) v%_release%
echo Installing software package ...
rem Detect Combination of Windows and Office 
echo -----------------------------------------------------------------
if exist "%_OpenOffice4_w64%\program\swriter.exe" goto OpenOffice4-Win64
if exist "%_OpenOffice4_w32%\program\swriter.exe" goto OpenOffice4-Win32
if exist "%_OpenOffice3_w64%\program\swriter.exe" goto OpenOffice3-Win64
if exist "%_OpenOffice3_w32%\program\swriter.exe" goto OpenOffice3-Win32
if exist "%_LibreOffice6_w64%\program\swriter.exe" goto LibreOffice6-Win64
if exist "%_LibreOffice6_w32%\program\swriter.exe" goto LibreOffice6-Win32
echo ERROR: No supported version of OpenOffice/LibreOffice found!
echo Installation aborted.
goto end

:OpenOffice4-Win64
set _writer=%_OpenOffice4_w64%
set _user=%USERPROFILE%\%_OpenOffice4_Userprofile%
set _ext=OOTyW_de-DE-A-%_release%.oxt
echo OpenOffice 4.x - Windows (64 bit)
goto settings_done

:OpenOffice4-Win32
set _writer=%_OpenOffice4_w32%
set _user=%USERPROFILE%\%_OpenOffice4_Userprofile%
set _ext=OOTyW_de-DE-A-%_release%.oxt
echo OpenOffice 4.x - Windows (32 bit)
goto settings_done

:OpenOffice3-Win64
set _writer=%_OpenOffice3_w64%
set _user=%USERPROFILE%\%_OpenOffice3_Userprofile%
set _ext=OOTyW_de-DE-%_release%.oxt
echo OpenOffice 3.x - Windows (64 bit)
goto settings_done

:OpenOffice3-Win32
set _writer=%_OpenOffice3_w32%
set _user=%USERPROFILE%\%_OpenOffice3_Userprofile%
set _ext=OOTyW_de-DE-%_release%.oxt
echo OpenOffice 3.x - Windows (32 bit)
goto settings_done

:LibreOffice6-Win64
set _writer=%_LibreOffice6_w64%
set _user=%USERPROFILE%\%_LibreOffice_Userprofile%
set _ext=OOTyW_de-DE-L-%_release%.oxt
echo LibreOffice 6.x
goto settings_done

:LibreOffice6-Win32
set _writer=%_LibreOffice6_w32%
set _user=%USERPROFILE%\%_LibreOffice_Userprofile%
set _ext=OOTyW_de-DE-L-%_release%.oxt
echo LibreOffice 6.x
goto settings_done

:settings_done

echo Removing OpenOffice extension %_ext% ...

"%_writer%\program\unopkg" remove -f %_ext%

echo Deleting template in %_user%\template (on confirmation only) ...

set _file="%_user%\template\yWriter.ott"
if exist %_file% del /p %_file%

echo -----------------------------------------------------------------
echo #
echo # OOTyW_de-DE v%_release% is removed from your PC.
echo #
echo -----------------------------------------------------------------
pause



:end