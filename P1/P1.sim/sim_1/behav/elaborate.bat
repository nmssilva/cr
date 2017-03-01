@echo off
set xv_path=D:\\Programs\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 929f8b71ae234e14bf9678e4099806fe -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot SDR_P1_behav xil_defaultlib.SDR_P1 -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
