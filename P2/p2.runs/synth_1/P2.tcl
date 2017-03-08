# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {Common 17-41} -limit 10000000
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/p2/p2.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/p2/p2.xpr} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {c:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/p2/p2.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/p2/p2.srcs/sources_1/new/P2.vhd}}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/p2/p2.srcs/constrs_1/imports/cenas/Nexys4_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/p2/p2.srcs/constrs_1/imports/cenas/Nexys4_Master.xdc}}]


synth_design -top P2 -part xc7a100tcsg324-1


write_checkpoint -force -noxdef P2.dcp

catch { report_utilization -file P2_utilization_synth.rpt -pb P2_utilization_synth.pb }