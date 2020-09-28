//
//  Settings.swift
//  lint
//
//  Created by Lucas Portella on 20/09/20.
//

import SwiftUI
import SDWebImageSwiftUI

struct Settings: View {
    @State var viewModel = SettingsViewModel()
    
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        VStack{
            HStack {
                Text("Settings")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, edges?.top ?? 0)
            .background(Color(red: 0.12, green: 0.11, blue: 0.14, opacity: 1.0))
            .shadow(color: Color.white.opacity(0.06), radius: 5, x: 0, y: 5)
            
            if viewModel.user.avatar != "" {
                ZStack {
                    WebImage(url: URL(string: viewModel.user.avatar))
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 125, height: 125)
                        .clipShape(Circle())
                }
            }
            
            HStack(spacing: 15) {
                Text(viewModel.user.username)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            HStack(spacing: 15) {
                Text(viewModel.user.bio)
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "square.and.pencil")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                }
            }
            .padding()
            
            Button(action: viewModel.logout, label: {
                Text("Logout")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .background(Color.gray)
                    .cornerRadius(10.0)
            })
            .padding()
            .padding(.top, 10)
            
            Spacer(minLength: 0)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
