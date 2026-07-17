//
//  ProgressBarView.swift
//  QuizAppWithCursor
//

import SwiftUI

struct ProgressBarView: View {
    let progress: Double
    let current: Int
    let total: Int

    @State private var shimmer = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Label("Question \(current) of \(total)", systemImage: "list.number")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundStyle(.secondary)
                    .contentTransition(.numericText())

                Spacer()

                Text("\(Int(progress * 100))%")
                    .font(.caption)
                    .fontWeight(.bold)
                    .foregroundStyle(AppTheme.brandPrimary)
                    .contentTransition(.numericText())
            }

            GeometryReader { geometry in
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(Color(.systemGray5))
                        .frame(height: 10)

                    Capsule()
                        .fill(AppTheme.brandGradient)
                        .frame(width: max(geometry.size.width * progress, progress > 0 ? 10 : 0), height: 10)
                        .overlay {
                            Capsule()
                                .fill(
                                    LinearGradient(
                                        colors: [.clear, .white.opacity(0.35), .clear],
                                        startPoint: shimmer ? .leading : .trailing,
                                        endPoint: shimmer ? .trailing : .leading
                                    )
                                )
                                .frame(height: 10)
                        }
                        .animation(AppTheme.spring, value: progress)
                }
            }
            .frame(height: 10)
            .accessibilityElement(children: .ignore)
            .accessibilityLabel("Progress")
            .accessibilityValue("\(Int(progress * 100)) percent complete")
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 1.6).repeatForever(autoreverses: true)) {
                shimmer = true
            }
        }
    }
}

#Preview {
    ProgressBarView(progress: 0.4, current: 8, total: 20)
        .padding()
}
