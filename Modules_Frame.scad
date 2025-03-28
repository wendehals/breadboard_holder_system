include <Commons.scad>
include <electronic-board-mockups/Breadboards.scad>

color("lime")
   Modules_Frame();

//translate([depth - wall_thickness - 1 - delta - breadboard_depth, wall_thickness + 1 + delta, 2*plate_thickness])
//   Breadboard();


module Modules_Frame() {
   difference() {
      union() {
         cube([depth, width, plate_thickness]);

         color("blue") translate([depth - (wall_thickness + 1 + 2*delta + breadboard_depth), wall_thickness + 1, plate_thickness])
            cube([breadboard_depth + 2*delta, breadboard_width + 2*delta, plate_thickness]);
      }

      // left slot magnets
      magnet_hole(wall_thickness + delta + 5, wall_thickness + 10, plate_thickness - magnet_height);
      magnet_hole(wall_thickness + delta + slot_depth - 5, wall_thickness + 10, plate_thickness - magnet_height);
      magnet_hole(wall_thickness + delta + 5, wall_thickness + slot_width - 10, plate_thickness - magnet_height);
      magnet_hole(wall_thickness + delta + slot_depth - 5, wall_thickness + slot_width - 10, plate_thickness - magnet_height);

      // left slot plate hole
      translate([wall_thickness + delta + 5, wall_thickness + 15, -delta])
         cube([slot_depth - 10, slot_width - 30, plate_thickness + 2*delta]);
      translate([wall_thickness + delta + 10, wall_thickness + 7, -delta])
         cube([slot_depth - 20, slot_width - 14, plate_thickness + 2*delta]);

      // right slot magnets
      magnet_hole(wall_thickness + delta + 5, width - wall_thickness - slot_width + 10, plate_thickness - magnet_height);
      magnet_hole(wall_thickness + delta + slot_depth - 5, width - wall_thickness - slot_width + 10, plate_thickness - magnet_height);
      magnet_hole(wall_thickness + delta + 5, width - wall_thickness - 10, plate_thickness - magnet_height);
      magnet_hole(wall_thickness + delta + slot_depth - 5, width - wall_thickness - 10, plate_thickness - magnet_height);

      // right slot plate hole
      translate([wall_thickness + delta + 5, width - wall_thickness - slot_width + 15, , -delta])
         cube([slot_depth - 10, slot_width - 30, plate_thickness + 2*delta]);
      translate([wall_thickness + delta + 10, width - wall_thickness - slot_width + 7, -delta])
         cube([slot_depth - 20, slot_width - 14, plate_thickness + 2*delta]);

      // small slot magnets
      magnet_hole(2*wall_thickness + 2*delta + slot_depth + 8, width - wall_thickness - delta - small_slot_width + 8, plate_thickness - magnet_height);
      magnet_hole(2*wall_thickness + 2*delta + slot_depth + 8, width - wall_thickness - delta - 8, plate_thickness - magnet_height);
      magnet_hole(depth - 8, width - wall_thickness - delta - small_slot_width + 8, plate_thickness - magnet_height);
      magnet_hole(depth - 8, width - wall_thickness - delta - 8, plate_thickness - magnet_height);

      // small slot plate hole
      translate([depth - small_slot_depth + 12, width - wall_thickness - delta - small_slot_width + 5, -delta])
         cube([small_slot_depth - 24, small_slot_width - 10, plate_thickness + 2*delta]);
      translate([depth - small_slot_depth + 5, width - wall_thickness - delta - small_slot_width + 12, -delta])
         cube([small_slot_depth - 10, small_slot_width - 24, plate_thickness + 2*delta]);

      // breadboard slot hole
      translate([depth - wall_thickness - 1 - delta - breadboard_depth + 8, wall_thickness + 1 + delta + 8, -delta])
         cube([breadboard_depth - 16, breadboard_width - 16, 2*plate_thickness +2*delta]);

      // bottom magnets
      for (i=bottom_magnet_positions) {            
         magnet_hole(i[0], i[1], -delta);
      }

      // bottom corner
      translate([0, -0.5, -0.5])
         cube([depth, 3, 1.5]);
      translate([-0.5, 0, -0.5])
         cube([3, width, 1.5]);
      translate([0, width - 2.5, -0.5])
         cube([depth, 3, 1.5]);
      translate([depth - 2.5, 0, -0.5])
         cube([3, width, 1.5]);
   }

   color("red")
      difference() {
         translate([0, width, plate_thickness]) rotate([90, 0, 0]) linear_extrude(width)
            polygon([[0, 0], [wall_thickness, 0], [wall_thickness + 1, height], [0, height]]);

         translate([-delta, 27, 2*plate_thickness + 4])
            cube([wall_thickness + 1 + 2*delta, 58, 9]);
      }

      color("red") translate([slot_depth+ wall_thickness + 2*delta, width, plate_thickness]) rotate([90, 0, 0]) linear_extrude(width)
         polygon([[0, 0], [wall_thickness, 0], [wall_thickness, height], [-1, height]]);

      color("green")
      difference() {
         translate([depth - wall_thickness - 1, 0, plate_thickness])
            cube([wall_thickness + 1, wall_thickness + 1 + breadboard_width + 2*delta, height]);

         translate([depth - wall_thickness - 1 - 2*delta - breadboard_depth, wall_thickness + 1, 2*plate_thickness])
            breadboard_hole();
      }

   color("cyan") translate([wall_thickness, (width - wall_thickness)/2, plate_thickness])
      cube([slot_depth + 2*delta, wall_thickness, height]);


   color("yellow") translate([slot_depth + 2*wall_thickness + 2*delta, 0, plate_thickness])
      cube([breadboard_depth + 2*delta, wall_thickness + 1, height]);

   color("yellow") translate([slot_depth + 2*wall_thickness + 2*delta, wall_thickness + 1 + breadboard_width + 2*delta, plate_thickness]) rotate([90, 0, 90]) linear_extrude(breadboard_depth + 2*delta + wall_thickness + 1)
      polygon([[0, 0], [wall_thickness, 0], [wall_thickness + 1, height], [0, height]]);

   color("yellow") translate([slot_depth + 2*wall_thickness + 2*delta, width - wall_thickness, plate_thickness]) rotate([90, 0, 90]) linear_extrude(breadboard_depth + 2*delta + wall_thickness + 1)
      polygon([[0, 0], [wall_thickness, 0], [wall_thickness, height], [-1, height]]);
}
