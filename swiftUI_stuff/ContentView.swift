//
//  ContentView.swift
//  swiftUI_stuff
//
//  Created by Conan Moriarty on 14/1/24.
//

import SwiftUI

struct ContentView: View {
  
  @State private var fingerCount = 0
  @State private var isPressed = false
  var start = Date()
  
  var body: some View {
    ZStack {
      TimelineView(.animation) { context in
        Rectangle()
          .foregroundStyle(.white)
          .timeLines(seconds: context.date.timeIntervalSince1970 - self.start.timeIntervalSince1970, tapValue: CGFloat(fingerCount))
          .simultaneousGesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
            .onChanged { value in
              self.isPressed = true
              self.fingerCount = 5
            }
            .onEnded { _ in
              self.isPressed = false
              self.fingerCount = 0
            }
          )
      }
    }
  }
}


// Extension
extension View {
  
  func timeLines(seconds: Double,  tapValue: CGFloat ) -> some View {
    
    self
      .colorEffect(
        ShaderLibrary.default.bitchass(
          .boundingRect,
          .float(seconds),
          .float(tapValue)
        )
      )
  }
  
}


#Preview {
  ContentView()
}
