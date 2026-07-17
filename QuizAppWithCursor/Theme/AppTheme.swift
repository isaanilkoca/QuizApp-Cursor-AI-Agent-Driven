//
//  AppTheme.swift
//  QuizAppWithCursor
//

import SwiftUI

enum AppTheme {
    static let brandPrimary = Color(red: 0.42, green: 0.38, blue: 0.98)
    static let brandSecondary = Color(red: 0.98, green: 0.45, blue: 0.72)
    static let brandTertiary = Color(red: 0.30, green: 0.75, blue: 0.95)

    static let cardBackground = Color(.secondarySystemGroupedBackground)
    static let glassBorder = Color.white.opacity(0.25)

    static let spring = Animation.spring(response: 0.55, dampingFraction: 0.78)
    static let quickSpring = Animation.spring(response: 0.38, dampingFraction: 0.72)
    static let gentle = Animation.easeInOut(duration: 0.45)
    static let snappy = Animation.easeOut(duration: 0.28)

    static var brandGradient: LinearGradient {
        LinearGradient(
            colors: [brandPrimary, brandSecondary],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }

    static var heroGradient: LinearGradient {
        LinearGradient(
            colors: [
                brandPrimary.opacity(0.35),
                brandSecondary.opacity(0.22),
                brandTertiary.opacity(0.12),
                Color.clear
            ],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
    }
}

struct StaggeredAppear: ViewModifier {
    let index: Int
    let appeared: Bool

    func body(content: Content) -> some View {
        content
            .opacity(appeared ? 1 : 0)
            .offset(y: appeared ? 0 : 28)
            .scaleEffect(appeared ? 1 : 0.94)
            .animation(
                AppTheme.spring.delay(Double(index) * 0.08),
                value: appeared
            )
    }
}

struct PressableButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? 0.96 : 1)
            .animation(AppTheme.quickSpring, value: configuration.isPressed)
    }
}

struct GlassCard: ViewModifier {
    var cornerRadius: CGFloat = 20

    func body(content: Content) -> some View {
        content
            .background {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .fill(AppTheme.cardBackground)
                    .shadow(color: AppTheme.brandPrimary.opacity(0.08), radius: 20, y: 10)
            }
            .overlay {
                RoundedRectangle(cornerRadius: cornerRadius, style: .continuous)
                    .strokeBorder(
                        LinearGradient(
                            colors: [
                                AppTheme.brandPrimary.opacity(0.25),
                                AppTheme.glassBorder.opacity(0.15)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 1
                    )
            }
    }
}

extension View {
    func staggeredAppear(index: Int, appeared: Bool) -> some View {
        modifier(StaggeredAppear(index: index, appeared: appeared))
    }

    func glassCard(cornerRadius: CGFloat = 20) -> some View {
        modifier(GlassCard(cornerRadius: cornerRadius))
    }
}
