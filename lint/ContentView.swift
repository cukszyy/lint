//
//  ContentView.swift
//  lint
//
//  Created by Lucas Portella on 14/09/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Login()
                .preferredColorScheme(.dark)
                .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
