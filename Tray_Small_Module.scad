include <Commons.scad>


//Tray_Small_Module();

module Tray_Small_Module() {
   small_module_frame();

   translate([small_slot_depth - wall_thickness - 1, wall_thickness + 1, 0])
      cube([wall_thickness + 1, small_slot_width - 2*wall_thickness - 2, height]);
}