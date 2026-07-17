//
//  ContentView.swift
//  QuizAppWithCursor
//
//  Created by İsa Anıl Koca on 18.07.2026.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = QuizViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                switch viewModel.phase {
                case .welcome:
                    WelcomeView(categories: viewModel.categories) { category in
                        withAnimation(AppTheme.spring) {
                            viewModel.selectCategory(category)
                        }
                    }
                    .transition(phaseTransition)

                case .playing:
                    QuizView(viewModel: viewModel) {
                        withAnimation(AppTheme.spring) {
                            viewModel.returnToWelcome()
                        }
                    }
                    .transition(phaseTransition)

                case .finished:
                    ResultView(
                        categoryTitle: viewModel.selectedCategory?.title ?? "Quiz",
                        score: viewModel.score,
                        total: viewModel.totalQuestions,
                        percentage: viewModel.scorePercentage,
                        onPlayAgain: {
                            withAnimation(AppTheme.spring) {
                                viewModel.restartQuiz()
                            }
                        },
                        onChooseTopic: {
                            withAnimation(AppTheme.spring) {
                                viewModel.returnToWelcome()
                            }
                        }
                    )
                    .transition(phaseTransition)
                }
            }
            .animation(AppTheme.spring, value: viewModel.phase)
        }
        .tint(AppTheme.brandPrimary)
    }

    private var phaseTransition: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .trailing).combined(with: .opacity),
            removal: .move(edge: .leading).combined(with: .opacity)
        )
    }
}

#Preview {
    ContentView()
}
