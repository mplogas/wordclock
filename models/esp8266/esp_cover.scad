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

cpu_start_x = 6.5;
cpu_x = 16;
cpu_start_y = 6.5;
cpu_y = 13;

// case();
// translate([0, esp_y+ 5*case_thickness, 0]) lid();
lid();

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

module lid() {
    union() {
        difference(){
            cube([esp_x+4*case_thickness, esp_y+4*case_thickness, case_thickness]);
            translate([3*case_thickness + cpu_start_x, 2*case_thickness+cpu_start_y, 0]) cube([cpu_x, cpu_y, case_thickness]);
        }
        //outer lid
        //left
        translate([0,0,case_thickness]) cube([case_thickness, esp_y+4*case_thickness, case_thickness+1]);
        //top
        translate([0, esp_y+3*case_thickness, case_thickness])cube([esp_x+4*case_thickness, case_thickness, case_thickness+1]);
        //right with usb cutout
        difference() {            
            translate([esp_x+3*case_thickness, 0, case_thickness])cube([case_thickness, esp_y+4*case_thickness, case_thickness+1]);
            translate([esp_x+3*case_thickness, 2 * case_thickness + esp_y/2 - (usb_y + 2*usb_plug_thickness_y)/2, case_thickness]) cube([case_thickness,usb_y+2*usb_plug_thickness_y, case_thickness + usb_z + usb_plug_thickness_z]);
        }
        //bottom
        translate([0,0,case_thickness])cube([esp_x+4*case_thickness, case_thickness, case_thickness+1]);

        //inner lid        
        //top
        translate([2*case_thickness, esp_y+case_thickness, case_thickness])cube([esp_x, case_thickness, 1]);
        //bottom
        translate([2*case_thickness,2*case_thickness,case_thickness])cube([esp_x, case_thickness, 1]);
        //right
        translate([esp_x+case_thickness,2*case_thickness,case_thickness]) cube([case_thickness, esp_y, 1]);

    }
}