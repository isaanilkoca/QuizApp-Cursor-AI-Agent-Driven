//
//  CloseAppButton.swift
//  QuizAppWithCursor
//

import SwiftUI

struct CloseAppButton: View {
    var style: Style = .toolbar

    enum Style {
        case toolbar
        case prominent
        case bordered
    }

    var body: some View {
        switch style {
        case .toolbar:
            Button("Close App", systemImage: "power") {
                AppCloser.close()
            }
            .accessibilityLabel("Close app")

        case .prominent:
            Button("Close App", systemImage: "power") {
                AppCloser.close()
            }
            .buttonStyle(.borderedProminent)
            .tint(.red)
            .frame(maxWidth: .infinity)
            .accessibilityLabel("Close app")

        case .bordered:
            Button("Close App", systemImage: "power") {
                AppCloser.close()
            }
            .buttonStyle(.bordered)
            .tint(.red)
            .frame(maxWidth: .infinity)
            .accessibilityLabel("Close app")
        }
    }
}

#Preview {
    VStack(spacing: 16) {
        CloseAppButton(style: .toolbar)
        CloseAppButton(style: .prominent)
        CloseAppButton(style: .bordered)
    }
    .padding()
}
