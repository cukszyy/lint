//
//  UserRegister.swift
//  lint
//
//  Created by Lucas Portella on 15/09/20.
//

import SwiftUI

struct UserRegister: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Register")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            .padding(.top, 40)
            
            ZStack {
                if viewModel.avatarData.count == 0 {
                    Image(systemName: "person")
                        .font(.system(size: 70))
                        .foregroundColor(.black)
                        .frame(width: 120, height: 120)
                        .background(Color.white)
                        .clipShape(Circle())
                } else {
                    Image(uiImage: UIImage(data: viewModel.avatarData)!)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 120)
                        .clipShape(Circle())
                }
            }
            .onTapGesture(perform: {
                viewModel.isPickerEnabled = true
            })
            
            HStack(spacing: 15) {
                TextField("Name", text: $viewModel.name)
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .padding()
            .padding(.top, 10)
            
            HStack {
                TextField("Bio", text: $viewModel.bio)
                    .padding()
                    .background(Color.white.opacity(0.08))
                    .cornerRadius(10)
                    .foregroundColor(.white)
            }
            .padding()
            
            Button(action: viewModel.register, label: {
                Text("Register")
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                    .padding(.vertical)
                    .frame(width: UIScreen.main.bounds.width - 150)
                    .background(Color.gray)
                    .cornerRadius(10.0)
            })
            .disabled(!viewModel.fieldsAreFilled)
            .opacity(viewModel.fieldsAreFilled ? 1.0 : 0.3)
            
            Spacer()
        }
        .background(Color(red: 0.12, green: 0.11, blue: 0.14, opacity: 1.0)).ignoresSafeArea(edges: .all)
        .sheet(isPresented: $viewModel.isPickerEnabled, content: {
            ImagePicker(isPickerEnabled: $viewModel.isPickerEnabled, avatarData: $viewModel.avatarData)
        })
    }
}

struct UserRegister_Previews: PreviewProvider {
    static var previews: some View {
        UserRegister()
    }
}
