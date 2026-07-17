//
//  AnswerButton.swift
//  QuizAppWithCursor
//

import SwiftUI

struct AnswerButton: View {
    let text: String
    let letter: String
    let state: AnswerState
    let index: Int
    let action: () -> Void

    init(
        text: String,
        letter: String,
        state: AnswerState,
        index: Int = 0,
        action: @escaping () -> Void
    ) {
        self.text = text
        self.letter = letter
        self.state = state
        self.index = index
        self.action = action
    }

    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Text(letter)
                    .font(.headline)
                    .fontWeight(.bold)
                    .frame(width: 38, height: 38)
                    .background(letterBackground)
                    .foregroundStyle(letterForeground)
                    .clipShape(Circle())
                    .scaleEffect(state == .selected ? 1.08 : 1)

                Text(text)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)

                trailingIcon
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 15)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
            .overlay {
                RoundedRectangle(cornerRadius: 16, style: .continuous)
                    .strokeBorder(borderStyle, lineWidth: borderWidth)
            }
            .shadow(color: shadowColor, radius: state == .neutral ? 0 : 8, y: 4)
        }
        .buttonStyle(PressableButtonStyle())
        .disabled(state == .correct || state == .incorrect)
        .animation(AppTheme.quickSpring, value: state)
        .accessibilityLabel("Answer \(letter), \(text)")
        .accessibilityAddTraits(state == .selected ? .isSelected : [])
    }

    @ViewBuilder
    private var trailingIcon: some View {
        switch state {
        case .correct:
            Image(systemName: "checkmark.circle.fill")
                .foregroundStyle(.green)
                .font(.title3)
                .symbolEffect(.bounce, value: state)
                .transition(.scale.combined(with: .opacity))
        case .incorrect:
            Image(systemName: "xmark.circle.fill")
                .foregroundStyle(.red)
                .font(.title3)
                .symbolEffect(.bounce, value: state)
                .transition(.scale.combined(with: .opacity))
        default:
            EmptyView()
        }
    }

    private var backgroundColor: Color {
        switch state {
        case .neutral, .selected:
            AppTheme.cardBackground
        case .correct:
            Color.green.opacity(0.14)
        case .incorrect:
            Color.red.opacity(0.14)
        }
    }

    private var borderStyle: AnyShapeStyle {
        switch state {
        case .neutral:
            AnyShapeStyle(Color(.separator).opacity(0.6))
        case .selected:
            AnyShapeStyle(AppTheme.brandGradient)
        case .correct:
            AnyShapeStyle(Color.green)
        case .incorrect:
            AnyShapeStyle(Color.red)
        }
    }

    private var borderWidth: CGFloat {
        state == .neutral ? 1 : 2
    }

    private var shadowColor: Color {
        switch state {
        case .correct: .green.opacity(0.25)
        case .incorrect: .red.opacity(0.25)
        case .selected: AppTheme.brandPrimary.opacity(0.2)
        case .neutral: .clear
        }
    }

    private var letterBackground: some ShapeStyle {
        switch state {
        case .neutral:
            AnyShapeStyle(Color(.systemGray5))
        case .selected:
            AnyShapeStyle(AppTheme.brandGradient)
        case .correct:
            AnyShapeStyle(Color.green)
        case .incorrect:
            AnyShapeStyle(Color.red)
        }
    }

    private var letterForeground: Color {
        switch state {
        case .neutral:
            .primary
        case .selected, .correct, .incorrect:
            .white
        }
    }
}

#Preview {
    VStack(spacing: 12) {
        AnswerButton(text: "A neutral option", letter: "A", state: .neutral, index: 0) {}
        AnswerButton(text: "Selected option", letter: "B", state: .selected, index: 1) {}
        AnswerButton(text: "Correct answer", letter: "C", state: .correct, index: 2) {}
        AnswerButton(text: "Wrong answer", letter: "D", state: .incorrect, index: 3) {}
    }
    .padding()
}
