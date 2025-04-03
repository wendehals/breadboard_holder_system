include <Commons.scad>
include <electronic-board-mockups/Raspberry_Pi.scad>


//Raspberry_Pi_ModelB_Module();

module Raspberry_Pi_ModelB_Module() {
   difference() {
      module_frame();

      translate([-delta, 27, 2*plate_thickness + 2])
         cube([wall_thickness + 1 + 2*delta, 58, 9]);
   }

   translate([wall_thickness + 1, 0, plate_thickness])
      cube([slot_depth - 2*wall_thickness - 2, wall_thickness + 1, 5]);

   translate([(slot_depth - raspberry_depth)/2, wall_thickness + 1 + delta, plate_thickness])
      union() {
         screw_mount(3.5, 23.5, 0, $fn=32);
         screw_mount(raspberry_depth - 3.5, 23.5, 0, $fn=32);
         screw_mount(3.5, 81.5, 0, $fn=32);
         screw_mount(raspberry_depth - 3.5, 81.5, 0, $fn=32);
      }
}
