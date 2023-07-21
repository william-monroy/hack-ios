//
//  HomeView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI
import MapKit

struct HomeView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.6866, longitude: -100.3161), span: MKCoordinateSpan(latitudeDelta: 0.0075, longitudeDelta: 0.0075))
    
    var body: some View {
        
        ZStack {
            
            Map(coordinateRegion: $mapRegion)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                SearchView()
                
                Spacer()
                
                DraggableResultView()
                
            } // -> VStack
            
        } // -> ZStack
        
    } // -> body
    
} // -> HomeView


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
