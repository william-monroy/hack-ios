//
//  PredictionResultView.swift
//  coreML-starter
//

import SwiftUI

struct PredictionResultView: View {
    private(set) var labelData: Classification
    
    var body: some View {
        // TODO: The View that shows classification results - edit the styling below!
        
        VStack(alignment: .center) {
            Text(labelData.label.capitalized)
                .font(.largeTitle).foregroundColor(.blue)
            
            
        }// VStack
        .frame(width: 400)
        .padding()
    }
}

struct PredictionResultView_Previews: PreviewProvider {
    static var previews: some View {
        PredictionResultView(labelData: Classification())
    }
}
