include <Commons.scad>


//Tray_Module();

module Tray_Module() {
   module_frame();

   translate([wall_thickness, 0, 0])
      cube([slot_depth - 2*wall_thickness, wall_thickness + 1, height]);
}
