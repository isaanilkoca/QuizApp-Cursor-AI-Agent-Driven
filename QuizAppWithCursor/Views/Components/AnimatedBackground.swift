//
//  AnimatedBackground.swift
//  QuizAppWithCursor
//

import SwiftUI

struct AnimatedBackground: View {
    @State private var animate = false

    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                .ignoresSafeArea()

            Circle()
                .fill(AppTheme.brandPrimary.opacity(0.22))
                .frame(width: 320, height: 320)
                .blur(radius: 60)
                .offset(x: animate ? 90 : -70, y: animate ? -180 : -120)

            Circle()
                .fill(AppTheme.brandSecondary.opacity(0.18))
                .frame(width: 280, height: 280)
                .blur(radius: 55)
                .offset(x: animate ? -100 : 80, y: animate ? 220 : 160)

            Circle()
                .fill(AppTheme.brandTertiary.opacity(0.14))
                .frame(width: 240, height: 240)
                .blur(radius: 50)
                .offset(x: animate ? 40 : -30, y: animate ? 40 : 100)
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.easeInOut(duration: 7).repeatForever(autoreverses: true)) {
                animate = true
            }
        }
        .accessibilityHidden(true)
    }
}

#Preview {
    AnimatedBackground()
}
