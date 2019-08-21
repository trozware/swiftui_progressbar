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

    var backColor = Color(UIColor.secondarySystemBackground)
    var foreColor = Color.accentColor

    func innerWidth() -> CGFloat {
        let maxInnerWidth = barWidth - 4
        let percentProgress = currentValue / maxValue
        return maxInnerWidth * CGFloat(percentProgress)
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 6)
                .frame(width: barWidth, height: 12)
                .foregroundColor(backColor)

            RoundedRectangle(cornerRadius: 4)
                .frame(width: innerWidth(), height: 8)
                .foregroundColor(foreColor)
                .padding(.leading, 2)
                .padding(.trailing, barWidth - innerWidth() - 2)
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
