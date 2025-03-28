include <Commons.scad>

translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
   Tray_Module();


module Tray_Module() {
   module_frame();

   translate([wall_thickness, 0, 0])
      cube([slot_depth - 2*wall_thickness, wall_thickness + 1, height]);
}
