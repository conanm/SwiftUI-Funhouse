//
//  DistortedViewShader.metal
//  swiftUI_stuff
//
//  Created by Conan Moriarty on 14/1/24.
//

// TODO: BASED ON WORK BY BLAH

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] float2 wave(float2 position, float time) {
    return position-float2(0, sin(position.x*0.05+time)*5);
}

