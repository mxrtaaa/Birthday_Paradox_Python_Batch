@echo off
chcp 65001 >nul

Title Paradoks urodzin
color 0D

:menu
cls

echo.
echo         * * * PARADOKS URODZIN * * *
echo.
echo                 ,   ,   ,   ,
echo               , ^|_,_^|_,_^|_,_^| ,
echo           _,-=^|;  ^|,  ^|,  ^|,  ^|;=-_
echo         .-_^| , ^| , ^| , ^| , ^| , ^|  _-.
echo         ^|:  -^|:._^|___^|___^|__.^|:=-  :^|
echo         ^|^|*:  :    .     .    :  ^|*^|^|
echo         ^|^| ^|  ^| *  ^|  *  ^|  * ^|  ^| ^|^|
echo     _.-=^|:*^|  ^|    ^|     ^|    ^|  ^|*:^|=-._
echo    -    `._:  ^| *  ^|  *  ^|  * ^|  :_.'    -
echo     =_      -=:.___:_____^|___.: =-     _=
echo        - . _ __ ___  ___  ___ __ _ . -
echo.
echo.
echo        *─────────── MENU ────────────*
echo        │     1. Uruchom program      │
echo        │     2. Wyświetl opis        │
echo        │     3. Utwórz backup        │
echo        │     4. Wyjście              │
echo        *─────────────────────────────*
echo.

set choice=0
set /p choice=Wybierz opcję (1-4):

if %choice%==1 goto opcja1
if %choice%==2 goto opcja2
if %choice%==3 goto opcja3
if %choice%==4 goto exit

echo.
echo Podano błędną liczbę!
echo.
echo Naciśnij dowolny przycisk...
pause >nul
goto menu

:opcja1

IF EXIST raport.html DEL raport.html
IF NOT EXIST output mkdir output
DEL /Q output
echo.
echo Uruchamiam paradoks-urodzin.py...
python paradoks-urodzin.py
echo Wykonuję raport obliczonego wyniku...
python raport.py
echo Pomyślnie wykonano program!
echo.
call raport.html
echo Naciśnij dowolny przycisk...
pause >nul
goto menu

:opcja2
echo.
echo          * Paradoks urodzin *
echo    Autorka programu: Marta Załuska
echo.
echo Program rozwiązuje eksperymentalnie zagadnienie paradoksu urodzin.
echo Zadanie to polega na znalezieniu takiej liczby osób, aby szanse na to,
echo że wśród nich znajdą się dwie osoby urodzone w tym samym dniu roku były większe,
echo niż szanse na to, że takich dwóch osób nie ma. Samego roku nie bierzemy pod uwagę.
echo Zadanie to realizuję generując losową próbkę n osób (a dokładniej dat ich urodzin)
echo i po jej wygenerowaniu sprawdzając wystąpienie pary.
echo Aby doświadczenie dało miarodajne wyniki, dla każdego n przeprowadzam wiele prób
echo - ta liczba jest zadana w pliku wejściowym, a domyślnie równa 20000.
echo Postępując w ten sposób obliczam najmniejszą liczbę naturalną spełniającą warunki zadania.
echo.
echo Naciśnij dowolny przycisk...
pause >nul
goto menu

:opcja3
echo.
echo Wykonuję kopię zapasową piku wyjściowego i raportów...
IF NOT EXIST backups mkdir backups

for /f "tokens=1-3 delims=-/. " %%a in ("%date%") do (
    set day=%%a
    set month=%%b
    set year=%%c
)

set hour=%time:~0,2%
set minute=%time:~3,2%
set second=%time:~6,2%

if "%hour:~0,1%"==" " set hour=0%hour:~1,1%

set date=%day%-%month%-%year%--%hour%-%minute%-%second%

IF EXIST raport.html mkdir backups\%date%
robocopy output backups\%date%\output
copy raport.html backups\%date%\raport.html

echo Zakończono kopię zapasową!
echo.
echo Naciśnij dowolny przycisk...
pause >nul
goto menu

:exit
