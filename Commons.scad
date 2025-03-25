arduino_depth = 53.5;
arduino_width = 69;
arduino_mega_width = 102;

raspberry_depth = 56;
raspberry_width = 85;

breadboard_width = 166;
breadboard_depth = 55;
breadboard_height = 10;

mini_breadboard_depth = 34;
mini_breadboard_width = 46;

magnet_height = 1.2;
magnet_diameter = 4;

delta = 0.5;

plate_thickness = 2;
wall_thickness = 2;

slot_width = arduino_mega_width + 2*wall_thickness; // 106
slot_depth = raspberry_depth + 2*wall_thickness + 2 + 2*delta; // 63

width = 2*slot_width + wall_thickness; // 214
depth = slot_depth + breadboard_depth + 3*wall_thickness + 1 + 4*delta; // 125
height = breadboard_height + plate_thickness; // height over plate, 12

small_slot_depth = depth - slot_depth - 2*wall_thickness - 2*delta; // 58
small_slot_width = width - breadboard_width - 3*wall_thickness - 1 - 4*delta; // 39


module module_frame() {
    difference() {
        union() {
            translate([wall_thickness + 1, 0, 0])
                cube([slot_depth - 2*wall_thickness - 2, slot_width, plate_thickness]);

            translate([0, slot_width, 0]) rotate([90, 0, 0]) linear_extrude(slot_width)
                polygon([[0, 0], [1, height], [3, height], [3, 0]]);

            translate([slot_depth - wall_thickness - 1, slot_width, 0]) rotate([90, 0, 0]) linear_extrude(slot_width)
                polygon([[0, 0], [0, height], [wall_thickness, height], [3, 0]]);
        }
        
        magnet_hole(5, wall_thickness + 10, -delta);
        magnet_hole(slot_depth - 5, wall_thickness + 10, -delta);
        magnet_hole(5, wall_thickness + slot_width - 10, -delta);
        magnet_hole(slot_depth - 5, wall_thickness + slot_width - 10, -delta);       
    }

    translate([wall_thickness + 1, slot_width - 1, plate_thickness])
        cube([slot_depth - 2*wall_thickness - 2, 1, height - plate_thickness]);
}

module small_module_frame() {
    difference() {
        union() {
            translate([0, wall_thickness + 1, 0])
                cube([small_slot_depth, small_slot_width - 2*wall_thickness - 2, plate_thickness]);

            rotate([90, 0, 90]) linear_extrude(small_slot_depth)
                polygon([[0, 0], [1, height], [wall_thickness + 1, height], [wall_thickness + 1, 0]]);

            translate([0, small_slot_width - wall_thickness - 1, 0]) rotate([90, 0, 90]) linear_extrude(small_slot_depth)
                polygon([[0, 0], [0, height], [wall_thickness, height], [wall_thickness + 1, 0]]);

            translate([0, wall_thickness + 1, 0])
                cube([1, small_slot_width - 2*wall_thickness - 2, height]);
        }
        
        magnet_hole(8, 8, -delta);
        magnet_hole(8, small_slot_width - 8, -delta);
        magnet_hole(small_slot_depth - 8, 8, -delta);
        magnet_hole(small_slot_depth - 8, small_slot_width - 8, -delta);
    }
}

module breadboard_hole() {
    cube([breadboard_depth + 2*delta, breadboard_width + 2*delta, breadboard_height + delta]);
    
    translate([breadboard_depth - delta, 11 + delta, 0])
        cube([2.5, 6, breadboard_height + delta]);
    translate([breadboard_depth - delta, breadboard_width/2 - 3 + delta, 0])
        cube([2.5, 6, breadboard_height + delta]);
    translate([breadboard_depth - delta, breadboard_width - 17 - delta, 0])
        cube([2.5, 6, breadboard_height + delta]);
}

module half_breadboard_hole() {
    cube([breadboard_depth + 2*delta, breadboard_width/2 + 2*delta, breadboard_height + delta]);
    
    translate([-2, 11 + delta, 0])
        cube([2.5, 6, breadboard_height + delta]);
    translate([-2, breadboard_width/2 - 17 - delta, 0])
        cube([2.5, 6, breadboard_height + delta]);
    translate([2 + delta, -2, 0])
        cube([6, 2.5, breadboard_height + delta]);
    translate([breadboard_depth/2 - 3 + delta, -2, 0])
        cube([6, 2.5, breadboard_height + delta]);
    translate([breadboard_depth - 8 - delta, -2, 0])
        cube([6, 2.5, breadboard_height + delta]);
}

module mini_breadboard_hole() {
    cube([mini_breadboard_depth + 2*delta, mini_breadboard_width + 2*delta, breadboard_height + delta]);
    
    translate([-2, mini_breadboard_width/2 - 3 + delta, 0])
        cube([2.5, 6, breadboard_height + delta]);
    translate([mini_breadboard_depth/2 - 3 + delta, mini_breadboard_width + 2*delta - 0.5, 0])
        cube([6, 2.5, breadboard_height + delta]);
}

module magnet_hole(x, y, z) {
    translate([x, y, z])
        cylinder(h = magnet_height + delta, d = magnet_diameter + delta, $fn=32);
}

module screw_mount(x = 0, y = 0, z = 0, h = 5) {
    holeRadius = 3 / 2;

    translate([x, y, z])
        difference() {
            cylinder(h, r1 = holeRadius + 2, r2 = holeRadius + 1);
            
            translate([0, 0, -0.5])
                cylinder(h + 1, r = holeRadius);
        }
}
