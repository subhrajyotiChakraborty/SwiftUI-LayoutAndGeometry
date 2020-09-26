//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Subhrajyoti Chakraborty on 26/09/20.
//

import SwiftUI

struct ContentView: View {
    // Absolute positioning for SwiftUI views
    
    //    var body: some View {
    //        Text("Hello world")
    //            .position(x: 100, y: 100)
    //            .background(Color.red)
    
    //        Text("Hello world")
    //            .offset(x: 100, y: 100)
    //            .background(Color.red)
    //    }
    
    
    
    // Understanding frames and coordinates inside GeometryReader
    
    //    var body: some View {
    //        VStack {
    //            GeometryReader { geo in
    //                Text("Hello, World!")
    //                    .frame(width: geo.size.width * 0.9, height: 40)
    //                    .background(Color.red)
    //            }
    //            .background(Color.green)
    //
    //            Text("More text")
    //                .background(Color.blue)
    //        }
    
    //        OuterView()
    //            .background(Color.red)
    //            .coordinateSpace(name: "Custom")
    //    }
    
    
    
    // ScrollView effects using GeometryReader
    
    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]
    
    //    var body: some View {
    //        GeometryReader { fullView in
    //            ScrollView(.vertical) {
    //                ForEach(0..<50) { index in
    //                    GeometryReader { geo in
    //                        Text("Row #\(index)")
    //                            .font(.title)
    //                            .frame(width: fullView.size.width)
    //                            .background(self.colors[index % 7])
    //                            .rotation3DEffect(
    //                                .degrees(Double(geo.frame(in: .global).minY - fullView.size.height / 2) / 5),
    //                                axis: (x: 0.0, y: 1.0, z: 0.0)
    //                            )
    //                    }
    //                    .frame(height: 40)
    //                }
    //            }
    //        }
    //    }
    
    var body: some View {
        GeometryReader { fullView in
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<50) { index in
                        GeometryReader { geo in
                            Rectangle()
                                .fill(self.colors[index % 7])
                                .frame(height: 150)
                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).midX - fullView.size.width / 2) / 10), axis: (x: 0, y: 1, z: 0))
                        }
                        .frame(width: 150)
                    }
                }
                .padding(.horizontal, (fullView.size.width - 150) / 2)
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//struct OuterView: View {
//    var body: some View {
//        VStack {
//            Text("Top")
//            InnerView()
//                .background(Color.green)
//            Text("Bottom")
//        }
//    }
//}
//
//struct InnerView: View {
//    var body: some View {
//        HStack {
//            Text("Left")
//            GeometryReader { geo in
//                Text("Center")
//                    .background(Color.blue)
//                    .onTapGesture {
//                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
//                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
//                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
//                    }
//            }
//            .background(Color.orange)
//            Text("Right")
//        }
//    }
//}
