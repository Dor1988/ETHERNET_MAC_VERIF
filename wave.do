onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/wb_clk
add wave -noupdate /top_tb/wb_rst
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_clk_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_rst_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_dat_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_dat_o
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_err_o
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_adr_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_sel_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_we_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_cyc_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_stb_i
add wave -noupdate -group PROC_INTF /top_tb/proc_pif/wb_ack_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/wb_clk
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/wb_rst
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_adr_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_sel_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_we_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_dat_i
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_dat_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_cyc_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_stb_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_ack_i
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_err_i
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_adr_tmp
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_cti_o
add wave -noupdate -group MEM_INTF /top_tb/mem_pif/m_wb_bte_o
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mtx_clk_pad_i
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mtxd_pad_o
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mtxen_pad_o
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mtxerr_pad_o
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mrx_clk_pad_i
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mrxd_pad_i
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mrxdv_pad_i
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mrxerr_pad_i
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mcoll_pad_i
add wave -noupdate -group PHY_INTF /top_tb/phy_pif/mcrs_pad_i
add wave -noupdate -group MII_INTF /top_tb/mii_pif/md_pad_i
add wave -noupdate -group MII_INTF /top_tb/mii_pif/mdc_pad_o
add wave -noupdate -group MII_INTF /top_tb/mii_pif/md_pad_o
add wave -noupdate -group MII_INTF /top_tb/mii_pif/md_padoe_o
add wave -noupdate -group MII_INTF /top_tb/mii_pif/int_o
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {2386 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 99
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {6636 ns}