include <Commons.scad>
include <electronic-board-mockups/Commons.scad>
include <electronic-board-mockups/Breadboards.scad>
include <electronic-board-mockups/ESP.scad>

translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
   union() {
      Two_Mini_Breadboards_Module();

//      translate([(slot_depth - mini_breadboard_width)/2, (slot_width - 2*mini_breadboard_depth - breadboard_distance)/2, plate_thickness])
//      union() {
//         translate([0, mini_breadboard_depth, 0]) rotate([0, 0, 270])
//            Breadboard(MINI);
//
//         translate([51.03, 29.92, breadboard_height + pitch + 2*delta]) rotate([0, 0, 90])
//            ESP32_Dev_Kit();
//
//         translate([0, 2*mini_breadboard_depth + breadboard_distance, 0]) rotate([0, 0, 270])
//            Breadboard(MINI);
//      }
   }


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