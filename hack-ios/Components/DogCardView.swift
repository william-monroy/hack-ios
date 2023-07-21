//
//  DogCardView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI

struct DogCardView: View {
    
    @State var pet : Dog
    
    var formattedDate: String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = "hh:mm a - dd/MM/yyyy"
       return dateFormatter.string(from: pet.date)
   }
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.white)
                .frame(width: 360, height: 150)
                .shadow(color: .gray, radius: 5, x: 0, y: 5)
            
            HStack {
                
                Image(pet.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Spacer()
                    .frame(width: 10)
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text(pet.breed)
                            .font(.system(size: 20, weight: .bold))
                        
                        Spacer()
                        
                        Text("\(formattedDate)")
                            .foregroundColor(.gray)
                            .font(.system(size: 10))
                    }
                    
                    HStack {
                        
                        ForEach(pet.color, id: \.self) { color in
                            
                            Text(color)
                                .font(.system(size: 18, weight: .semibold))
                                .foregroundColor(.orange)
                            
                            if (color == pet.color.last) {
                                Text("/")
                                Text(pet.size)
                            } else {
                                Text("•")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(.orange)
                            } // -> if-else
                            
                        } // -> ForEach
                        
                    } // -> HStack
                    
                    Text(pet.description)
                        .font(.system(size: 12))
                    
                    Spacer()
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                            .foregroundColor(.orange)
                            .font(.system(size: 12))
                        
                        Text(pet.location)
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .light))
                        
                        Spacer()
                        
                        if pet.picked {
                            Circle()
                                .frame(width: 10, height: 10)
                                .foregroundColor(.orange)
                        } else {
                            Circle()
                                .stroke(.orange, lineWidth: 2)
                                .frame(width: 10, height: 10)
                        }
                        
                        Text("Picked")
                            .foregroundColor(.gray)
                            .font(.system(size: 12, weight: .regular))
                        
                    } // -> HStack
                    
                } // -> VStack
                    .frame(width: 235, height: 120)
                
            } // -> HStack
            
        } // -> ZStack
        
    } // -> body
    
} // -> DogCardView

struct DogCardView_Previews: PreviewProvider {
    static var previews: some View {
        DogCardView(pet: Dog.dogs[2])
    }
}
