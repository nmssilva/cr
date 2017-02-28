# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {D:/Nuno Silva/Documents/UA/ano4/2sem/CR/cr/P1/P1.cache/wt} [current_project]
set_property parent.project_path {D:/Nuno Silva/Documents/UA/ano4/2sem/CR/cr/P1/P1.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {d:/Nuno Silva/Documents/UA/ano4/2sem/CR/cr/P1/P1.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  {D:/Nuno Silva/Documents/UA/ano4/2sem/CR/aula1/P1/P1.srcs/sources_1/new/SDR_P1.vhd}
  {D:/Nuno Silva/Documents/UA/ano4/2sem/CR/cr/P1/P1.srcs/sources_1/new/SDR_P1_2.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{D:/Nuno Silva/Documents/UA/ano4/2sem/CR/Nexys4_Master.xdc}}
set_property used_in_implementation false [get_files {{D:/Nuno Silva/Documents/UA/ano4/2sem/CR/Nexys4_Master.xdc}}]


synth_design -top SDR_P1 -part xc7a100tcsg324-1


write_checkpoint -force -noxdef SDR_P1.dcp

catch { report_utilization -file SDR_P1_utilization_synth.rpt -pb SDR_P1_utilization_synth.pb }