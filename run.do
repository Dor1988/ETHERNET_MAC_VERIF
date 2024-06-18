vlog \
+incdir+../../rtl/verilog \
+incdir+../top \
+incdir+../wb \
+incdir+../memory \
+incdir+../mii \
+incdir+../phy \
+incdir+../sbd \
+incdir+/home/tools/mentor/MENTOR_INSTALL/questa2022_2/questasim/verilog_src/uvm-1.2/src \
../top/top_tb.sv
vsim top_tb -novopt -suppress 12110 \
-sv_lib /home/tools/mentor/MENTOR_INSTALL/questa2022_2/questasim/uvm-1.2/linux_x86_64/uvm_dpi
do wave.do
run -all
