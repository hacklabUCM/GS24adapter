/*
Created by Ricardo Espinosa
GNU General Public License v3.0
V1.0 - 31/03/2024
*/


penDiameter=29; // <---
part1height=10;
part1thickness=5;
couplingPartHeight=2;
couplingPartDiameter=16;
GS24diameter=11.5;
GS24height=11+part1height+couplingPartHeight;
unionParts=4;
axelDistance=couplingPartDiameter/2+penDiameter/2;
$fn=150;

// PART 1
color("gray"){
difference(){
    linear_extrude(part1height){
            offset(-unionParts)offset(unionParts){
                circle(GS24diameter/2);
                translate([axelDistance,0,0])
                circle((penDiameter/2)+part1thickness);
            }
    }
    
    translate([axelDistance,0,-part1height])
        cylinder(h=part1height*3, d=penDiameter);
    
    translate([axelDistance+penDiameter/2+part1thickness/2-1.25,-2.75,-0.1])
        cube([2.5,5.5,8]);
    
    translate([axelDistance+penDiameter/2-1,0,5])
    rotate([0,90,0])
        cylinder(h=part1thickness*2, d=3);

}}

// COUPLING PART
color("white"){
translate([0,0,part1height])
cylinder(h=couplingPartHeight,d=couplingPartDiameter);
}

// GS24 ADAPTER
cylinder(h=GS24height, d=GS24diameter);



