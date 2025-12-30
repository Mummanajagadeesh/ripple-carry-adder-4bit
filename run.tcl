read_verilog ripple_adder_with_lib.v

read_lef /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lef/sky130_fd_sc_hs.tlef
read_lef /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lef/sky130_fd_sc_hs_merged.lef

read_liberty /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lib/sky130_fd_sc_hs__tt_025C_1v80.lib

link_design ripple_carry_adder_4bit

initialize_floorplan \
  -die_area  {0 0 20 20} \
  -core_area {1 1 19 19} \
  -sites "unit"

save_image -resolution 0.05 floorplan.png

source /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/make_tracks.tcl

place_pins -hor_layers 6 -ver_layers 8
save_image -resolution 0.05 io_pins.png

global_placement -density 0.9
save_image -resolution 0.05 global_placement.png

detailed_placement
save_image -resolution 0.05 detailed_placement.png

detailed_route
save_image -resolution 0.05 routing.png

write_def adder.def

# exit
