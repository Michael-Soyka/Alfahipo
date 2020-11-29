@echo off

mode con:cols=80 lines=30

if not "%VS120COMNTOOLS%" == "" (
	set VisualStudio_Version=2013
) else (
	if not "%VS110COMNTOOLS%" == "" (
		set VisualStudio_Version=2012
	) else (
		if not "%VS100COMNTOOLS%" == "" (
			set VisualStudio_Version=2010
		) else (
			echo No Visual Studio C++ could be found, please install VS 2013/2012/2010 and try again
			pause
			exit
		)
	)
)

:begin
for %%A in (
"+------------------------------------------------------------------------------+"
"|                            Alfahipo sln generator                            |"
"+------------------------------------------------------------------------------+"
"|                                       |                                      |"
"|   1. Standart Alfahipo                |  Hello and welcome to graphical sln  |"
"|   2. Standart Alfahipo + Shaders      |  generator for alfahipo source mod!  |"
"|                                       |                                      |"
"|   3. Standart Alfahipo + Experemental |                                      |"
"|   4. Standart Alfahipo + Ex + ViVrVb  |                                      |"
"|   5. Standart Alfahipo + Ex + VVV + P |                                      |"
"|                                       |                                      |"
"|   0. Exit                             |                                      |"
"|                                       |                                      |"
"+------------------------------------------------------------------------------+"
) do echo.%%~A

echo.
Set /p choice="Your choice: "
if not defined choice goto m1
if "%choice%"=="1" (

pushd %~dp0
  devtools\bin\vpc.exe /alfahipo +game /%VisualStudio_Version% /mksln games-vs%VisualStudio_Version%.sln
popd
)
if "%choice%"=="2" (

pushd %~dp0
  devtools\bin\vpc.exe /alfahipo +game +shaders /%VisualStudio_Version% /mksln games-vs%VisualStudio_Version%-S.sln
popd
)
if "%choice%"=="3" (

pushd %~dp0
  devtools\bin\vpc.exe /alfahipo +game +experemental /%VisualStudio_Version% /mksln games-vs%VisualStudio_Version%-EX.sln
popd
)
if "%choice%"=="4" (

pushd %~dp0
  devtools\bin\vpc.exe /alfahipo +game +experemental +mapcompilers /%VisualStudio_Version% /mksln games-vs%VisualStudio_Version%-EX-VVV.sln
popd
)
if "%choice%"=="5" (

pushd %~dp0
  devtools\bin\vpc.exe /alfahipo +game +experemental +mapcompilers +phonemeextractor /%VisualStudio_Version% /mksln games-vs%VisualStudio_Version%-EX-VVV-P.sln
popd
)
if "%choice%"=="0" (

exit
)
echo "%choice%" is not a valid option. Please try again.
cls
goto begin
pause >nul
