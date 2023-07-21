//
//  CardCameraView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 21/07/23.
//

import SwiftUI

struct CardCameraView: View {
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: geo.size.width, height: 250)
                    .shadow(color: .gray, radius: 5, x: 0, y: -5)
                
                HStack {
                    
                    Image("Shitzu")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 140, height: 140)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                    
                    Spacer()
                        .frame(width: 20)
                    
                    VStack(alignment: .leading) {
                        
                        Text("Shitzu")
                            .foregroundColor(.black)
                            .font(.system(size: 30, weight: .bold))
                        
                        Text("80%")
                            .foregroundColor(Colors.darkOrange)
                            .font(.system(size: 29, weight: .bold))
                        
                        Text("Description Description Description Description Description Description")
                            .foregroundColor(.black)
                        
                    } // -> VStack
                    
                } // -> HStack
                
            } // -> ZStack
            
        } // -> GeometryReader
        
    } // -> body
    
} // -> CardCameraView

struct CardCameraView_Previews: PreviewProvider {
    static var previews: some View {
        CardCameraView()
    }
}
