import cairosvg

# Add white background
cairosvg.svg2png(
    url="ripple_adder_schematic.svg",
    write_to="ripple_adder_schematic.png",
    background_color="white"
)

cairosvg.svg2png(
    url="ripple_carry_wo_lib.svg",
    write_to="ripple_carry_wo_lib.png",
    background_color="white"
)
