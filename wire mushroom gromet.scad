// Increase rendering smoothness
$fn = 60; 

difference() {
    // 1. The main solid (Stem + Cap)
    union() {
        // Stem: 4mm thick, 15mm tall
        cylinder(d=4, h=15);
        
        // Head/Cap: 12mm wide half-sphere
        // We move it exactly to the top of the 15mm stem
        translate([0, 0, 15]) 
            intersection() {
                // The base sphere
                sphere(d=12);
                
                // We intersect it with a cylinder that only covers the top half (Z = 0 to 6)
                // This cleanly removes the bottom half of the sphere.
                cylinder(d=12, h=6);
            }
    }
    
    // 2. The 1mm hole
    // Starts below the origin and extends higher than the mushroom to cut cleanly
    translate([0, 0, -5])
        cylinder(d=1, h=30);
}