if %1 == x64 (
    set build_arch=x64
    set "PATH=%~dp0qt-everywhere-src-5.15.13\qtbase\bin;%~dp0qt-everywhere-src-5.15.13\gnuwin32\bin;%~dp0jom;%PATH%"
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvars64.bat"
    pushd %~dp0qt-everywhere-src-5.15.13\
    call configure.bat -release -opensource -confirm-license -prefix %~dp0bin\5.15.13\msvc2019_64 -platform win32-msvc -nomake tests -nomake examples -skip qtdoc -skip qtwebengine
    jom
    if %ERRORLEVEL% == 0 jom install
)

if %1 == Win32 (
    set build_arch=x86
    set "PATH=%~dp0qt-everywhere-src-5.15.13\qtbase\bin;%~dp0qt-everywhere-src-5.15.13\gnuwin32\bin;%~dp0jom;%PATH%"
    call "C:\Program Files (x86)\Microsoft Visual Studio\2019\Enterprise\VC\Auxiliary\Build\vcvarsamd64_x86.bat"
    pushd %~dp0qt-everywhere-src-5.15.13\
    call configure.bat -release -opensource -confirm-license -prefix %~dp0bin\5.15.13\msvc2019 -platform win32-msvc -nomake tests -nomake examples -skip qtdoc -skip qtwebengine
    jom
    if %ERRORLEVEL% == 0 jom install
)