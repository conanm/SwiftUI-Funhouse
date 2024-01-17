//
//  ShaderTesterView.swift
//  swiftUI_stuff
//
//  Created by Conan Moriarty on 14/1/24.
//

import SwiftUI

struct ShaderTesterView: View {
  let center1 = CGPoint(x: 100, y: 50)
  let center2 = CGPoint(x: 200, y: 150)
  
  var pointCenters: [Float] {
    [Float(center1.x), Float(center1.y), Float(center2.x), Float(center2.y)]
  }
  
  var body: some View {
    // assuming you have declared and defined 'boardSize' somewhere
    Rectangle()
      .frame(width: 400, height: 600)
      .background(Color.blue)
      .colorEffect(
        ShaderLibrary.pointFields(
          .floatArray(pointCenters)
        )
      )
  }  
}

#Preview {
  ShaderTesterView()
}



