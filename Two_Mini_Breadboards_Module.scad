include <Commons.scad>

translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
    Two_Mini_Breadboards_Module();


module Two_Mini_Breadboards_Module() {
    difference() {
        union() {
            module_frame();

            translate([wall_thickness + 1, 0, plate_thickness])
                cube([slot_depth - 2*wall_thickness - 2, slot_width, breadboard_height]);
        }

        translate([(slot_depth - mini_breadboard_width - 2*delta)/2, (slot_width - 87 - 2*delta)/2, plate_thickness])
            rotated_mini_breadboard_hole();
        translate([(slot_depth - mini_breadboard_width - 2*delta)/2, (slot_width - 87 - 2*delta)/2 + 53, plate_thickness])
            rotated_mini_breadboard_hole();
    }
}

module rotated_mini_breadboard_hole() {
    translate([0, mini_breadboard_depth + delta]) rotate([0, 0, 270])
        mini_breadboard_hole();
}