//
//  HomeTabBar.swift
//  lint
//
//  Created by Lucas Portella on 27/09/20.
//

import SwiftUI

struct HomeTabBar: View {
    @Binding var selectedTab: String
    
    var body: some View {
        HStack(spacing: 65) {
            TabButton(title: "Timeline", selectedTab: $selectedTab)
            TabButton(title: "Settings", selectedTab: $selectedTab)
        }
        .padding(.horizontal)
        .background(Color.white)
        .clipShape(Capsule())
    }
}

struct TabButton: View {
    var title: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {
            selectedTab = title
        }) {
            VStack(spacing: 5) {
//                Image(title)
//                    .renderingMode(.template)
                Text(title)
                    .font(.caption)
                    .fontWeight(.bold)
            }
            .foregroundColor(selectedTab == title ? .blue : .gray)
            .padding(.horizontal)
            .padding(.vertical, 10)
        }
    }
}
