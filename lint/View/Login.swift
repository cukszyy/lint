//
//  Login.swift
//  lint
//
//  Created by Lucas Portella on 14/09/20.
//

import SwiftUI

struct Login: View {
    @StateObject var viewModel = LoginViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                Spacer(minLength: 0)
            }
            .padding()
            
            HStack(spacing: 15) {
                TextField("1", text: $viewModel.code)
                    .padding()
                    .frame(width: 60)
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
                
                TextField("000000000", text: $viewModel.phoneNumber)
                    .padding()
                    .background(Color.white.opacity(0.8))
                    .cornerRadius(10)
                    .foregroundColor(.black)
                    .keyboardType(.numberPad)
            }
            .padding()
            .padding(.top, 10)
            
            Button(action: viewModel.verifyUser, label: {
                Text("Verify")
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
        .alert(isPresented: $viewModel.hasErrors, content: {
            Alert(title: Text("An error has occurred"), message: Text(viewModel.errorMsg), dismissButton: .destructive(Text("Dismiss")))
        })
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
