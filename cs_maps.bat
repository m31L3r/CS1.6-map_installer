@echo off
cls
title cs_map installation
color 1F
cd .\

:: target festlegen
echo Target Folder? (e.g. C:\Program Files (x86)\[No-Steam] Counter-Strike 1.6\cstrike)
echo.
set /p TARGET="Enter Target >>"
goto START


:START
echo.
echo.
echo Which map should I install?
echo.
set /p MAP="Enter Map >>"

IF exist %MAP%\cstrike (
    echo C_STRIKE existing
    goto C_STRIKE
) else (
    echo C_STRIKE not existing
    goto NO_C_STRIKE
)

:C_STRIKE
IF exist %MAP%\cstrike\gfx\env (
    echo copying gfx files
    xcopy .\%MAP%\cstrike\gfx\env "%TARGET%\gfx\env" /S
)
IF exist %MAP%\cstrike\maps (
    echo copying map files
    xcopy .\%MAP%\cstrike\maps "%TARGET%\maps" /S
)
IF exist %MAP%\cstrike\models (
    echo copying model files
    xcopy .\%MAP%\cstrike\models "%TARGET%\models" /S
)
IF exist %MAP%\cstrike\overviews (
    echo copying overviews
    xcopy .\%MAP%\cstrike\overviews "%TARGET%\overviews" /S
)
IF exist %MAP%\cstrike\sprites (
    echo copying sprites
    xcopy .\%MAP%\cstrike\sprites "%TARGET%\sprites" /S
)
:: Mehrere Moeglichkeiten bei sound
IF exist %MAP%\cstrike\sound (
    IF exist %MAP%\cstrike\sound\ambience (
        echo copying ambience sound
        xcopy .\%MAP%\cstrike\sound\ambience "%TARGET%\sound\ambience" /S
    )
    IF exist %MAP%\cstrike\sound\misc (
        copying misc sound
        xcopy .\%MAP%\cstrike\sound\misc "%TARGET%\sound\misc" /S
    )
    IF NOT exist %MAP%\cstrike\sound\ambience (
        IF NOT exist %MAP%\cstrike\sound\misc (
            echo copying sound
            xcopy .\%MAP%\cstrike\sound "%TARGET%\sound" /S
            )
    )
)
goto RESTART

:NO_C_STRIKE
IF exist %MAP%\gfx\env (
    echo copying gfx files
    xcopy .\%MAP%\gfx\env "%TARGET%\gfx\env" /S
)
IF exist %MAP%\maps (
    echo copying map files
    xcopy .\%MAP%\maps "%TARGET%\maps" /S
)
IF exist %MAP%\models (
    echo copying model files
    xcopy .\%MAP%\models "%TARGET%\models" /S
)
IF exist %MAP%\overviews (
    echo copying overviews
    xcopy .\%MAP%\overviews "%TARGET%\overviews" /S
)
IF exist %MAP%\sprites (
    echo copying sprites
    xcopy .\%MAP%\sprites "%TARGET%\sprites" /S
)
:: Mehrere Moeglichkeiten bei sound
IF exist %MAP%\sound (
    IF exist %MAP%\sound\ambience (
        echo copying ambience sound
        xcopy .\%MAP%\sound\ambience "%TARGET%\sound\ambience" /S
    )
    IF exist %MAP%\sound\misc (
        echo copying misc sound
        xcopy .\%MAP%\sound\misc "%TARGET%\sound\misc" /S
    )
    IF NOT exist %MAP%\sound\ambience (
        IF NOT exist %MAP%\sound\misc (
            echo copying sound
            xcopy .\%MAP%\sound "%TARGET%\sound" /S
            )
    )
)
IF exist %MAP%\*.bsp (
    echo copying map files
    xcopy .\%MAP%\*.* "%TARGET%\maps"
)
goto RESTART

:RESTART
echo Should I install another map?
echo.
set /p CHOICE="Press (y) for yes >>"
IF %CHOICE%==y (
    cls
    goto START
) else (
    exit
)


pause >nul

exit
