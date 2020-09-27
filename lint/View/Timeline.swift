//
//  Timeline.swift
//  lint
//
//  Created by Lucas Portella on 20/09/20.
//

import SwiftUI

struct Timeline: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        VStack{
            HStack {
                Text("Timeline")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, edges?.top ?? 0)
            .background(Color(red: 0.12, green: 0.11, blue: 0.14, opacity: 1.0))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            Spacer(minLength: 0)
        }
    }
}

struct Timeline_Previews: PreviewProvider {
    static var previews: some View {
        Timeline()
    }
}
