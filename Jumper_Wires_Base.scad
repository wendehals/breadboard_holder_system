include <Commons.scad>

color("cyan") translate([0, 0, -base_height + 1])
   Jumper_Wires_Base();


base_height = 20;
inner_height = base_height - plate_thickness - 1;

module Jumper_Wires_Base() {
   cube([depth, width, plate_thickness]);

   cube([depth, wall_thickness, base_height]);

   cube([wall_thickness, width, base_height]);

   translate([0, width - wall_thickness, 0])
      cube([depth, wall_thickness, base_height]);

   translate([depth - wall_thickness, 0, 0])
      cube([wall_thickness, width, base_height]);

   for (i = bottom_magnet_positions) {
      difference() {
         translate([i[0] - 4, i[1] - 4, plate_thickness])
            cube([8, 8, inner_height]);

         magnet_hole(i[0], i[1], inner_height + plate_thickness - magnet_height);
      }
   }

   translate([0.75, width - (width - 160)/2, plate_thickness])
      wire_holder(16);

   translate([0.75, width - (width - 160)/2 - 60, plate_thickness])
      wire_holder(16);

   translate([0.75, width - (width - 160)/2 - 100, plate_thickness])
      wire_holder(16);

   translate([0.75, (width - 160)/2, plate_thickness])
      wire_holder(16);

   translate([depth/2 + 2, 10, plate_thickness])
      cube([wall_thickness, width - 20, inner_height]);

   translate([depth/2 + 4, (width - wall_thickness)/2, plate_thickness])
      cube([depth/2 - 14, wall_thickness, inner_height]);
}

module wire_holder(n) {
   for(i = [0 : 4 : n*4]) {
      translate([i, 0, 0]) rotate([90, 0, 90]) linear_extrude(2)
         polygon([[-2.5, 0], [-1, inner_height], [1, inner_height], [2.5, 0]]);
   }

   for(i = [0 : 4 : n*4 - 4]) {
      translate([i + 2, 0, inner_height - 1]) rotate([90, 0, 0])
         cylinder(h = 2, r = 1, center = true, $fn=32);
   }
}