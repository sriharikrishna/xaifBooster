//
// POV-Ray(tm) 3.0 tutorial example scene.
// Copyright 1996 by the POV-Ray Team
//

//
// Note: image.pov has to be traced before this scene can be used.
//
 
#include "colors.inc"
#include "finish.inc"
#include "metals.inc"
#include "woods.inc"

camera{
  location <1, 10,1>
  look_at <1,0,1>
}

height_field {
  tga "title.tga"
  water_level 0.35
  smooth
  texture { 
    pigment { P_Silver1 }
    finish { F_MetalB }
  }  	
  translate <-.43, -.5, -.40>
//  scale <3, 0.15, 3>
    scale <12.8, 0.15, 9.5>
}

light_source{ <10,40,-10>  color red .8 green .8 blue 0.6 }
light_source{ <-10,30,10> color red .8 green .8 blue .6}

