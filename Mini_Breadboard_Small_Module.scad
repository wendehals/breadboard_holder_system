include <Commons.scad>

translate([depth - small_slot_depth, width - wall_thickness - delta - small_slot_width, plate_thickness])
    Mini_Breadboard_Small_Module();

module Mini_Breadboard_Small_Module() {
    difference() {
        union() {
            small_module_frame();

            translate([1, wall_thickness + 1, plate_thickness])
                cube([small_slot_depth - 1, small_slot_width - 2*wall_thickness - 2, height - plate_thickness]);
        }

        translate([(small_slot_depth - mini_breadboard_width - 2*delta)/2, (small_slot_width - mini_breadboard_depth - 2*delta)/2 + mini_breadboard_depth + 2*delta, plate_thickness]) rotate([0, 0, 270])
            mini_breadboard_hole();
    }
}