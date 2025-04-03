include <Jumper_Wires_Base.scad>
include <Modules_Frame.scad>
include <Arduino_Module.scad>
include <Raspberry_Pi_ModelB_Module.scad>
include <Raspberry_Pi_Zero_Module.scad>
include <Half_Size_Breadboard_Module.scad>
include <Two_Mini_Breadboards_Module.scad>
include <Tray_Module.scad>
include <Mini_Breadboard_Small_Module.scad>
include <Tray_Small_Module.scad>

include <electronic-board-mockups/Arduino.scad>
include <electronic-board-mockups/Breadboards.scad>
include <electronic-board-mockups/ESP.scad>

$fa = 1;
$fs = 0.4;


// Modules frame with breadboard
color("black")
   Modules_Frame();

translate([depth - wall_thickness - 1 - delta - breadboard_depth, wall_thickness + 1 + delta, 2*plate_thickness])
   Breadboard();


// Jumper Wire base
color("silver") translate([0, 0, -base_height + 1])
   Jumper_Wires_Base();


// Module with Raspberry Pi Model B
translate([wall_thickness + delta, 0, plate_thickness])
   union() {
      color("red")
      Raspberry_Pi_ModelB_Module();

      translate([(slot_depth - raspberry_depth)/2, wall_thickness + 1 + delta, plate_thickness + 5])
         Raspberry_Pi_4_ModelB();
}


// Module with Raspberry Pi Zero
//translate([wall_thickness + delta, 0, plate_thickness])
//   union() {
//      color("red")
//      Raspberry_Pi_Zero_Module();
//
//      translate([wall_thickness + 1 + delta, 23.5, plate_thickness + 5])
//         Raspberry_Pi_Zero($fn=32);
//   }


// Arduino module with Arduino MEGA 2560
//translate([wall_thickness + delta, 0, plate_thickness])
//   union() {
//      color("red")
//      Arduino_Module();
//
//      translate([(slot_depth - arduino_depth)/2, wall_thickness + 1 + delta, plate_thickness + 5 ])
//         Arduino(MEGA2560);
//   }


// Module with two mini breadboards and ESP32 Dev Kit
translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
   union() {
      color("red")
      Two_Mini_Breadboards_Module();

      translate([(slot_depth - mini_breadboard_width)/2, (slot_width - 2*mini_breadboard_depth - breadboard_distance)/2, plate_thickness])
      union() {
         translate([0, mini_breadboard_depth, 0]) rotate([0, 0, 270])
            Breadboard(MINI);

         translate([51.03, 29.92, breadboard_height + pitch + 2*delta]) rotate([0, 0, 90])
            ESP32_Dev_Kit();

         translate([0, 2*mini_breadboard_depth + breadboard_distance, 0]) rotate([0, 0, 270])
            Breadboard(MINI);
      }
   }


// Module with half-sized breadboard
//translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
//   union() {
//      color("red")
//      Half_Size_Breadboard_Module();
//
//      translate([breadboard_depth + 4.25, half_size_breadboard_width + 11.5, plate_thickness]) rotate([0, 0, 180])
//         Breadboard(HALF_SIZE);
//   }


// Module as tray
translate([slot_depth + wall_thickness + delta, 2*slot_width + wall_thickness, plate_thickness]) rotate([0, 0, 180])
      color("red")
   Tray_Module();


// Small module with mini breadboard
//translate([depth - small_slot_depth, width - wall_thickness - delta - small_slot_width, plate_thickness])
//   union() {
//      color("red")
//      Mini_Breadboard_Small_Module();
//
//      translate([(small_slot_depth - mini_breadboard_width)/2, (small_slot_width - mini_breadboard_depth - 2*delta)/2 + mini_breadboard_depth + delta, plate_thickness]) rotate([0, 0, 270])
//         Breadboard(MINI);
//   }


// Small module as tray
translate([depth - small_slot_depth, width - wall_thickness - delta - small_slot_width, plate_thickness])
      color("red")
   Tray_Small_Module();
