include <Commons.scad>
include <electronic-board-mockups/Breadboards.scad>


//Half_Size_Breadboard_Module();

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
