//
//  ContentView.swift
//  hack-ios
//
//  Created by William Frank Monroy Mamani on 20/07/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var logSucces: Bool = false
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        
        if logSucces {
            MenuView()
        } else {
            
            ZStack {
                
                Image("Pattern")
                    .resizable()
                    .scaledToFill()
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
                        
                    } // -> VStack
                    
                    Spacer()
                        .frame(height: 10)
                    
                    VStack {
                        
                        TextField("Email", text: $email)
                            .frame(width: 320)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        
                        SecureField("Password", text: $password)
                            .frame(width: 320)
                            .padding()
                            .background(Color.white)
                            .cornerRadius(5.0)
                            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                        
                        Spacer()
                            .frame(height: 50)
                        
                        Button(action: {
                            self.logSucces.toggle()
                        }) {
                            Text("Login")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding()
                                .frame(width: 250, height: 60)
                                .background(Colors.lightOrange)
                                .cornerRadius(50)
                        } // -> Button
                        
                    } // -> VStack
                    .padding(24)
                    
                    Spacer()
                    
                } // -> VStack
                
            } // -> ZStack
            
        } // -> if-else
        
    } // -> body
    
} // -> ContentView

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
