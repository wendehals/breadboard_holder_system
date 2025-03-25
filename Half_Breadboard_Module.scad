include <Commons.scad>

translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
    Half_Breadboard_Module();

module Half_Breadboard_Module() {
    difference() {
        union() {
            module_frame();

            translate([wall_thickness + 1, 0, plate_thickness])
                cube([slot_depth - 2*wall_thickness - 2, slot_width, breadboard_height]);
        }

        translate([wall_thickness + 2, (slot_width - breadboard_width/2 - 2*delta)/2, plate_thickness])
            half_breadboard_hole();
    }
}
