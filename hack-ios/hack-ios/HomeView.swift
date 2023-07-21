//
//  HomeView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI
import MapKit
import AVFoundation

struct HomeView: View {
    
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.646389, longitude: -100.290556), span: MKCoordinateSpan(latitudeDelta: 0.0075, longitudeDelta: 0.0075))
    
    var body: some View {
        
        ZStack {
            
            Map(coordinateRegion: $mapRegion, annotationItems: Location.locations) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    Image("LocationIcon")
                        .resizable()
                        .frame(width: 30, height: 35)
                        .shadow(color: .gray, radius: 5, x: 0, y: 5)
                }
            }
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
