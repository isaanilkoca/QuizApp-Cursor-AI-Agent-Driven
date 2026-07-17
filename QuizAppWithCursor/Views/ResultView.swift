//
//  ResultView.swift
//  QuizAppWithCursor
//

import SwiftUI

struct ResultView: View {
    let categoryTitle: String
    let score: Int
    let total: Int
    let percentage: Int
    let onPlayAgain: () -> Void
    let onChooseTopic: () -> Void

    @State private var appeared = false
    @State private var displayedScore = 0
    @State private var celebrate = false

    var body: some View {
        ZStack {
            AnimatedBackground()

            ScrollView {
                VStack(spacing: 28) {
                    resultHeader
                        .staggeredAppear(index: 0, appeared: appeared)

                    scoreCard
                        .staggeredAppear(index: 1, appeared: appeared)

                    message
                        .staggeredAppear(index: 2, appeared: appeared)

                    actionButtons
                        .staggeredAppear(index: 3, appeared: appeared)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 32)
            }
        }
        .navigationBarBackButtonHidden(true)
        .onAppear {
            appeared = true
            animateScore()
            withAnimation(AppTheme.spring.delay(0.5)) {
                celebrate = true
            }
        }
    }

    private var resultHeader: some View {
        VStack(spacing: 14) {
            ZStack {
                ForEach(0..<6, id: \.self) { index in
                    Circle()
                        .fill(resultColor.opacity(0.18))
                        .frame(width: 10, height: 10)
                        .offset(y: celebrate ? -56 : -20)
                        .rotationEffect(.degrees(Double(index) * 60))
                        .opacity(celebrate ? 0 : 1)
                        .animation(
                            AppTheme.spring.delay(Double(index) * 0.05),
                            value: celebrate
                        )
                }

                Image(systemName: resultIcon)
                    .font(.system(size: 56))
                    .foregroundStyle(resultColor)
                    .symbolEffect(.bounce, value: appeared)
                    .scaleEffect(appeared ? 1 : 0.3)
                    .animation(AppTheme.spring.delay(0.15), value: appeared)
            }
            .frame(height: 70)
            .accessibilityHidden(true)

            Text("Session Complete!")
                .font(.system(size: 28, weight: .bold, design: .rounded))
                .multilineTextAlignment(.center)

            Text(categoryTitle)
                .font(.title3)
                .foregroundStyle(AppTheme.brandPrimary)
                .fontWeight(.semibold)
        }
    }

    private var scoreCard: some View {
        VStack(spacing: 20) {
            AnimatedScoreRing(percentage: percentage, color: resultColor)

            HStack(spacing: 6) {
                Text("\(displayedScore)")
                    .font(.system(size: 44, weight: .bold, design: .rounded))
                    .foregroundStyle(resultColor)
                    .contentTransition(.numericText())

                Text("/ \(total)")
                    .font(.title)
                    .foregroundStyle(.secondary)
            }
            .accessibilityLabel("Score: \(score) out of \(total)")
        }
        .padding(.vertical, 28)
        .frame(maxWidth: .infinity)
        .glassCard(cornerRadius: 24)
    }

    private var message: some View {
        Text(resultMessage)
            .font(.body)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
            .padding(.horizontal, 12)
            .padding(.vertical, 16)
            .glassCard(cornerRadius: 16)
    }

    private var actionButtons: some View {
        VStack(spacing: 12) {
            PrimaryActionButton("Practice Again", systemImage: "arrow.clockwise") {
                onPlayAgain()
            }

            Button {
                onChooseTopic()
            } label: {
                Label("Choose Another Topic", systemImage: "square.grid.2x2")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 16)
            }
            .buttonStyle(PressableButtonStyle())
            .background(AppTheme.cardBackground)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .strokeBorder(AppTheme.brandPrimary.opacity(0.2), lineWidth: 1)
            }

            CloseAppButton(style: .bordered)
        }
    }

    private var resultIcon: String {
        switch percentage {
        case 80...: "star.circle.fill"
        case 50..<80: "hand.thumbsup.circle.fill"
        default: "arrow.up.circle.fill"
        }
    }

    private var resultColor: Color {
        switch percentage {
        case 80...: .green
        case 50..<80: .orange
        default: .red
        }
    }

    private var resultMessage: String {
        switch percentage {
        case 100: "Perfect score on QuickyInterview! You're interview-ready on this topic."
        case 80..<100: "Strong performance — review missed explanations and you'll be in great shape."
        case 50..<80: "Solid start for a new grad. Re-read the explanations and practice again."
        default: "Keep practicing — interview prep is about repetition and understanding the why."
        }
    }

    private func animateScore() {
        guard score > 0 else {
            displayedScore = 0
            return
        }

        for step in 0...score {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.04 * Double(step)) {
                withAnimation(AppTheme.snappy) {
                    displayedScore = step
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        ResultView(
            categoryTitle: "Swift",
            score: 16,
            total: 20,
            percentage: 80,
            onPlayAgain: {},
            onChooseTopic: {}
        )
    }
}
