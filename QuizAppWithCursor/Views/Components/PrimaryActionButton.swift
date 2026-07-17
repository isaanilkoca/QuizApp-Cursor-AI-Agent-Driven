//
//  PrimaryActionButton.swift
//  QuizAppWithCursor
//

import SwiftUI

struct PrimaryActionButton: View {
    let title: String
    let systemImage: String?
    let isEnabled: Bool
    let action: () -> Void

    init(
        _ title: String,
        systemImage: String? = nil,
        isEnabled: Bool = true,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.systemImage = systemImage
        self.isEnabled = isEnabled
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 8) {
                if let systemImage {
                    Image(systemName: systemImage)
                        .symbolEffect(.bounce, value: isEnabled)
                }
                Text(title)
                    .fontWeight(.semibold)
            }
            .font(.headline)
            .frame(maxWidth: .infinity)
            .padding(.vertical, 16)
            .background {
                if isEnabled {
                    AppTheme.brandGradient
                } else {
                    Color(.systemGray4)
                }
            }
            .foregroundStyle(.white)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .shadow(color: isEnabled ? AppTheme.brandPrimary.opacity(0.35) : .clear, radius: 12, y: 6)
        }
        .buttonStyle(PressableButtonStyle())
        .disabled(!isEnabled)
        .animation(AppTheme.quickSpring, value: isEnabled)
        .accessibilityHint(isEnabled ? title : "Select an answer first")
    }
}

#Preview {
    VStack(spacing: 16) {
        PrimaryActionButton("Next Question", systemImage: "arrow.right", isEnabled: true) {}
        PrimaryActionButton("Next Question", isEnabled: false) {}
    }
    .padding()
}
