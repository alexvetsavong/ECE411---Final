# AG Report Generated 2020-12-31 12:34
This is a report about mp4compile generated for RISC-y_Business3 at 2020-12-31 12:34. The autograder used commit ``14613847b996`` as a starting point. If you have any questions about this report, please contact the TAs on Piazza.
### Quick Results:
 - Compilation: YES
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
    Info: Processing started: Thu Dec 31 18:32:35 2020
Info: Command: quartus_map mp4 -c mp4
Warning (18236): Number of processors has not been specified which may cause overloading on shared machines.  Set the global assignment NUM_PARALLEL_PROCESSORS in your QSF to an appropriate value for best performance.
Info (20029): Only one processor detected - disabling parallel compilation
Info (12021): Found 1 design units, including 0 entities, in source file hdl/wallace/mult_types.sv
    Info (12022): Found design unit 1: mult_types (SystemVerilog) File: /job/student/hdl/wallace/mult_types.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/wallace/add_shift_multiplier_64.sv
    Info (12023): Found entity 1: add_shift_multiplier File: /job/student/hdl/wallace/add_shift_multiplier_64.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/wallace/divider.sv
    Info (12023): Found entity 1: divider File: /job/student/hdl/wallace/divider.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/given_cache/line_adapter.sv
    Info (12023): Found entity 1: given_line_adapter File: /job/student/hdl/given_cache/line_adapter.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/given_cache/data_array.sv
    Info (12023): Found entity 1: given_data_array File: /job/student/hdl/given_cache/data_array.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/given_cache/cache_datapath.sv
    Info (12023): Found entity 1: given_cache_datapath File: /job/student/hdl/given_cache/cache_datapath.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/given_cache/cache_control.sv
    Info (12023): Found entity 1: given_cache_control File: /job/student/hdl/given_cache/cache_control.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/given_cache/cache.sv
    Info (12023): Found entity 1: given_cache File: /job/student/hdl/given_cache/cache.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/given_cache/array.sv
    Info (12023): Found entity 1: given_array File: /job/student/hdl/given_cache/array.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache_wide/l2ram_array.v
    Info (12023): Found entity 1: l2ram_array File: /job/student/hdl/cache/l2_cache_wide/l2ram_array.v Line: 39
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache_wide/l2cache_wide_datapath.sv
    Info (12023): Found entity 1: l2cache_wide_datapath File: /job/student/hdl/cache/l2_cache_wide/l2cache_wide_datapath.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache_wide/l2cache_wide_control.sv
    Info (12023): Found entity 1: l2cache_wide_control File: /job/student/hdl/cache/l2_cache_wide/l2cache_wide_control.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache_wide/l2cache_wide.sv
    Info (12023): Found entity 1: l2cache_wide File: /job/student/hdl/cache/l2_cache_wide/l2cache_wide.sv Line: 3
Info (15248): File "/job/student/hdl/cache/l2_cache/l2ram_array.v" is a duplicate of already analyzed file "/job/student/hdl/cache/l2_cache_wide/l2ram_array.v" (same filename, same library name and same md5 digest). Skipping analysis of this file.
Info (12021): Found 0 design units, including 0 entities, in source file hdl/cache/l2_cache/l2ram_array.v
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache/l2cache_datapath.sv
    Info (12023): Found entity 1: l2cache_datapath File: /job/student/hdl/cache/l2_cache/l2cache_datapath.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache/l2cache_control.sv
    Info (12023): Found entity 1: l2cache_control File: /job/student/hdl/cache/l2_cache/l2cache_control.sv Line: 2
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l2_cache/l2cache.sv
    Info (12023): Found entity 1: l2cache File: /job/student/hdl/cache/l2_cache/l2cache.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l1_cache/data_array.sv
    Info (12023): Found entity 1: data_array File: /job/student/hdl/cache/l1_cache/data_array.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l1_cache/cache_datapath.sv
    Info (12023): Found entity 1: cache_datapath File: /job/student/hdl/cache/l1_cache/cache_datapath.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l1_cache/cache_control.sv
    Info (12023): Found entity 1: cache_control File: /job/student/hdl/cache/l1_cache/cache_control.sv Line: 4
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/l1_cache/cache.sv
    Info (12023): Found entity 1: cache File: /job/student/hdl/cache/l1_cache/cache.sv Line: 3
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cacheline_adaptor.sv
    Info (12023): Found entity 1: cacheline_adaptor File: /job/student/hdl/cache/cacheline_adaptor.sv Line: 1
Info (12021): Found 1 design units, including 1 entities, in source file hdl/cache/cache_top.sv
    Info (12023): Found entity 1: cache_top File: /job/student/hdl/cache/cache_top.sv Line: 3
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
    Info (12022): Found design unit 6: immmux (SystemVerilog) File: /job/student/hdl/rv32i_mux_types.sv Line: 55
Info (12021): Found 1 design units, including 0 entities, in source file hdl/rv32i_types.sv
    Info (12022): Found design unit 1: rv32i_types (SystemVerilog) File: /job/student/hdl/rv32i_types.sv Line: 3
Info (12127): Elaborating entity "mp4" for the top level hierarchy
Info (12128): Elaborating entity "datapath" for hierarchy "datapath:i_datapath" File: /job/student/hdl/mp4.sv Line: 57
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(38): object "halt" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 38
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(40): object "if_flush" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 40
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(41): object "id_flush" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 41
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(43): object "mem_flush" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 43
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(44): object "wb_flush" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 44
Warning (10036): Verilog HDL or VHDL warning at datapath.sv(128): object "memory_stall" assigned a value but never read File: /job/student/hdl/processor/datapath.sv Line: 128
Info (12128): Elaborating entity "pc_register" for hierarchy "datapath:i_datapath|pc_register:PC" File: /job/student/hdl/processor/datapath.sv Line: 142
Info (12128): Elaborating entity "ir" for hierarchy "datapath:i_datapath|ir:IR" File: /job/student/hdl/processor/datapath.sv Line: 153
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|register:if_id_pc_reg" File: /job/student/hdl/processor/datapath.sv Line: 158
Info (12128): Elaborating entity "regfile" for hierarchy "datapath:i_datapath|regfile:regfile" File: /job/student/hdl/processor/datapath.sv Line: 176
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|register:id_ex_rs1_reg" File: /job/student/hdl/processor/datapath.sv Line: 192
Info (12128): Elaborating entity "ctrl_reg" for hierarchy "datapath:i_datapath|ctrl_reg:id_ex_ctrl_reg" File: /job/student/hdl/processor/datapath.sv Line: 212
Info (12128): Elaborating entity "alu" for hierarchy "datapath:i_datapath|alu:ALU" File: /job/student/hdl/processor/datapath.sv Line: 220
Info (12128): Elaborating entity "cmp" for hierarchy "datapath:i_datapath|cmp:CMP" File: /job/student/hdl/processor/datapath.sv Line: 227
Info (12128): Elaborating entity "add_shift_multiplier" for hierarchy "datapath:i_datapath|add_shift_multiplier:multiplier" File: /job/student/hdl/processor/datapath.sv Line: 251
Warning (10036): Verilog HDL or VHDL warning at add_shift_multiplier_64.sv(24): object "update_state" assigned a value but never read File: /job/student/hdl/wallace/add_shift_multiplier_64.sv Line: 24
Info (12128): Elaborating entity "divider" for hierarchy "datapath:i_datapath|divider:divider" File: /job/student/hdl/processor/datapath.sv Line: 266
Warning (10230): Verilog HDL assignment warning at divider.sv(124): truncated value with size 32 to match size of target (6) File: /job/student/hdl/wallace/divider.sv Line: 124
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|divider:divider|register:reg_dd" File: /job/student/hdl/wallace/divider.sv Line: 38
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|divider:divider|register:reg_counter" File: /job/student/hdl/wallace/divider.sv Line: 46
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|register:ex_mem_br_reg" File: /job/student/hdl/processor/datapath.sv Line: 312
Info (12128): Elaborating entity "register" for hierarchy "datapath:i_datapath|register:mem_wb_rmask_reg" File: /job/student/hdl/processor/datapath.sv Line: 556
Info (12128): Elaborating entity "control_rom" for hierarchy "control_rom:i_control_rom" File: /job/student/hdl/mp4.sv Line: 64
Warning (10036): Verilog HDL or VHDL warning at control_rom.sv(13): object "store_funct3" assigned a value but never read File: /job/student/hdl/processor/control_rom.sv Line: 13
Warning (10036): Verilog HDL or VHDL warning at control_rom.sv(14): object "load_funct3" assigned a value but never read File: /job/student/hdl/processor/control_rom.sv Line: 14
Warning (10036): Verilog HDL or VHDL warning at control_rom.sv(15): object "branch_funct3" assigned a value but never read File: /job/student/hdl/processor/control_rom.sv Line: 15
Info (12128): Elaborating entity "cache_top" for hierarchy "cache_top:i_cache_top" File: /job/student/hdl/mp4.sv Line: 92
Warning (10036): Verilog HDL or VHDL warning at cache_top.sv(41): object "i_miss" assigned a value but never read File: /job/student/hdl/cache/cache_top.sv Line: 41
Warning (10036): Verilog HDL or VHDL warning at cache_top.sv(41): object "d_miss" assigned a value but never read File: /job/student/hdl/cache/cache_top.sv Line: 41
Warning (10036): Verilog HDL or VHDL warning at cache_top.sv(41): object "l2_miss" assigned a value but never read File: /job/student/hdl/cache/cache_top.sv Line: 41
Warning (10036): Verilog HDL or VHDL warning at cache_top.sv(41): object "l2_serve" assigned a value but never read File: /job/student/hdl/cache/cache_top.sv Line: 41
Info (12128): Elaborating entity "given_cache" for hierarchy "cache_top:i_cache_top|given_cache:d_cache" File: /job/student/hdl/cache/cache_top.sv Line: 143
Info (12128): Elaborating entity "given_cache_control" for hierarchy "cache_top:i_cache_top|given_cache:d_cache|given_cache_control:control" File: /job/student/hdl/given_cache/cache.sv Line: 35
Info (12128): Elaborating entity "given_cache_datapath" for hierarchy "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath" File: /job/student/hdl/given_cache/cache.sv Line: 36
Info (12128): Elaborating entity "given_data_array" for hierarchy "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_data_array:DM_cache" File: /job/student/hdl/given_cache/cache_datapath.sv Line: 56
Info (12128): Elaborating entity "given_array" for hierarchy "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:tag" File: /job/student/hdl/given_cache/cache_datapath.sv Line: 57
Info (12128): Elaborating entity "given_array" for hierarchy "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:valid" File: /job/student/hdl/given_cache/cache_datapath.sv Line: 58
Info (12128): Elaborating entity "given_line_adapter" for hierarchy "cache_top:i_cache_top|given_cache:d_cache|given_line_adapter:bus" File: /job/student/hdl/given_cache/cache.sv Line: 46
Info (12128): Elaborating entity "l2cache_wide" for hierarchy "cache_top:i_cache_top|l2cache_wide:_l2cache" File: /job/student/hdl/cache/cache_top.sv Line: 194
Info (12128): Elaborating entity "l2cache_wide_control" for hierarchy "cache_top:i_cache_top|l2cache_wide:_l2cache|l2cache_wide_control:control" File: /job/student/hdl/cache/l2_cache_wide/l2cache_wide.sv Line: 74
Info (12128): Elaborating entity "l2cache_wide_datapath" for hierarchy "cache_top:i_cache_top|l2cache_wide:_l2cache|l2cache_wide_datapath:datapath" File: /job/student/hdl/cache/l2_cache_wide/l2cache_wide.sv Line: 99
Info (12128): Elaborating entity "l2ram_array" for hierarchy "cache_top:i_cache_top|l2cache_wide:_l2cache|l2cache_wide_datapath:datapath|l2ram_array:data_array1" File: /job/student/hdl/cache/l2_cache_wide/l2cache_wide_datapath.sv Line: 48
Info (12128): Elaborating entity "altsyncram" for hierarchy "cache_top:i_cache_top|l2cache_wide:_l2cache|l2cache_wide_datapath:datapath|l2ram_array:data_array1|altsyncram:altsyncram_component" File: /job/student/hdl/cache/l2_cache_wide/l2ram_array.v Line: 93
Info (12130): Elaborated megafunction instantiation "cache_top:i_cache_top|l2cache_wide:_l2cache|l2cache_wide_datapath:datapath|l2ram_array:data_array1|altsyncram:altsyncram_component" File: /job/student/hdl/cache/l2_cache_wide/l2ram_array.v Line: 93
Info (12133): Instantiated megafunction "cache_top:i_cache_top|l2cache_wide:_l2cache|l2cache_wide_datapath:datapath|l2ram_array:data_array1|altsyncram:altsyncram_component" with the following parameter: File: /job/student/hdl/cache/l2_cache_wide/l2ram_array.v Line: 93
    Info (12134): Parameter "address_aclr_b" = "NONE"
    Info (12134): Parameter "address_reg_b" = "CLOCK1"
    Info (12134): Parameter "clock_enable_input_a" = "BYPASS"
    Info (12134): Parameter "clock_enable_input_b" = "BYPASS"
    Info (12134): Parameter "clock_enable_output_b" = "BYPASS"
    Info (12134): Parameter "intended_device_family" = "Arria II GX"
    Info (12134): Parameter "lpm_type" = "altsyncram"
    Info (12134): Parameter "numwords_a" = "32"
    Info (12134): Parameter "numwords_b" = "32"
    Info (12134): Parameter "operation_mode" = "DUAL_PORT"
    Info (12134): Parameter "outdata_aclr_b" = "NONE"
    Info (12134): Parameter "outdata_reg_b" = "UNREGISTERED"
    Info (12134): Parameter "power_up_uninitialized" = "TRUE"
    Info (12134): Parameter "rdcontrol_reg_b" = "CLOCK1"
    Info (12134): Parameter "widthad_a" = "5"
    Info (12134): Parameter "widthad_b" = "5"
    Info (12134): Parameter "width_a" = "256"
    Info (12134): Parameter "width_b" = "256"
    Info (12134): Parameter "width_byteena_a" = "1"
Info (12021): Found 1 design units, including 1 entities, in source file db/altsyncram_ldt1.tdf
    Info (12023): Found entity 1: altsyncram_ldt1 File: /job/student/db/altsyncram_ldt1.tdf Line: 27
Info (12128): Elaborating entity "altsyncram_ldt1" for hierarchy "cache_top:i_cache_top|l2cache_wide:_l2cache|l2cache_wide_datapath:datapath|l2ram_array:data_array1|altsyncram:altsyncram_component|altsyncram_ldt1:auto_generated" File: /opt/altera/quartus/libraries/megafunctions/altsyncram.tdf Line: 791
Info (12128): Elaborating entity "arbiter" for hierarchy "cache_top:i_cache_top|l2cache_wide:_l2cache|arbiter:arbiter" File: /job/student/hdl/cache/l2_cache_wide/l2cache_wide.sv Line: 128
Info (12128): Elaborating entity "cacheline_adaptor" for hierarchy "cache_top:i_cache_top|cacheline_adaptor:_cacheline_adaptor" File: /job/student/hdl/cache/cache_top.sv Line: 248
Warning (276020): Inferred RAM node "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:tag|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Warning (276020): Inferred RAM node "cache_top:i_cache_top|given_cache:i_cache|given_cache_datapath:datapath|given_array:tag|data_rtl_0" from synchronous design logic.  Pass-through logic has been added to match the read-during-write behavior of the original design.
Info (276014): Found 4 instances of uninferred RAM logic
    Info (276004): RAM logic "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:dirty|data" is uninferred due to inappropriate RAM size File: /job/student/hdl/given_cache/array.sv Line: 12
    Info (276004): RAM logic "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:valid|data" is uninferred due to inappropriate RAM size File: /job/student/hdl/given_cache/array.sv Line: 12
    Info (276004): RAM logic "cache_top:i_cache_top|given_cache:i_cache|given_cache_datapath:datapath|given_array:dirty|data" is uninferred due to inappropriate RAM size File: /job/student/hdl/given_cache/array.sv Line: 12
    Info (276004): RAM logic "cache_top:i_cache_top|given_cache:i_cache|given_cache_datapath:datapath|given_array:valid|data" is uninferred due to inappropriate RAM size File: /job/student/hdl/given_cache/array.sv Line: 12
Info (19000): Inferred 2 megafunctions from design logic
    Info (276029): Inferred altsyncram megafunction from the following design logic: "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:tag|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter INIT_FILE set to db/mp4.ram0_given_array_cc1cd377.hdl.mif
    Info (276029): Inferred altsyncram megafunction from the following design logic: "cache_top:i_cache_top|given_cache:i_cache|given_cache_datapath:datapath|given_array:tag|data_rtl_0" 
        Info (286033): Parameter OPERATION_MODE set to DUAL_PORT
        Info (286033): Parameter WIDTH_A set to 23
        Info (286033): Parameter WIDTHAD_A set to 4
        Info (286033): Parameter NUMWORDS_A set to 16
        Info (286033): Parameter WIDTH_B set to 23
        Info (286033): Parameter WIDTHAD_B set to 4
        Info (286033): Parameter NUMWORDS_B set to 16
        Info (286033): Parameter ADDRESS_ACLR_A set to NONE
        Info (286033): Parameter OUTDATA_REG_B set to UNREGISTERED
        Info (286033): Parameter ADDRESS_ACLR_B set to NONE
        Info (286033): Parameter OUTDATA_ACLR_B set to NONE
        Info (286033): Parameter ADDRESS_REG_B set to CLOCK0
        Info (286033): Parameter INDATA_ACLR_A set to NONE
        Info (286033): Parameter WRCONTROL_ACLR_A set to NONE
        Info (286033): Parameter INIT_FILE set to db/mp4.ram0_given_array_cc1cd377.hdl.mif
Info (12130): Elaborated megafunction instantiation "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:tag|altsyncram:data_rtl_0"
Info (12133): Instantiated megafunction "cache_top:i_cache_top|given_cache:d_cache|given_cache_datapath:datapath|given_array:tag|altsyncram:data_rtl_0" with the following parameter:
    Info (12134): Parameter "OPERATION_MODE" = "DUAL_PORT"
    Info (12134): Parameter "WIDTH_A" = "23"
    Info (12134): Parameter "WIDTHAD_A" = "4"
    Info (12134): Parameter "NUMWORDS_A" = "16"
    Info (12134): Parameter "WIDTH_B" = "23"
    Info (12134): Parameter "WIDTHAD_B" = "4"
    Info (12134): Parameter "NUMWORDS_B" = "16"
    Info (12134): Parameter "ADDRESS_ACLR_A" = "NONE"
    Info (12134): Parameter "OUTDATA_REG_B" = "UNREGISTERED"
    Info (12134): Parameter "ADDRESS_ACLR_B" = "NONE"
    Info (12134): Parameter "OUTDATA_ACLR_B" = "NONE"
    Info (12134): Parameter "ADDRESS_REG_B" = "CLOCK0"
    Info (12134): Parameter "INDATA_ACLR_A" = "NONE"
    Info (12134): Parameter "WRCONTROL_ACLR_A" = "NONE"
    Info (12134): Parameter "INIT_FILE" = "db/mp4.ram0_given_array_cc1cd377.hdl.mif"
Info (12021): Found 1 design units, including 1 entities, in source file db/altsyncram_1bn1.tdf
    Info (12023): Found entity 1: altsyncram_1bn1 File: /job/student/db/altsyncram_1bn1.tdf Line: 27
Warning (13024): Output pins are stuck at VCC or GND
    Warning (13410): Pin "pmem_address[0]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[1]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[2]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[3]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
    Warning (13410): Pin "pmem_address[4]" is stuck at GND File: /job/student/hdl/mp4.sv Line: 7
Info (286030): Timing-Driven Synthesis is running
Info (17049): 128 registers lost all their fanouts during netlist optimizations.
Info (144001): Generated suppressed messages file /job/student/output_files/mp4.map.smsg
Info (16010): Generating hard_block partition "hard_block:auto_generated_inst"
    Info (16011): Adding 0 node(s), including 0 DDIO, 0 PLL, 0 transceiver and 0 LCELL
Info (21057): Implemented 22699 device resources after synthesis - the final resource count might be different
    Info (21058): Implemented 67 input pins
    Info (21059): Implemented 98 output pins
    Info (21061): Implemented 21464 logic cells
    Info (21064): Implemented 1070 RAM segments
Info: Quartus Prime Analysis & Synthesis was successful. 0 errors, 24 warnings
    Info: Peak virtual memory: 1310 megabytes
    Info: Processing ended: Thu Dec 31 18:34:03 2020
    Info: Elapsed time: 00:01:28
    Info: Total CPU time (on all processors): 00:01:25
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
    Info: Processing started: Thu Dec 31 18:34:04 2020
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
    Info: Peak virtual memory: 813 megabytes
    Info: Processing ended: Thu Dec 31 18:34:04 2020
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
vlog -vlog01compat -work work +incdir+/job/student/hdl/cache/l2_cache_wide {/job/student/hdl/cache/l2_cache_wide/l2ram_array.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:05 on Dec 31,2020
# vlog -vlog01compat -work work "+incdir+/job/student/hdl/cache/l2_cache_wide" /job/student/hdl/cache/l2_cache_wide/l2ram_array.v 
# -- Compiling module l2ram_array
# 
# Top level modules:
# 	l2ram_array
# End time: 18:34:05 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/wallace {/job/student/hdl/wallace/mult_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:05 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/wallace" /job/student/hdl/wallace/mult_types.sv 
# -- Compiling package mult_types
# 
# Top level modules:
# 	--none--
# End time: 18:34:05 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/wallace {/job/student/hdl/wallace/divider.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:05 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/wallace" /job/student/hdl/wallace/divider.sv 
# -- Compiling module divider
# 
# Top level modules:
# 	divider
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/given_cache {/job/student/hdl/given_cache/line_adapter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/given_cache" /job/student/hdl/given_cache/line_adapter.sv 
# -- Compiling module given_line_adapter
# 
# Top level modules:
# 	given_line_adapter
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/given_cache {/job/student/hdl/given_cache/data_array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/given_cache" /job/student/hdl/given_cache/data_array.sv 
# -- Compiling module given_data_array
# 
# Top level modules:
# 	given_data_array
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/given_cache {/job/student/hdl/given_cache/cache_datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/given_cache" /job/student/hdl/given_cache/cache_datapath.sv 
# -- Compiling module given_cache_datapath
# 
# Top level modules:
# 	given_cache_datapath
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/given_cache {/job/student/hdl/given_cache/cache_control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/given_cache" /job/student/hdl/given_cache/cache_control.sv 
# -- Compiling module given_cache_control
# 
# Top level modules:
# 	given_cache_control
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/given_cache {/job/student/hdl/given_cache/array.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/given_cache" /job/student/hdl/given_cache/array.sv 
# -- Compiling module given_array
# 
# Top level modules:
# 	given_array
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache/l2_cache_wide {/job/student/hdl/cache/l2_cache_wide/l2cache_wide_control.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache/l2_cache_wide" /job/student/hdl/cache/l2_cache_wide/l2cache_wide_control.sv 
# -- Compiling module l2cache_wide_control
# 
# Top level modules:
# 	l2cache_wide_control
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cacheline_adaptor.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache" /job/student/hdl/cache/cacheline_adaptor.sv 
# -- Compiling module cacheline_adaptor
# 
# Top level modules:
# 	cacheline_adaptor
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/regfile.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/regfile.sv 
# -- Compiling module regfile
# 
# Top level modules:
# 	regfile
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/register.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/register.sv 
# -- Compiling module register
# 
# Top level modules:
# 	register
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/pc_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl" /job/student/hdl/pc_reg.sv 
# -- Compiling module pc_register
# 
# Top level modules:
# 	pc_register
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_mux_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/wallace {/job/student/hdl/wallace/add_shift_multiplier_64.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/wallace" /job/student/hdl/wallace/add_shift_multiplier_64.sv 
# -- Compiling package add_shift_multiplier_64_sv_unit
# -- Importing package mult_types
# -- Compiling module add_shift_multiplier
# 
# Top level modules:
# 	add_shift_multiplier
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/given_cache {/job/student/hdl/given_cache/cache.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/given_cache" /job/student/hdl/given_cache/cache.sv 
# -- Compiling module given_cache
# 
# Top level modules:
# 	given_cache
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/rv32i_types.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache/l2_cache_wide {/job/student/hdl/cache/l2_cache_wide/l2cache_wide_datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache/l2_cache_wide" /job/student/hdl/cache/l2_cache_wide/l2cache_wide_datapath.sv 
# -- Compiling package l2cache_wide_datapath_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module l2cache_wide_datapath
# 
# Top level modules:
# 	l2cache_wide_datapath
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache/l2_cache_wide {/job/student/hdl/cache/l2_cache_wide/l2cache_wide.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hdl/cache/l2_cache_wide" /job/student/hdl/cache/l2_cache_wide/l2cache_wide.sv 
# -- Compiling package l2cache_wide_sv_unit
# -- Importing package rv32i_types
# -- Importing package pcmux
# -- Importing package marmux
# -- Importing package cmpmux
# -- Importing package alumux
# -- Importing package regfilemux
# -- Importing package immmux
# -- Compiling module l2cache_wide
# 
# Top level modules:
# 	l2cache_wide
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/cache_top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/cache {/job/student/hdl/cache/arbiter.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/ctrl_reg.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/cmp.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/processor {/job/student/hdl/processor/datapath.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# 
# Top level modules:
# 	datapath
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl/processor {/job/student/hdl/processor/control_rom.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/mp4.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/alu.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hdl {/job/student/hdl/ir.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:06 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vlog -vlog01compat -work work +incdir+/job/student/hvl {/job/student/hvl/rvfimon.v}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:06 on Dec 31,2020
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
# End time: 18:34:07 on Dec 31,2020, Elapsed time: 0:00:01
# Errors: 0, Warnings: 0
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/source_tb.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:07 on Dec 31,2020
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
# End time: 18:34:07 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 1
ModelSim> vlog -sv -work work +incdir+/job/student/hvl {/job/student/hvl/top.sv}
# Model Technology ModelSim - Intel FPGA Edition vlog 10.5b Compiler 2016.10 Oct  5 2016
# Start time: 18:34:07 on Dec 31,2020
# vlog -sv -work work "+incdir+/job/student/hvl" /job/student/hvl/top.sv 
# -- Compiling module mp4_tb
# 
# Top level modules:
# 	mp4_tb
# End time: 18:34:07 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 0
ModelSim> 
> 
vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs="+acc"  mp4_tb
# vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L arriaii_hssi_ver -L arriaii_pcie_hip_ver -L arriaii_ver -L rtl_work -L work -voptargs=""+acc"" mp4_tb 
# Start time: 18:34:07 on Dec 31,2020
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
# Loading work.mult_types
# Loading work.add_shift_multiplier_64_sv_unit
# Loading work.add_shift_multiplier
# Loading work.divider
# Loading work.control_rom_sv_unit
# Loading work.control_rom
# Loading work.cache_top_sv_unit
# Loading work.cache_top
# Loading work.cacheline_adaptor
# Loading work.given_cache
# Loading work.given_cache_control
# Loading work.given_cache_datapath
# Loading work.given_data_array
# Loading work.given_array
# Loading work.given_line_adapter
# Loading work.l2cache_wide_sv_unit
# Loading work.l2cache_wide
# Loading work.l2cache_wide_control
# Loading work.l2cache_wide_datapath_sv_unit
# Loading work.l2cache_wide_datapath
# Loading work.l2ram_array
# Loading altera_mf_ver.altsyncram
# Loading work.arbiter_sv_unit
# Loading work.arbiter
# Loading altera_mf_ver.altsyncram_body
# Loading altera_mf_ver.ALTERA_DEVICE_FAMILIES
# Loading altera_mf_ver.ALTERA_MF_MEMORY_INITIALIZATION
# Loading work.ParamMemory
# ** Warning: (vsim-3015) /job/student/hvl/source_tb.sv(228): [PCDPC] - Port size (5) does not match connection size (32) for port 'rvfi_rd_addr'. The port definition is at: /job/student/hvl/rvfimon.v(21).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb/tb/monitor File: /job/student/hvl/rvfimon.v
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(95): Variable '/mp4_tb/itf/data_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(94): Variable '/mp4_tb/itf/data_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(87): Variable '/mp4_tb/itf/inst_rdata' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
# ** Warning: (vsim-3838) /job/student/hvl/top.sv(86): Variable '/mp4_tb/itf/inst_resp' written by continuous and procedural assignments. 
# One of the assignments is implicit. See hvl/tb_itf.sv(76).
#    Time: 0 ps  Iteration: 0  Instance: /mp4_tb File: /job/student/hvl/top.sv
VSIM 37> 
> 
add wave *
VSIM 38> view structure
VSIM 39> # 
# <EOF>
# 0: RVMODEL NULL (Expected)
# End time: 18:34:07 on Dec 31,2020, Elapsed time: 0:00:00
# Errors: 0, Warnings: 5

```

</details>


### Targeted Tests: 
<ul>
</ul>

---
Staff use: 5fee13f9992def9c51c73ba3

[success]: https://upload.wikimedia.org/wikipedia/commons/thumb/0/03/Green_check.svg/13px-Green_check.svg.png 
[failure]: https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Red_x.svg/13px-Red_x.svg.png 