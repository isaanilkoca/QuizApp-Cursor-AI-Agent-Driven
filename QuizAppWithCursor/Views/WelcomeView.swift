//
//  WelcomeView.swift
//  QuizAppWithCursor
//

import SwiftUI

struct WelcomeView: View {
    let categories: [QuizCategory]
    let onSelectCategory: (QuizCategory) -> Void

    @State private var appeared = false
    @State private var logoPulse = false

    var body: some View {
        ZStack {
            AnimatedBackground()

            ScrollView {
                VStack(spacing: 32) {
                    header
                        .staggeredAppear(index: 0, appeared: appeared)

                    VStack(spacing: 16) {
                        Text("Pick Your Topic")
                            .font(.title2)
                            .fontWeight(.bold)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .staggeredAppear(index: 1, appeared: appeared)

                        ForEach(Array(categories.enumerated()), id: \.element.id) { index, category in
                            CategoryCard(category: category) {
                                onSelectCategory(category)
                            }
                            .staggeredAppear(index: index + 2, appeared: appeared)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 24)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                CloseAppButton(style: .toolbar)
            }
        }
        .onAppear {
            appeared = true
            withAnimation(.easeInOut(duration: 2.2).repeatForever(autoreverses: true)) {
                logoPulse = true
            }
        }
    }

    private var header: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(AppTheme.brandGradient.opacity(0.25))
                    .frame(width: 110, height: 110)
                    .scaleEffect(logoPulse ? 1.08 : 0.92)

                Circle()
                    .fill(AppTheme.brandGradient)
                    .frame(width: 88, height: 88)
                    .shadow(color: AppTheme.brandPrimary.opacity(0.45), radius: 20, y: 8)

                Image(systemName: "bolt.fill")
                    .font(.system(size: 38, weight: .semibold))
                    .foregroundStyle(.white)
                    .symbolEffect(.pulse, options: .repeating, value: appeared)
            }
            .accessibilityHidden(true)

            VStack(spacing: 8) {
                Text("QuickyInterview")
                    .font(.system(size: 34, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.brandGradient)

                Text("Fast, focused iOS interview practice for new graduates.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
            }

            HStack(spacing: 12) {
                StatBadge(icon: "questionmark.circle.fill", label: "20 Qs", detail: "per topic")
                StatBadge(icon: "clock.fill", label: "Quick", detail: "sessions")
                StatBadge(icon: "star.fill", label: "Interview", detail: "ready")
            }
        }
        .padding(.top, 8)
    }
}

private struct StatBadge: View {
    let icon: String
    let label: String
    let detail: String

    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.caption)
                .foregroundStyle(AppTheme.brandPrimary)
            Text(label)
                .font(.caption)
                .fontWeight(.bold)
            Text(detail)
                .font(.caption2)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 10)
        .glassCard(cornerRadius: 14)
    }
}

private struct CategoryCard: View {
    let category: QuizCategory
    let action: () -> Void

    @State private var isPressed = false

    private var accentColors: [Color] {
        switch category.title {
        case "Swift": [AppTheme.brandPrimary, AppTheme.brandTertiary]
        case "SwiftUI": [AppTheme.brandSecondary, AppTheme.brandPrimary]
        default: [AppTheme.brandTertiary, AppTheme.brandSecondary]
        }
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                ZStack {
                    RoundedRectangle(cornerRadius: 14, style: .continuous)
                        .fill(
                            LinearGradient(
                                colors: accentColors.map { $0.opacity(0.2) },
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                        )
                        .frame(width: 54, height: 54)

                    Image(systemName: category.icon)
                        .font(.title2)
                        .foregroundStyle(
                            LinearGradient(colors: accentColors, startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .symbolEffect(.bounce, value: isPressed)
                }

                VStack(alignment: .leading, spacing: 4) {
                    Text(category.title)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    Text(category.subtitle)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)

                    Text("\(category.questions.count) questions")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundStyle(AppTheme.brandPrimary)
                }

                Spacer()

                Image(systemName: "arrow.right.circle.fill")
                    .font(.title2)
                    .foregroundStyle(AppTheme.brandPrimary.opacity(0.85))
            }
            .padding(18)
            .glassCard(cornerRadius: 20)
        }
        .buttonStyle(PressableButtonStyle())
        .simultaneousGesture(
            DragGesture(minimumDistance: 0)
                .onChanged { _ in isPressed = true }
                .onEnded { _ in isPressed = false }
        )
        .accessibilityLabel("\(category.title), \(category.questions.count) questions")
        .accessibilityHint("Double tap to start this quiz")
    }
}

#Preview {
    NavigationStack {
        WelcomeView(categories: SampleQuizData.categories) { _ in }
    }
}
