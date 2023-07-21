//
//  MenuView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI

struct MenuView: View {
    
    @State private var tabSelected: Tab = .house
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
        
        ZStack {
            
            VStack {
                
                TabView(selection: $tabSelected) {
                    
                    HomeView()
                        .tag(Tab.house)
                    
                    ContentView()
                        .tag(Tab.camera)
                    
                    ReportView()
                        .tag(Tab.report)
                    
                } // -> TabView
                
            } // -> VStack
            
            VStack {
                Spacer()
                MainView(selectedTab: $tabSelected)
            } // -> VStack
            
        } // -> ZStack
        
    } // -> body
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
