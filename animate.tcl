gui::show

# read design + libs
read_verilog ripple_adder_with_lib.v

read_lef /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lef/sky130_fd_sc_hs.tlef
read_lef /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lef/sky130_fd_sc_hs_merged.lef

read_liberty /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/lib/sky130_fd_sc_hs__tt_025C_1v80.lib

link_design ripple_carry_adder_4bit

# floorplan
initialize_floorplan -die_area {0 0 20 20} -core_area {1 1 19 19} -sites "unit"
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_00_floorplan.png

# tracks
source /home/jagadeesh97/OpenROAD-flow-scripts/flow/platforms/sky130hs/make_tracks.tcl
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_01_tracks.png

# io pins
place_pins -hor_layers 6 -ver_layers 8
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_02_iopins.png

# placement (multiple snapshots for animation)
global_placement -density 0.85
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_03_gp.png

global_placement -incremental
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_04_gp.png

global_placement -incremental
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_05_gp.png

# detailed placement
detailed_placement
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_06_dp.png

improve_placement
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_07_dp.png

# routing (attempt; do not abort script on error)
catch { global_route -allow_congestion }
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_08_gr.png

catch { detailed_route }
gui::pause 200
save_image -area {0 0 20 20} -resolution 0.05 -display_option {* true} frame_09_dr.png

write_def adder.def

# exit
