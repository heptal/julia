@echo off
@rem 
@rem  This file is intended to simplify launching Julia on Windows.
@rem
@rem See prepare-julia-env.bat for more info

SET tests=%*
IF NOT !%tests%==! GOTO RUN
SET tests=all

:RUN
pushd %cd%
setlocal enableextensions enabledelayedexpansion
call "%~dp0prepare-julia-env.bat" %*
cd "%JULIA_HOME%..\share\julia\test"
call "%JULIA_HOME%julia-release-readline.exe" runtests.jl %*
endlocal
popd
pause
@echo on
