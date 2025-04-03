include <Commons.scad>
include <electronic-board-mockups/Commons.scad>
include <electronic-board-mockups/Breadboards.scad>


//Two_Mini_Breadboards_Module();

breadboard_distance = 9*pitch - (mini_breadboard_depth - 12*pitch);

module Two_Mini_Breadboards_Module() {
   difference() {
      union() {
         module_frame();

         translate([wall_thickness + 1, 0, plate_thickness])
            cube([slot_depth - 2*wall_thickness - 2, slot_width, breadboard_height]);
      }

      translate([(slot_depth - mini_breadboard_width - 2*delta)/2, (slot_width - 2*mini_breadboard_depth - breadboard_distance)/2, plate_thickness])
         union() {
            rotated_mini_breadboard_hole();

            translate([0, mini_breadboard_depth + breadboard_distance, 0])
               rotated_mini_breadboard_hole();
         }
   }
}

module rotated_mini_breadboard_hole() {
   translate([0, mini_breadboard_depth + delta]) rotate([0, 0, 270])
      mini_breadboard_hole();
}