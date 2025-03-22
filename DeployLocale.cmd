@echo off
echo Starting translation file copy...

echo Copying German translation...
copy "locale with dev files\de\default.mo" "locale\de\LC_MESSAGES\default.mo"

echo Copying Spanish translation...
copy "locale with dev files\es\default.mo" "locale\es\LC_MESSAGES\default.mo"

echo Copying French translation...
copy "locale with dev files\fr\default.mo" "locale\fr\LC_MESSAGES\default.mo"

echo Copying Portuguese translation...
copy "locale with dev files\pt\default.mo" "locale\pt_BR\LC_MESSAGES\default.mo"

echo All translation files copied successfully!
echo.
echo Starting locale directory copy...

echo Copying locale directory to Win32\Debug...
xcopy "locale" "Win32\Debug\locale" /E /I /Y
echo Done copying to Win32\Debug.

echo Copying locale directory to Win32\Release...
xcopy "locale" "Win32\Release\locale" /E /I /Y
echo Done copying to Win32\Release.

echo Copying locale directory to Win32\Staging...
xcopy "locale" "Win32\Staging\locale" /E /I /Y
echo Done copying to Win32\Staging.

echo All locale directories copied successfully!
pause