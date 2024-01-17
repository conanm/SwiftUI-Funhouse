//
//  BasicShader.metal
//  swiftUI_stuff
//
//  Created by Conan Moriarty on 14/1/24.
//

#include <metal_stdlib>
using namespace metal;

[[ stitchable ]] half4 pointFields(float2 position, half4 currentColor, device const float *centers, int count) {
    float totalStrength = 0.0;
    for (int i = 0; i < count; i += 2) {
        float nextCenterX = centers[i];
        float nextCenterY = centers[i+1];
        
        // Compute distance center - position
        float x = position.x;
        float y = position.y;
        float xDistance = nextCenterX - x;
        float yDistance = nextCenterY - y;
        float d = sqrt(xDistance * xDistance + yDistance * yDistance);
        float r = d + 1.0; // min r is now 1
        totalStrength += 1.0 / sqrt(r);
    }

    return half4(currentColor[0], currentColor[1], currentColor[2], totalStrength);
}
