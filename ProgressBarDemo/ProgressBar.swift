//
//  ProgressBar.swift
//  Progress
//
//  Created by Sarah Reichelt on 18/08/2019.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var maxValue: Double
    @Binding var currentValue: Double
    @Binding var barWidth: CGFloat

    // Adjust these settings to suit
    var barHeight: CGFloat = 12
    var barInset: CGFloat = 2
    var backColor = Color(UIColor.secondarySystemBackground)
    var foreColor = Color.accentColor

    func innerWidth() -> CGFloat {
        let maxInnerWidth = barWidth - 4
        let percentProgress = currentValue / maxValue
        return maxInnerWidth * CGFloat(percentProgress)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: barHeight / 2)
                .frame(width: barWidth, height: barHeight)
                .foregroundColor(backColor)

            RoundedRectangle(cornerRadius: (barHeight - (barInset * 2)) / 2)
                .frame(width: innerWidth(), height: barHeight - (barInset * 2))
                .foregroundColor(foreColor)
                .padding(.leading, barInset)
                .padding(.trailing, barWidth - innerWidth() - barInset)
        }
        .frame(minHeight: 0, maxHeight: 20)
        .frame(width: barWidth)
    }
}

#if DEBUG
struct ProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ProgressBar(maxValue: .constant(100),
                    currentValue: .constant(30),
                    barWidth: .constant(300))
    }
}
#endif
