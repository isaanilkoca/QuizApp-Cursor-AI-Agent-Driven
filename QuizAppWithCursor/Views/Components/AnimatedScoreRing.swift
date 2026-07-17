//
//  AnimatedScoreRing.swift
//  QuizAppWithCursor
//

import SwiftUI

struct AnimatedScoreRing: View {
    let percentage: Int
    let color: Color

    @State private var animatedProgress: Double = 0
    @State private var displayedPercentage = 0

    var body: some View {
        ZStack {
            Circle()
                .stroke(color.opacity(0.15), lineWidth: 14)

            Circle()
                .trim(from: 0, to: animatedProgress)
                .stroke(
                    AngularGradient(
                        colors: [color.opacity(0.6), color, AppTheme.brandSecondary],
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 14, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .shadow(color: color.opacity(0.35), radius: 8)

            VStack(spacing: 4) {
                Text("\(displayedPercentage)%")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundStyle(color)
                    .contentTransition(.numericText())

                Text("Score")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(width: 140, height: 140)
        .onAppear {
            withAnimation(AppTheme.spring.delay(0.3)) {
                animatedProgress = Double(percentage) / 100
            }
            animatePercentage()
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel("Score: \(percentage) percent")
    }

    private func animatePercentage() {
        let steps = max(percentage, 1)
        let stepDuration = 0.9 / Double(steps)

        for step in 0...steps {
            DispatchQueue.main.asyncAfter(deadline: .now() + stepDuration * Double(step)) {
                withAnimation(AppTheme.snappy) {
                    displayedPercentage = min(step * percentage / steps, percentage)
                }
            }
        }
    }
}

#Preview {
    AnimatedScoreRing(percentage: 85, color: .green)
        .padding()
}
