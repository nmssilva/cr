# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-3

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.cache/wt} [current_project]
set_property parent.project_path {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.xpr} [current_project]
set_property XPM_LIBRARIES XPM_MEMORY [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo {c:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.cache/ip} [current_project]
set_property ip_cache_permissions {read write} [current_project]
add_files {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/coe_from_java.coe}}
add_files -quiet {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.dcp}}
set_property used_in_implementation false [get_files {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.dcp}}]
read_vhdl -library xil_defaultlib {
  {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/sources_1/imports/aula5/exercicio53/exercicio53.srcs/sources_1/imports/new/segment_decoder.vhd}
  {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/sources_1/imports/aula5/exemplos/C�digos VHDL/VHDL/Clock_divider.vhd}
  {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/sources_1/imports/aula5/exercicio53/exercicio53.srcs/sources_1/imports/new/disp.vhd}
  {C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/sources_1/new/Ex56_aula5.vhd}
}
foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/constrs_1/imports/xdc/Nexys4_Master.xdc}}
set_property used_in_implementation false [get_files {{C:/Users/Pedro Coelho/OneDrive/UA/4ano/CR/cr/P4/Ex1/Ex1.srcs/constrs_1/imports/xdc/Nexys4_Master.xdc}}]


synth_design -top Ex1 -part xc7a100tcsg324-3


write_checkpoint -force -noxdef Ex1.dcp

catch { report_utilization -file Ex1_utilization_synth.rpt -pb Ex1_utilization_synth.pb }