x_small=196;
x_large=228;
y=19;
z=2.6;

spacer=3;
spacer_cut_height=11;
spacer_cut_amount=12;
spare=14;
start_small=3;
end_small=3;
start_large=19;
end_large=19;
cable_cut_diam=4;
cable_cut=1;

//elementLarge(true);
elementSmall(true);

module elementLarge(cut) {
    difference() {
        cube([x_large,y,z]);
        translate([start_large/2 - cable_cut_diam/2, 0, 0]) cylinder(d=cable_cut_diam, h=z, center=false);
        translate([start_large/2 - cable_cut_diam/2, y, 0]) cylinder(d=cable_cut_diam, h=z, center=false);
        for (i=[0:spacer_cut_amount-1])
            translate([start_large + i*spacer + i*spare,0,0])
                cube([spacer,spacer_cut_height,z]);
        if(cut) {
        for (i=[0:spacer_cut_amount-2])
            translate([start_large + spacer + i*spacer + i*spare+1,y-cable_cut,0])
                cube([spare-2,cable_cut,z]);
        }
    };
} 

module elementSmall(cut) {
    difference() {
        cube([x_small,y,z]);
        for (i=[0:spacer_cut_amount-1])
            translate([start_small + i*spacer + i*spare,0,0])
                cube([spacer,spacer_cut_height,z]);
        if(cut) {
            for (i=[0:spacer_cut_amount-2])
                translate([start_small + spacer + i*spacer + i*spare+1,y-cable_cut,0])
                    cube([spare-2,cable_cut,z]);
        }
    };
} 
