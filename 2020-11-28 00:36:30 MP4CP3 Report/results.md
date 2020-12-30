# AG Report Generated 2020-11-28 00:36
This is a report about mp4cp3 generated for RISC-y_Business3 at 2020-11-28 00:36. The autograder used commit ``82f1402562fb`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: YES
 - Targeted: 2/3 (66.7%)
### Compilation ![Success][success]
You succesfully compiled. Your report is below.
<details>
<summary>Compilation Report</summary>

```
Info: *******************************************************************
Info: Running Quartus Prime Analysis & Synthesis
    Info: Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
    Info: Copyright (C) 2018  Intel Corporation. All rights reserved.
    Info: Your use of Intel Corporation's design tools, logic functions 
    Info: and other software and tools, and its AMPP partner logic 
    Info: functions, and any output files from any of the foregoing 
    Info: (including device programming or simulation files), and any 
    Info: associated documentation or information are expressly subject 
    Info: to the terms and conditions of the Intel Program License 
    Info: Subscription Agreement, the Intel Quartus Prime License Agreement,
    Info: the Intel FPGA IP License Agreement, or other applicable license
    Info: agreement, including, without limitation, that your use is for
    Info: the sole purpose of programming logic devices manufactured by
    Info: Intel and sold by Intel or its authorized distributors.  Please
    Info: refer to the applicable agreement for further details.
    Info: Processing started: Sat Nov 28 06:35:19 2020
Info: Command: quartus_map mp4 -c mp4
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20029): Only one processor detected - disabling parallel compilation
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/data_array.sv
    Info (12023): Found entity 1: data_array File: /job/student/hdl/cache/data_array.sv Line: 5
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cacheline_adaptor.sv
    Info (12023): Found entity 1: cacheline_adaptor File: /job/student/hdl/cache/cacheline_adaptor.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache_top.sv
    Info (12023): Found entity 1: cache_top File: /job/student/hdl/cache/cache_top.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache_datapath.sv
    Info (12023): Found entity 1: cache_datapath File: /job/student/hdl/cache/cache_datapath.sv Line: 7
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache_control.sv
    Info (12023): Found entity 1: cache_control File: /job/student/hdl/cache/cache_control.sv Line: 4
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache.sv
    Info (12023): Found entity 1: cache File: /job/student/hdl/cache/cache.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/bus_adapter.sv
    Info (12023): Found entity 1: bus_adapter File: /job/student/hdl/cache/bus_adapter.sv Line: 6
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/array.sv
    Info (12023): Found entity 1: array File: /job/student/hdl/cache/array.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/arbiter.sv
    Info (12023): Found entity 1: arbiter File: /job/student/hdl/cache/arbiter.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/ctrl_reg.sv
    Info (12023): Found entity 1: ctrl_reg File: /job/student/hdl/ctrl_reg.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cmp.sv
    Info (12023): Found entity 1: cmp File: /job/student/hdl/cmp.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/processor/datapath.sv
    Info (12023): Found entity 1: datapath File: /job/student/hdl/processor/datapath.sv Line: 5
Info (12021): Found 1 design units, including 1 entities, in source file hdl/processor/control_rom.sv
    Info (12023): Found entity 1: control_rom File: /job/student/hdl/processor/control_rom.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/mp4.sv
    Info (12023): Found entity 1: mp4 File: /job/student/hdl/mp4.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/alu.sv
    Info (12023): Found entity 1: alu File: /job/student/hdl/alu.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/ir.sv
    Info (12023): Found entity 1: ir File: /job/student/hdl/ir.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/regfile.sv
    Info (12023): Found entity 1: regfile File: /job/student/hdl/regfile.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/register.sv
    Info (12023): Found entity 1: register File: /job/student/hdl/register.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/pc_reg.sv
    Info (12023): Found entity 1: pc_register File: /job/student/hdl/pc_reg.sv Line: 1
Info (12021): Found 6 design units, including 0 entities, in source file hdl/rv32i_mux_types.sv
    Info (12022): Found design unit 1: pcmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 3
    Info (12022): Found design unit 2: marmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 11
    Info (12022): Found design unit 3: cmpmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 18
    Info (12022): Found design unit 4: alumux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 25
    Info (12022): Found design unit 5: regfilemux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 37
    Info (12022): Found design unit 6: immmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 51
Info (12021): Found 1 design units, including 0 entities, in source file hdl/rv32i_types.sv
    Info (12022): Found design unit 1: rv32i_types (SystemVerilog) File: /job/student/hdl/rv32i_types.sv Line: 3
Info (12127): Elaborating entity "mp4" for the top level hierarchy
Info (12128): Elaborating entity "datapath" for hierarchy "datapath:i_datapath" File: /job/student/hdl/mp4.sv Line: 57
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(38): object "halt" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 38
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(44): object "wb_flush" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 44
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(88): object "trap" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 88
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(89): object "rmask" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 89
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:i_datapath|pc_register:PC" File: /job/student/hdl/processor/datapath.sv Line: 133
Info (12128): Elaborating entity "ir" for hierarchy "datapath:i_datapath|ir:IR" File: /job/student/hdl/processor/datapath.sv Line: 144
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|register:if_id_pc_reg" File: /job/student/hdl/processor/datapath.sv Line: 149
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:i_datapath|regfile:regfile" File: /job/student/hdl/processor/datapath.sv Line: 162
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|register:id_ex_rs1_reg" File: /job/student/hdl/processor/datapath.sv Line: 173
Info (12128): Elaborating entity "ctrl_reg" for hierarchy "datapath:i_datapath|ctrl_reg:id_ex_ctrl_reg" File: /job/student/hdl/processor/datapath.sv Line: 193
Info (12128): Elaborating entity "alu" for hierarchy "datapath:i_datapath|alu:ALU" File: /job/student/hdl/processor/datapath.sv Line: 201
Info (12128): Elaborating entity "cmp" for hierarchy "datapath:i_datapath|cmp:CMP" File: /job/student/hdl/processor/datapath.sv Line: 208
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|register:ex_mem_br_reg" File: /job/student/hdl/processor/datapath.sv Line: 234
Info (12128): Elaborating entity "control_rom" for hierarchy "control_rom:i_control_rom" File: /job/student/hdl/mp4.sv Line: 64
Warning (10036): Verilog HDL or VHDL warning at control_rom.sv(13): object "store_funct3" assigned a value but never read File: /job/student/hdl/processor/control_rom.sv Line: 13
Warning (10036): Verilog HDL or VHDL warning at control_rom.sv(14): object "load_funct3" assigned a value but never read File: /job/student/hdl/processor/control_rom.sv Line: 14
Warning (10036): Verilog HDL or VHDL warning at control_rom.sv(15): object "branch_funct3" assigned a value but never read File: /job/student/hdl/processor/control_rom.sv Line: 15
Info (12128): Elaborating entity "cache_top" for hierarchy "cache_top:i_cache_top" File: /job/student/hdl/mp4.sv Line: 92
Info (12128): Elaborating entity "cache" for hierarchy "cache_top:i_cache_top|cache:i_cache" File: /job/student/hdl/cache/cache_top.sv Line: 55
Info (12128): Elaborating entity "cache_control" for hierarchy "cache_top:i_cache_top|cache:i_cache|cache_control:control" File: /job/student/hdl/cache/cache.sv Line: 80
Info (12128): Elaborating entity "cache_datapath" for hierarchy "cache_top:i_cache_top|cache:i_cache|cache_datapath:datapath" File: /job/student/hdl/cache/cache.sv Line: 109
Info (12128): Elaborating entity "data_array" for hierarchy "cache_top:i_cache_top|cache:i_cache|cache_datapath:datapath|data_array:data_array1" File: /job/student/hdl/cache/cache_datapath.sv Line: 63
Info (12128): Elaborating entity "bus_adapter" for hierarchy "cache_top:i_cache_top|cache:i_cache|bus_adapter:bus_adapter" File: /job/student/hdl/cache/cache.sv Line: 120
Info (12128): Elaborating entity "arbiter" for hierarchy "cache_top:i_cache_top|arbiter:_arbiter" File: /job/student/hdl/cache/cache_top.sv Line: 100
Info (12128): Elaborating entity "cacheline_adaptor" for hierarchy "cache_top:i_cache_top|cacheline_adaptor:_cacheline_adaptor" File: /job/student/hdl/cache/cache_top.sv Line: 119
Warning (13024): Output pins are stuck at VCC or GND
    Warning (13410): Pin "pmem_address[0]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[1]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[2]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[3]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[4]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
Info (286030): Timing-Driven Synthesis is running
Info (17049): 62 registers lost all their fanouts during netlist optimizations.
Info (144001): Generated suppressed messages file /job/student/output_files/mp4.map.smsg
Info (16010): Generating hard_block partition "hard_block:auto_generated_inst"
    Info (16011): Adding 0 node(s), including 0 DDIO, 0 PLL, 0 transceiver and 0 LCELL
Info (21057): Implemented 18827 device resources after synthesis - the final resource count might be different
    Info (21058): Implemented 67 input pins
    Info (21059): Implemented 98 output pins
    Info (21061): Implemented 18662 logic cells
Info: Quartus Prime Analysis & Synthesis was successful. 0 errors, 14 warnings
    Info: Peak virtual memory: 1240 megabytes
    Info: Processing ended: Sat Nov 28 06:36:22 2020
    Info: Elapsed time: 00:01:03
    Info: Total CPU time (on all processors): 00:01:00
Info: *******************************************************************
Info: Running Quartus Prime Shell
    Info: Version 18.1.0 Build 625 09/12/2018 SJ Standard Edition
    Info: Copyright (C) 2018  Intel Corporation. All rights reserved.
    Info: Your use of Intel Corporation's design tools, logic functions 
    Info: and other software and tools, and its AMPP partner logic 
    Info: functions, and any output files from any of the foregoing 
    Info: (including device programming or simulation files), and any 
    Info: associated documentation or information are expressly subject 
    Info: to the terms and conditions of the Intel Program License 
    Info: Subscription Agreement, the Intel Quartus Prime License Agreement,
    Info: the Intel FPGA IP License Agreement, or other applicable license
    Info: agreement, including, without limitation, that your use is for
    Info: the sole purpose of programming logic devices manufactured by
    Info: Intel and sold by Intel or its authorized distributors.  Please
    Info: refer to the applicable agreement for further details.
    Info: Processing started: Sat Nov 28 06:36:23 2020
Info: Command: quartus_sh -t /opt/altera/quartus/common/tcl/internal/nativelink/qnativesim.tcl --gen_script --rtl_sim mp4 mp4
Info: Quartus(args): --gen_script --rtl_sim mp4 mp4
Info: Info: Start Nativelink Simulation process
Info: Info: NativeLink has detected Verilog design -- Verilog simulation models will be used
Info: Info: Starting NativeLink simulation with ModelSim-Altera software
Info: Info: Generated ModelSim-Altera script file /job/student/simulation/modelsim/mp4_run_msim_rtl_verilog.do File: /job/student/simulation/modelsim/mp4_run_msim_rtl_verilog.do Line: 0
Info: Info: NativeLink simulation flow was successful
Info: Info: For messages from NativeLink scripts, check the file /job/student/mp4_nativelink_simulation.rpt File: /job/student/mp4_nativelink_simulation.rpt Line: 0
Info (23030): Evaluation of Tcl script /opt/altera/quartus/common/tcl/internal/nativelink/qnativesim.tcl was successful
Info: Quartus Prime Shell was successful. 0 errors, 0 warnings
    Info: Peak virtual memory: 801 megabytes
    Info: Processing ended: Sat Nov 28 06:36:23 2020
    Info: Elapsed time: 00:00:00
    Info: Total CPU time (on all processors): 00:00:00
Reading pref.tcl

# 10.5b

ModelSim> transcript on
ModelSim> > > if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
ModelSim> vlib rtl_work
ModelSim> vmap work rtl_work
# Model Technology ModelSim - Intel FPGA Edition vmap 10.5b Lib Mapping Utility 2016.10 Oct  5 2016
# vmap work rtl_work 
# Modifying /opt/altera/modelsim_ase/linuxaloem/../modelsim.ini
ModelSim> 
> 
vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/data_array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/data_array.sv 
# -- Compiling module data_array
# 
# Top level modules:
# 	data_array
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cacheline_adaptor.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cacheline_adaptor.sv 
# -- Compiling module cacheline_adaptor
# 
# Top level modules:
# 	cacheline_adaptor
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache_control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache_control.sv 
# -- Compiling module cache_control
# 
# Top level modules:
# 	cache_control
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/bus_adapter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/bus_adapter.sv 
# -- Compiling module bus_adapter
# 
# Top level modules:
# 	bus_adapter
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/regfile.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/regfile.sv 
# -- Compiling module regfile
# 
# Top level modules:
# 	regfile
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/register.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/register.sv 
# -- Compiling module register
# 
# Top level modules:
# 	register
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/pc_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/pc_reg.sv 
# -- Compiling module pc_register
# 
# Top level modules:
# 	pc_register
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_mux_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rv32i_mux_types.sv 
# -- Compiling package pcmux
# -- Compiling package marmux
# -- Compiling package cmpmux
# -- Compiling package alumux
# -- Compiling package regfilemux
# -- Compiling package immmux
# 
# Top level modules:
# 	--none--
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/rv32i_types.sv 
# -- Compiling package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# 
# Top level modules:
# 	--none--
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache_top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache_top.sv 
# -- Compiling package cache_top_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module cache_top
# 
# Top level modules:
# 	cache_top
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache_datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache_datapath.sv 
# -- Compiling package cache_datapath_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module cache_datapath
# 
# Top level modules:
# 	cache_datapath
# End time: 06:36:24 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:24 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cache.sv 
# -- Compiling package cache_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module cache
# 
# Top level modules:
# 	cache
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/arbiter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/arbiter.sv 
# -- Compiling package arbiter_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module arbiter
# 
# Top level modules:
# 	arbiter
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/ctrl_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/ctrl_reg.sv 
# -- Compiling package ctrl_reg_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module ctrl_reg
# 
# Top level modules:
# 	ctrl_reg
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cmp.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/cmp.sv 
# -- Compiling package cmp_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module cmp
# 
# Top level modules:
# 	cmp
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/processor {/job/student/hdl/processor/datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/processor" /job/student/hdl/processor/datapath.sv 
# -- Compiling package datapath_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module datapath
# ** Warning: /job/student/hdl/processor/datapath.sv(452): (vlog-2182) 'mem_regfilemux_out' might be read before written in always_comb or always @* block.
# 
# Top level modules:
# 	datapath
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/processor {/job/student/hdl/processor/control_rom.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl/processor" /job/student/hdl/processor/control_rom.sv 
# -- Compiling package control_rom_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module control_rom
# 
# Top level modules:
# 	control_rom
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mp4.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/mp4.sv 
# -- Compiling package mp4_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module mp4
# 
# Top level modules:
# 	mp4
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/alu.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/alu.sv 
# -- Compiling package alu_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module alu
# 
# Top level modules:
# 	alu
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/ir.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/ir.sv 
# -- Compiling package ir_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module ir
# 
# Top level modules:
# 	ir
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vlog -vlog01compat -work work +incdir+/job/student/hvl {/job/student/hvl/rvfimon.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -vlog01compat -work work "+incdir+/job/student/hvl" /job/student/hvl/rvfimon.v 
# -- Compiling module riscv_formal_monitor_rv32imc
# -- Compiling module riscv_formal_monitor_rv32imc_rob
# -- Compiling module riscv_formal_monitor_rv32imc_isa_spec
# -- Compiling module riscv_formal_monitor_rv32imc_insn_add
# -- Compiling module riscv_formal_monitor_rv32imc_insn_addi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_and
# -- Compiling module riscv_formal_monitor_rv32imc_insn_andi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_auipc
# -- Compiling module riscv_formal_monitor_rv32imc_insn_beq
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bge
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bgeu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_blt
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bltu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_bne
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_add
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi16sp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_addi4spn
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_and
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_andi
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_beqz
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_bnez
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_j
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jal
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jalr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_jr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_li
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lui
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_lwsp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_mv
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_or
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_slli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_srai
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_srli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_sub
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_sw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_swsp
# -- Compiling module riscv_formal_monitor_rv32imc_insn_c_xor
# -- Compiling module riscv_formal_monitor_rv32imc_insn_div
# -- Compiling module riscv_formal_monitor_rv32imc_insn_divu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_jal
# -- Compiling module riscv_formal_monitor_rv32imc_insn_jalr
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lb
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lbu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lhu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lui
# -- Compiling module riscv_formal_monitor_rv32imc_insn_lw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mul
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulhsu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_mulhu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_or
# -- Compiling module riscv_formal_monitor_rv32imc_insn_ori
# -- Compiling module riscv_formal_monitor_rv32imc_insn_rem
# -- Compiling module riscv_formal_monitor_rv32imc_insn_remu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sb
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sh
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sll
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slt
# -- Compiling module riscv_formal_monitor_rv32imc_insn_slti
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sltiu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sltu
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sra
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srai
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srl
# -- Compiling module riscv_formal_monitor_rv32imc_insn_srli
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sub
# -- Compiling module riscv_formal_monitor_rv32imc_insn_sw
# -- Compiling module riscv_formal_monitor_rv32imc_insn_xor
# -- Compiling module riscv_formal_monitor_rv32imc_insn_xori
# 
# Top level modules:
# 	riscv_formal_monitor_rv32imc
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/source_tb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/source_tb.sv 
# -- Compiling module magic_memory_dp
# -- Compiling module ParamMemory
# ** Warning: ** while parsing file included at /job/student/hvl/source_tb.sv(14)
# ** at hvl/param_memory.sv(25): (vlog-2244) Variable 'iteration' is implicitly static. You must either explicitly declare it as static or automatic
# or remove the initialization in the declaration of variable.
# -- Compiling interface rvfi_itf
# -- Compiling module shadow_memory
# -- Compiling interface tb_itf
# -- Compiling package ag_rv32i_types
# -- Compiling package source_tb_sv_unit
# -- Importing package ag_rv32i_types
# -- Compiling module source_tb
# 
# Top level modules:
# 	source_tb
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 06:36:25 on Nov 28,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/top.sv 
# -- Compiling module mp4_tb
# 
# Top level modules:
# 	mp4_tb
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs="+acc"  mp4_tb
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs=""+acc"" mp4_tb 
# Start time: 06:36:25 on Nov 28,2020
# Loading sv_std.std
# Loading work.mp4_tb
# Loading work.tb_itf
# Loading work.rvfi_itf
# Loading work.ag_rv32i_types
# Loading work.source_tb_sv_unit
# Loading work.source_tb
# Loading work.riscv_formal_monitor_rv32imc
# Loading work.riscv_formal_monitor_rv32imc_isa_spec
# Loading work.riscv_formal_monitor_rv32imc_insn_add
# Loading work.riscv_formal_monitor_rv32imc_insn_addi
# Loading work.riscv_formal_monitor_rv32imc_insn_and
# Loading work.riscv_formal_monitor_rv32imc_insn_andi
# Loading work.riscv_formal_monitor_rv32imc_insn_auipc
# Loading work.riscv_formal_monitor_rv32imc_insn_beq
# Loading work.riscv_formal_monitor_rv32imc_insn_bge
# Loading work.riscv_formal_monitor_rv32imc_insn_bgeu
# Loading work.riscv_formal_monitor_rv32imc_insn_blt
# Loading work.riscv_formal_monitor_rv32imc_insn_bltu
# Loading work.riscv_formal_monitor_rv32imc_insn_bne
# Loading work.riscv_formal_monitor_rv32imc_insn_c_add
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi16sp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_addi4spn
# Loading work.riscv_formal_monitor_rv32imc_insn_c_and
# Loading work.riscv_formal_monitor_rv32imc_insn_c_andi
# Loading work.riscv_formal_monitor_rv32imc_insn_c_beqz
# Loading work.riscv_formal_monitor_rv32imc_insn_c_bnez
# Loading work.riscv_formal_monitor_rv32imc_insn_c_j
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jal
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jalr
# Loading work.riscv_formal_monitor_rv32imc_insn_c_jr
# Loading work.riscv_formal_monitor_rv32imc_insn_c_li
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lui
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lw
# Loading work.riscv_formal_monitor_rv32imc_insn_c_lwsp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_mv
# Loading work.riscv_formal_monitor_rv32imc_insn_c_or
# Loading work.riscv_formal_monitor_rv32imc_insn_c_slli
# Loading work.riscv_formal_monitor_rv32imc_insn_c_srai
# Loading work.riscv_formal_monitor_rv32imc_insn_c_srli
# Loading work.riscv_formal_monitor_rv32imc_insn_c_sub
# Loading work.riscv_formal_monitor_rv32imc_insn_c_sw
# Loading work.riscv_formal_monitor_rv32imc_insn_c_swsp
# Loading work.riscv_formal_monitor_rv32imc_insn_c_xor
# Loading work.riscv_formal_monitor_rv32imc_insn_div
# Loading work.riscv_formal_monitor_rv32imc_insn_divu
# Loading work.riscv_formal_monitor_rv32imc_insn_jal
# Loading work.riscv_formal_monitor_rv32imc_insn_jalr
# Loading work.riscv_formal_monitor_rv32imc_insn_lb
# Loading work.riscv_formal_monitor_rv32imc_insn_lbu
# Loading work.riscv_formal_monitor_rv32imc_insn_lh
# Loading work.riscv_formal_monitor_rv32imc_insn_lhu
# Loading work.riscv_formal_monitor_rv32imc_insn_lui
# Loading work.riscv_formal_monitor_rv32imc_insn_lw
# Loading work.riscv_formal_monitor_rv32imc_insn_mul
# Loading work.riscv_formal_monitor_rv32imc_insn_mulh
# Loading work.riscv_formal_monitor_rv32imc_insn_mulhsu
# Loading work.riscv_formal_monitor_rv32imc_insn_mulhu
# Loading work.riscv_formal_monitor_rv32imc_insn_or
# Loading work.riscv_formal_monitor_rv32imc_insn_ori
# Loading work.riscv_formal_monitor_rv32imc_insn_rem
# Loading work.riscv_formal_monitor_rv32imc_insn_remu
# Loading work.riscv_formal_monitor_rv32imc_insn_sb
# Loading work.riscv_formal_monitor_rv32imc_insn_sh
# Loading work.riscv_formal_monitor_rv32imc_insn_sll
# Loading work.riscv_formal_monitor_rv32imc_insn_slli
# Loading work.riscv_formal_monitor_rv32imc_insn_slt
# Loading work.riscv_formal_monitor_rv32imc_insn_slti
# Loading work.riscv_formal_monitor_rv32imc_insn_sltiu
# Loading work.riscv_formal_monitor_rv32imc_insn_sltu
# Loading work.riscv_formal_monitor_rv32imc_insn_sra
# Loading work.riscv_formal_monitor_rv32imc_insn_srai
# Loading work.riscv_formal_monitor_rv32imc_insn_srl
# Loading work.riscv_formal_monitor_rv32imc_insn_srli
# Loading work.riscv_formal_monitor_rv32imc_insn_sub
# Loading work.riscv_formal_monitor_rv32imc_insn_sw
# Loading work.riscv_formal_monitor_rv32imc_insn_xor
# Loading work.riscv_formal_monitor_rv32imc_insn_xori
# Loading work.riscv_formal_monitor_rv32imc_rob
# Loading work.shadow_memory
# Loading work.immmux
# Loading work.regfilemux
# Loading work.alumux
# Loading work.cmpmux
# Loading work.marmux
# Loading work.pcmux
# Loading work.rv32i_types
# Loading work.mp4_sv_unit
# Loading work.mp4
# Loading work.datapath_sv_unit
# Loading work.datapath
# Loading work.pc_register
# Loading work.ir_sv_unit
# Loading work.ir
# Loading work.register
# Loading work.regfile
# Loading work.ctrl_reg_sv_unit
# Loading work.ctrl_reg
# Loading work.alu_sv_unit
# Loading work.alu
# Loading work.cmp_sv_unit
# Loading work.cmp
# Loading work.control_rom_sv_unit
# Loading work.control_rom
# Loading work.cache_top_sv_unit
# Loading work.cache_top
# Loading work.cache_sv_unit
# Loading work.cache
# Loading work.cache_control
# Loading work.cache_datapath_sv_unit
# Loading work.cache_datapath
# Loading work.data_array
# Loading work.bus_adapter
# Loading work.arbiter_sv_unit
# Loading work.arbiter
# Loading work.cacheline_adaptor
# Loading work.ParamMemory
# ** Warning: (vsim-3015) /job/student/hvl/source_tb.sv(228): [PCDPC] - Port size (5) does not match connection size (32) for port 'rvfi_rd_addr'. The port definition is at: /job/student/hvl/rvfimon.v(21).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb/tb/monitor File: /job/student/hvl/rvfimon.v
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(99): Variable '/mp4_tb/itf/data_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(98): Variable '/mp4_tb/itf/data_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(91): Variable '/mp4_tb/itf/inst_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(90): Variable '/mp4_tb/itf/inst_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
VSIM 29> 
> 
add wave *
VSIM 30> view structure
VSIM 31> # 
# <EOF>
# 0: RVMODEL NULL (Expected)
# End time: 06:36:25 on Nov 28,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 5

```

</details>


### Targeted Tests: 
<ul>
<li> <b>cp1_cache</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img></li>
<li> <b>cp2</b> <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png" alt="success" ></img></li>
<li> <b>cp3</b> <img alt="failure" width="13" height="13" src="https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png" ></img></li>
</ul>

---
Staff use: 5fc1e9b9992def9c51c72711

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 