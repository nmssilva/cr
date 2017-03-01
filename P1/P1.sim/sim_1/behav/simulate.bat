@echo off
set xv_path=D:\\Programs\\Vivado\\Vivado\\2016.4\\bin
call %xv_path%/xsim SDR_P1_behav -key {Behavioral:sim_1:Functional:SDR_P1} -tclbatch SDR_P1.tcl -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
