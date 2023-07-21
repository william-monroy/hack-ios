//
//  ReportView.swift
//  hack-ios
//
//  Created by Juan Daniel Rodríguez Oropeza on 20/07/23.
//

import SwiftUI

struct ReportView: View {
    @State private var race: String = ""
    @State private var color: String = ""
    @State private var eyesColor: String = ""
    @State private var size: String = ""
    @State private var hour: Date = Date()
    @State private var isPickedUp: Bool = false
    @State private var number: String = ""
    @State private var image: Image? = nil
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("Patitas")  // Use your background image name here
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                Form {
                    Section(header: Text("Details")) {
                        TextField("Race", text: $race)
                        TextField("Color", text: $color)
                        TextField("Eyes Color", text: $eyesColor)
                        TextField("Size", text: $size)
                        DatePicker("Hour", selection: $hour, displayedComponents: .hourAndMinute)
                        Toggle("Picked Up?", isOn: $isPickedUp)
                        TextField("Number", text: $number)
                    }
                    
                    Section(header: Text("Upload a Photo")) {
                        Button(action: {
                            // Open UIImagePickerController or camera
                        }) {
                            HStack {
                                Spacer()
                                Text("Select a Photo")
                                Spacer()
                            }
                        }
                        
                        Button(action: {
                            // Open camera
                        }) {
                            HStack {
                                Spacer()
                                Text("Take a Photo")
                                Spacer()
                            }
                        }
                        
                        // Photo Preview
                        if let image = self.image {
                            image
                                .resizable()
                                .scaledToFit()
                        } else {
                            Image("Image") // Placeholder image when no image is selected
                                .resizable()
                                .scaledToFit()
                        }
                    }
                }
            }
            .navigationTitle("Report a Missing Dog")
        }
    }
}


struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
