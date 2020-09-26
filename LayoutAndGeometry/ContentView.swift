//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Subhrajyoti Chakraborty on 26/09/20.
//

import SwiftUI

struct ContentView: View {
    
    // How layout works in SwiftUI
    
    //    var body: some View {
    //        VStack {
    //            Text("Hello, World!")
    //                .background(Color.red)
    //                .padding()
    //
    //            Text("Hello, world!")
    //                .padding(20)
    //                .background(Color.red)
    //
    //            Color.red
    //        }
    //    }
    
    
    // Alignment and alignment guides
    
    //    var body: some View {
    //        Text("Live long and prosper")
    //            .frame(width: 300, height: 300, alignment: .topLeading)
    //            .offset(x: 100, y: 30)
    
    //        HStack(alignment: .lastTextBaseline) {
    //            Text("Live")
    //                .font(.caption)
    //            Text("long")
    //            Text("and")
    //                .font(.title)
    //            Text("prosper")
    //                .font(.largeTitle)
    //        }
    
    //        VStack(alignment: .leading) {
    //            Text("Hello, world!")
    //                .alignmentGuide(.leading, computeValue: { dimension in
    //                    dimension[.trailing]
    //                })
    //            Text("This is a longer line of text")
    //        }
    //        .background(Color.red)
    //        .frame(width: 400, height: 400)
    //        .background(Color.blue)
    
    //        VStack(alignment: .leading) {
    //            ForEach(0..<10) { position in
    //                Text("Number \(position)")
    //                    .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
    //            }
    //        }
    //        .background(Color.red)
    //        .frame(width: 400, height: 400)
    //        .background(Color.blue)
    //    }
    
    
    // How to create a custom alignment guide
    
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@robocop")
                    .alignmentGuide(.midAccountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                Image("robot")
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("ROBO COP")
                    .alignmentGuide(.midAccountAndName, computeValue: { dimension in
                        dimension[VerticalAlignment.center]
                    })
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension VerticalAlignment {
    enum MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
