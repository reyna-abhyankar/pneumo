//
//  DetailView.swift
//  Pneumo
//
//  Created by Viren Abhyankar on 7/8/20.
//  Copyright © 2020 Viren Abhyankar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    
    @Binding var addMode: Bool
    @Binding var contact: Contact
    @Binding var didCancel: Bool
    
    @State var showCaptureImageView: Bool = false
    
    @State private var selectedSex = 0
    @State private var image: UIImage? = nil
    @State private var buttonEnabled: Bool = false
    @State private var classificationLabel: String = ""
    
    var sex = ["Female", "Male", "Unspecified"]
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section {
                        HStack {
                            Text("Name")
                            TextField("Enter here...", text: self.$contact.name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .padding()
                        }
                        
                        DatePicker("Date of birth", selection: self.$contact.bday, displayedComponents: .date)
 
                        DatePicker("Date of entry", selection: self.$contact.date, displayedComponents: .date)
                        
                        Picker(selection: $selectedSex, label: Text("Sex")) {
                            ForEach(0 ..< sex.count, id:\.self) {
                                Text(self.sex[$0])
                            }
                        }
                    }
                    Section {
                        VStack {
                            Spacer()
                            Button(action: {
                                self.showCaptureImageView.toggle()
                            }) {
                                Text("Choose scan for diagnosis")
                            }.disabled(buttonEnabled)
                            Spacer()
                            HStack {
                                Image(uiImage: (image ?? UIImage(named: "P4"))!)
                                    .resizable()
                                    .frame(width: 250, height: 250)
                                    .padding()
                                VStack {
                                    Button(action: {
                                        self.diagnoseImage()
                                        self.contact.diagnosis = self.classificationLabel
                                    }) {
                                        Text("Diagnose")
                                    }
                                        .disabled(!buttonEnabled)
                                        .frame(height: buttonEnabled ? nil : 0)
                                        .opacity(buttonEnabled ? 1 : 0)
                                    Text(self.classificationLabel)
                                }
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Add Patient", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                self.didCancel = true
                self.addMode = false
            }) {
                Text("Cancel")
            }, trailing: Button(action: {
                self.contact.sex = self.sex[self.selectedSex]
                self.contact.image = self.image ?? UIImage(named: "P4")! // change this image to blank pfp type
                self.addMode = false
            }) {
                Text("Done").bold()
            }.disabled(self.$contact.name.wrappedValue=="" || self.$contact.diagnosis.wrappedValue==""))
            .sheet(isPresented: $showCaptureImageView) {
                CaptureImageView(isShown: self.$showCaptureImageView,
                                 image: self.$image,
                                 enabled: self.$buttonEnabled)
            }
        }
    }
    
    func diagnoseImage() {
        let model = PneumoModel()
        
        guard let resizedImage = self.image?.resizeTo(size: CGSize(width: 299, height: 299)),
            let buffer = resizedImage.toBuffer() else {
                return
        }
        
        do {
            let prediction = try model.prediction(image: buffer)
            self.classificationLabel = prediction.classLabel
        } catch {
            print("Error")
        }
    }
}


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(addMode: .constant(true), contact: .constant(Contact()), didCancel: .constant(false))
    }
}
