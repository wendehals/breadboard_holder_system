include <Commons.scad>
include <electronic-board-mockups/Arduino.scad>

translate([wall_thickness + delta, 0, plate_thickness])
   union() {
      Arduino_Module();

//      translate([(slot_depth - arduino_depth)/2, wall_thickness + 1 + delta, plate_thickness + 5 ])
//         Arduino(MEGA2560);
   }


module Arduino_Module() {
   module_frame();

   difference() {
      translate([wall_thickness + 1, 0, plate_thickness])
         cube([slot_depth - 2*wall_thickness - 2, wall_thickness + 1, height - plate_thickness]);

      translate([13, -0.5, plate_thickness + 6])
         cube([14, wall_thickness + 2, 7]);

      translate([44.5, -0.5, plate_thickness + 6])
         cube([11, wall_thickness + 2, 7]);
   }

   translate([(slot_depth - arduino_depth)/2, wall_thickness + 1 + delta, plate_thickness])
      union() {
         for(i = arduino_mega2560_mounts) {
            screw_mount(i[0], i[1], 0, $fn=32);
      }
   }
}
