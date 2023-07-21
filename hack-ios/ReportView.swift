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
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
    
    func submit() {
            if race.isEmpty || color.isEmpty || eyesColor.isEmpty || size.isEmpty || image == nil {
                alertTitle = "Incomplete Form"
                alertMessage = "Please fill all fields and select a photo"
            } else {
                alertTitle = "Success"
                alertMessage = "Your form has been submitted"
            }
            
            showingAlert = true
        }
    
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
                        // For camera access uncomment below
                        Button(action: {
                            self.sourceType = .camera
                            self.showingImagePicker = true
                        }) {
                            HStack {
                                Spacer()
                                Text("Select a Photo")
                                Spacer()
                            }
                        }
                        
                        /*Button(action: {
                            // Open camera
                        }) {
                            HStack {
                                Spacer()
                                Text("Take a Photo")
                                Spacer()
                            }
                        }*/
                        
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
                    
                    Section {
                                            Button(action: submit) {
                                                Text("Submit")
                                            }
                                        }
                }
            }
            .navigationTitle("Report a Missing Dog")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage, sourceType: self.sourceType)
            }
            .alert(isPresented: $showingAlert) {
                            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
        }
    }
    
    struct ImagePicker: UIViewControllerRepresentable {
        @Environment(\.presentationMode) var presentationMode
        @Binding var image: UIImage?
        var sourceType: UIImagePickerController.SourceType
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
            let picker = UIImagePickerController()
            picker.delegate = context.coordinator
            picker.sourceType = self.sourceType
            return picker
        }
        
        func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
            
        }
        
        func makeCoordinator() -> Coordinator {
            Coordinator(self)
        }
        
        class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
            let parent: ImagePicker
            
            init(_ parent: ImagePicker) {
                self.parent = parent
            }
            
            func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
                if let uiImage = info[.originalImage] as? UIImage {
                    parent.image = uiImage
                }
                
                parent.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

struct ReportView_Previews: PreviewProvider {
    static var previews: some View {
        ReportView()
    }
}
