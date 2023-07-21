//
//  MenuView.swift
//  hack-ios
//
//  Created by Brenda Saucedo on 20/07/23.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case house = "house.fill"
    case camera = "camera.fill"
}

struct MainView: View {
    
    @Binding var selectedTab: Tab
    
    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    Image(systemName: tab.rawValue)
                        .scaleEffect(tab == selectedTab ? 1.25 : 1.0)
                        .foregroundColor(tab == selectedTab ? .orange : .gray)
                        .font(.system(size: 20))
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 0.1)) {
                                selectedTab = tab
                            }
                        }
                    Spacer()
                }
            }
            .frame(width: nil, height: 60)
            .background(.thinMaterial)
            .cornerRadius(20)
            .padding()
        }
    }
    
} // -> MainView

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(selectedTab: .constant(.house))
    }
}
