//
//  DraggableResultView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI

struct DraggableResultView: View {
    
    @State private var dragOffset: CGSize = .zero
    @State private var finalOffset: CGSize = .zero
    
    var body: some View {
        
        GeometryReader { geo in
            
            ZStack(alignment: .bottom) {
                
                Rectangle()
                    .fill(.white)
                    .frame(width: geo.size.width, height: 730)
                    .cornerRadius(50)
                    .offset(y: min(max(dragOffset.height + finalOffset.height + 262.5, 40), UIScreen.main.bounds.height - 375))
                    .gesture(DragGesture().onChanged({ value in
                        dragOffset = value.translation
                    }).onEnded({ value in
                        finalOffset.height += dragOffset.height
                        dragOffset = .zero
                    }))
                    .overlay {
                        
                    }
                
                VStack {
                    
                    Rectangle()
                        .fill(.gray)
                        .frame(width: 75, height: 4)
                        .cornerRadius(2)
                    
                    HStack {
                        
                        Text("Results")
                            .font(.system(size: 30, weight: .bold))
                        
                        Spacer()
                            .frame(width: 200)
                        
                        Text("\(Dog.dogs.count) Results")
                        
                    } // -> HStack
                    
                    
                    ForEach(Dog.dogs, id: \.id) { dog in

                        DogCardView(pet: dog)

                        Spacer()
                            .frame(height: 25)

                    } // -> ForEach
                    
                } // -> VStack
                    .offset(x: 0, y: -102 + min(max(dragOffset.height + finalOffset.height + 262.5, 40), UIScreen.main.bounds.height - 375))
                
            } // -> ZStack
            .ignoresSafeArea()
            
        } // -> GeometryReader
        
    } // -> body
    
} // -> DraggableResultView

struct DraggableResultView_Previews: PreviewProvider {
    static var previews: some View {
        DraggableResultView()
    }
}
