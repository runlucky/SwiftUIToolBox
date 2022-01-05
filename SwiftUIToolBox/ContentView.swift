//
//  ContentView.swift
//  SwiftUIToolBox
//
//  Created by Kakeru Fukuda on 2022/01/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .didBecomeActive {
                print("didBecomeActive")
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
