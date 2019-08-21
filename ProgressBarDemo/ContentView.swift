//
//  ContentView.swift
//  Progress
//
//  Created by Sarah Reichelt on 18/08/2019.
//

import SwiftUI

struct ContentView: View {
    @State private var progress: Double = 0

    var body: some View {
        VStack {
            ProgressBar(maxValue: .constant(100),
                        currentValue: $progress,
                        barWidth: .constant(300))

            Divider()
            
            Text("Progress: \(Int(progress))")
            Stepper(value: $progress, in: 0...100) {
                Text("Adjust progress bar:")
            }
            .padding()

            ChangeButtons(progress: $progress)
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

struct ChangeButtons: View {
    @Binding var progress: Double
    let buttonNumbers = [0, 25, 50, 75, 100]

    var body: some View {
        HStack {
            ForEach(0 ..< buttonNumbers.count) { index in
                Button(action: { self.progress = Double(self.buttonNumbers[index]) }) {
                    Text("\(self.buttonNumbers[index])")
                        .font(.headline)
                        .padding(10)

                }
                .modifier(ButtonStyling())
            }
        }
    }
}

struct ButtonStyling: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
    }
}
