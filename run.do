#compile
vlog \
+incdir+../../rtl/verilog \
+incdir+../top \
+incdir+../wb \
+incdir+../memory \
+incdir+../mii \
+incdir+../phy \
+incdir+../sbd \
../top/top_tb.sv
#elab
vsim -novopt -suppress 12110 top_tb
#add wave
do wave.do
#simulate
run -all