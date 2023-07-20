//
//  ContentView.swift
//  hack-ios
//
//  Created by William Frank Monroy Mamani on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        ZStack {
            Image("Patitas")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                VStack {
                    Image("Perrito")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                    
                    Text("Where is my Woof?")
                        .font(.system(size: 34, weight: .bold, design: .rounded))
                        .multilineTextAlignment(.center)
                        .padding(.top, 20)
                }
                
                Spacer()
                
                VStack {
                    TextField("Correo Electrónico", text: $email)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(5.0)
                    
                    SecureField("Contraseña", text: $password)
                        .padding()
                        .background(Color.white.opacity(0.7))
                        .cornerRadius(5.0)
                    
                    Button(action: {
                        print("Botón de inicio de sesión presionado")
                    }) {
                        Text("Login")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.blue)
                            .cornerRadius(15.0)
                    }
                }
                .padding(24)
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
