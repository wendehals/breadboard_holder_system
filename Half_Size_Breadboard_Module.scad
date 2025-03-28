include <Commons.scad>
include <electronic-board-mockups/Breadboards.scad>

translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
   union() {
      Half_Size_Breadboard_Module();

//      translate([breadboard_depth + 4.5, half_size_breadboard_width + 11.5, plate_thickness]) rotate([0, 0, 180])
//         Breadboard(HALF_SIZE);
   }


module Half_Size_Breadboard_Module() {
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
