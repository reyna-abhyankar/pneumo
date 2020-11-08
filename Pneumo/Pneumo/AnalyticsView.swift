//
//  AnalyticsView.swift
//  Pneumo
//
//  Created by Alice Chien on 8/22/20.
//  Copyright © 2020 Alice Chien. All rights reserved.
//

import SwiftUI

struct Diagnosis {
    let labelMapping: [String:String] = ["COVID":"Covid-Induced",
                                         "PNEUMONIA":"Community-Acquired",
                                         "NORMAL":"No Pneumonia"]
    var maxDiagnosis: String
    var maxAccuracy: Int
    
    var midDiagnosis: String
    var midAccuracy: Int
    
    var minDiagnosis: String
    var minAccuracy: Int
    
    init(results: Dictionary<String, Double>, label: String) {
        func getIntVal(_ prob: Double) -> Int {
            return Int(prob*100)
        }
        maxDiagnosis = labelMapping[label]!
        maxAccuracy = getIntVal(results[label]!)
        
        var str1: String = ""
        var str2: String = ""
        var acc1: Int = -1
        var acc2: Int = -1
        for result in results.keys {
            if result == label {continue}
            if acc1 < 0 {
                acc1 = getIntVal(results[result]!)
                str1 = result
            } else {
                acc2 = getIntVal(results[result]!)
                str2 = result
            }
        }
        
        if acc1 > acc2 {
            midDiagnosis = labelMapping[str1]!
            midAccuracy = acc1
            
            minDiagnosis = labelMapping[str2]!
            minAccuracy = acc2
        } else {
            midDiagnosis = labelMapping[str2]!
            midAccuracy = acc2
            
            minDiagnosis = labelMapping[str1]!
            minAccuracy = acc1
        }
    }
    
    func pneumoniaDetected() -> Bool {
        return maxDiagnosis != "No Pneumonia"
    }
}

struct AnalyticsView: View {
    @Binding var showView: Bool
    @Binding var image: UIImage?
    
    @State private var classificationLabel: String = ""
    @State var diagnosisStrings = [String](repeating: "", count: 3)
    @State var accuracies = [Int](repeating: 0, count: 3)
    
    @State var pneumoniaDetected: Bool = false {
        didSet {
            if pneumoniaDetected {pneumoniaText = "PNEUMONIA DETECTED"}
            else {pneumoniaText = "NORMAL"}
        }
    }
    @State var pneumoniaText: String = ""
    
    var body: some View {
        VStack(spacing: 80) {
            VStack {
                Image(uiImage: (image ?? UIImage(named:"P4"))!)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 280, height: 270)
                    .border(Color.gray, width:0)
                    .offset(y: 35)
                Text("\(pneumoniaText)")
                    .font(.title)
                    .fontWeight(.light)
                    .foregroundColor(Color("DarkShade"))
                    .multilineTextAlignment(.center)
                    .offset(y: 40)
            }
            HStack(spacing: 8) {
                Image("P5")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50)
                    .padding()
                    .overlay(
                        //RoundedRectangle(cornerRadius: 100)
                         //   .stroke(Color.black, lineWidth: 2)
                        Circle().stroke(Color.black, lineWidth: 2)
                )
                VStack {
                    Text("\(diagnosisStrings[0])")
                        .font(.headline)
                        .padding(5)
                    Text("Prognosis Accuracy: \(accuracies[0])%")
                        .padding(5)
                        .offset(x: 8)
                }
            }.offset(y: -10)
            VStack {
                Text("Additional Results:")
                    .padding(5)
                    .font(.headline)
                Text("\(diagnosisStrings[1]): \(accuracies[1])%")
                    .padding(5)
                Text("\(diagnosisStrings[2]): \(accuracies[2])%")
                    .padding(5)
            }.offset(y: -30)
            HStack {
                Text("Treatment Plans")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("Accent2"))
                    .cornerRadius(100)
                Text("Save to Patient")
                    .foregroundColor(.white)
                    .padding(20)
                    .background(Color("Accent2"))
                    .cornerRadius(100)
            }.offset(y: -50)
        }
        .padding()
        .navigationBarTitle("Results")
        .onDisappear(perform: {
            showView = false
            image = nil
        })
        .onAppear(perform: diagnoseImage)
    }
    
    func diagnoseImage() {
        do {
            let model = try PneumoModel(contentsOf: PneumoModel.urlOfModelInThisBundle)
            
            guard let resizedImage = image?.resizeTo(size: CGSize(width: 299, height: 299)),
                let buffer = resizedImage.toBuffer() else {
                    return
            }
            
            do {
                let prediction = try model.prediction(image: buffer)
                let diagnosis = Diagnosis(results: prediction.classLabelProbs, label: prediction.classLabel)
                diagnosisStrings = [diagnosis.maxDiagnosis, diagnosis.midDiagnosis, diagnosis.minDiagnosis]
                accuracies = [diagnosis.maxAccuracy, diagnosis.midAccuracy, diagnosis.minAccuracy]
                pneumoniaDetected = diagnosis.pneumoniaDetected()
                
            } catch {
                print("Error")
            }
        } catch {
            print("Error")
        }
    }
}

/*
struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        AnalyticsView()
    }
}
 */

struct AnalyticsView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
