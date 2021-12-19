esp_x=35;
esp_y=26;
esp_z=7;

case_thickness = 1;

usb_y=9;
usb_z=3;
usb_plug_thickness_z = 2;
usb_plug_thickness_y = 3;

cable_x = 13;
cable_start_x = 17;

case();

module esp() {
    cube([esp_x, esp_y, esp_z]);
}

module case() {
    union() {
        difference() {
            cube([esp_x+2*case_thickness, esp_y + 2*case_thickness, case_thickness + usb_z + 2]);
            translate([case_thickness, case_thickness, case_thickness]) esp();
            //usb cutout
            translate([case_thickness + esp_x, case_thickness + esp_y/2 - (usb_y + 2*usb_plug_thickness_y)/2, 0]) cube([case_thickness,usb_y+2*usb_plug_thickness_y, case_thickness + usb_z + usb_plug_thickness_z]);
            //cable cutout
            translate([case_thickness + cable_start_x, case_thickness + esp_y, case_thickness]) cube([cable_x, case_thickness, usb_z]);
        }
        translate([case_thickness, case_thickness, case_thickness]) cube([3, esp_y, usb_z]);
    }
}