//
//  Home.swift
//  lint
//
//  Created by Lucas Portella on 20/09/20.
//

import SwiftUI

struct Home: View {
    @State var selectedTab = "Timeline"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            ZStack {
                Timeline()
                    .opacity(selectedTab == "Timeline" ? 1.0 : 0.0)
                
                Settings()
                    .opacity(selectedTab == "Settings" ? 1.0 : 0.0)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            HomeTabBar(selectedTab: $selectedTab)
        }
        .background(
            Color(red: 0.12, green: 0.11, blue: 0.14, opacity: 1.0)
                .ignoresSafeArea(.all, edges: .all)
        )
        .ignoresSafeArea(.all, edges: .top)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
