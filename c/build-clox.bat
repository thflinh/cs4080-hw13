@echo off
REM One-shot clox build (requires MinGW-w64, MSYS2, or LLVM clang in PATH).
set SRC=main.c chunk.c memory.c debug.c value.c vm.c compiler.c scanner.c object.c table.c
where gcc >nul 2>&1
if %ERRORLEVEL%==0 (
  gcc -std=c11 -Wall -Wextra -Wno-unused-parameter -O3 -o clox.exe %SRC%
  exit /b %ERRORLEVEL%
)
where clang >nul 2>&1
if %ERRORLEVEL%==0 (
  clang -std=c11 -Wall -Wextra -Wno-unused-parameter -O3 -o clox.exe %SRC%
  exit /b %ERRORLEVEL%
)
echo No gcc or clang found. Install MSYS2 mingw-w64 and add bin to PATH, or compile from WSL/Linux.
exit /b 1
