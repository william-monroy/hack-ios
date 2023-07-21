//
//  SearchView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI
import MapKit

struct SearchView: View {
    
    @State private var address: String = ""
    @State var selectedFilter = BreedFilter.All
    
    var body: some View {
            
            ZStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
//                    .frame(width: geo.size.width-30, height: geo.size.height/10)
                    .frame(width: 360, height: 75)
                    .shadow(color: .gray, radius: 5, x: 0, y: 5)
                
                HStack {
                    
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(.orange)
                    
                    TextField("Enter an address, neighbourhood or city", text: $address)
                        .foregroundColor(.gray)
                        .font(.system(size: 13))
                        .frame(width: 250)
                    
                    Spacer()
                        .frame(width: 25)
                    
                    Menu {
                        Picker("", selection: $selectedFilter.animation()) {
                            ForEach(BreedFilter.allFilters, id: \.self) { filter in
                                Text(filter.rawValue)
                            }
                        }
                    } label: {
                        Image(systemName: "line.3.horizontal.decrease.circle")
                            .foregroundColor(.black)
                    } // -> Menu
                    
                } // -> HStack
                
            } // -> ZStack
        
    } // -> body
    
} // -> SearchView

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
