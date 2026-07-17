//
//  QuizView.swift
//  QuizAppWithCursor
//

import SwiftUI

struct QuizView: View {
    let viewModel: QuizViewModel
    let onExit: () -> Void

    @State private var questionAppeared = false
    @State private var answersAppeared = false

    private let optionLetters = ["A", "B", "C", "D"]

    var body: some View {
        ZStack {
            AnimatedBackground()

            VStack(spacing: 0) {
                if let question = viewModel.currentQuestion {
                    ScrollView {
                        VStack(alignment: .leading, spacing: 24) {
                            ProgressBarView(
                                progress: viewModel.progress,
                                current: viewModel.currentQuestionIndex + 1,
                                total: viewModel.totalQuestions
                            )
                            .opacity(questionAppeared ? 1 : 0)
                            .offset(y: questionAppeared ? 0 : -16)

                            questionCard(question)
                                .id(viewModel.currentQuestionIndex)
                                .transition(
                                    .asymmetric(
                                        insertion: .move(edge: .trailing).combined(with: .opacity),
                                        removal: .move(edge: .leading).combined(with: .opacity)
                                    )
                                )

                            VStack(spacing: 12) {
                                ForEach(Array(question.options.enumerated()), id: \.offset) { index, option in
                                    AnswerButton(
                                        text: option,
                                        letter: optionLetters[index],
                                        state: viewModel.answerState(for: index),
                                        index: index
                                    ) {
                                        withAnimation(AppTheme.quickSpring) {
                                            viewModel.selectAnswer(at: index)
                                        }
                                    }
                                    .opacity(answersAppeared ? 1 : 0)
                                    .offset(x: answersAppeared ? 0 : 40)
                                    .animation(
                                        AppTheme.spring.delay(Double(index) * 0.06),
                                        value: answersAppeared
                                    )
                                }
                            }

                            if viewModel.hasAnswered {
                                explanationCard(for: question)
                                    .transition(
                                        .asymmetric(
                                            insertion: .scale(scale: 0.92).combined(with: .opacity),
                                            removal: .opacity
                                        )
                                    )
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.top, 16)
                        .padding(.bottom, 24)
                    }

                    bottomBar
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Leave", systemImage: "chevron.left") {
                    onExit()
                }
                .accessibilityLabel("Leave quiz and return to topics")
            }

            ToolbarItem(placement: .principal) {
                Text(viewModel.selectedCategory?.title ?? "Quiz")
                    .font(.headline)
            }

            ToolbarItem(placement: .topBarTrailing) {
                CloseAppButton(style: .toolbar)
            }
        }
        .animation(AppTheme.spring, value: viewModel.currentQuestionIndex)
        .animation(AppTheme.spring, value: viewModel.hasAnswered)
        .onAppear { animateQuestionIn() }
        .onChange(of: viewModel.currentQuestionIndex) { _, _ in
            animateQuestionIn()
        }
    }

    private func questionCard(_ question: Question) -> some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Interview Question", systemImage: "text.quote")
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundStyle(AppTheme.brandPrimary)

            Text(question.text)
                .font(.title3)
                .fontWeight(.semibold)
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityAddTraits(.isHeader)
        }
        .padding(20)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassCard(cornerRadius: 20)
        .opacity(questionAppeared ? 1 : 0)
        .offset(y: questionAppeared ? 0 : 20)
    }

    private func explanationCard(for question: Question) -> some View {
        HStack(alignment: .top, spacing: 14) {
            Image(systemName: "lightbulb.max.fill")
                .font(.title2)
                .foregroundStyle(.yellow)
                .symbolEffect(.pulse, options: .repeating.speed(0.4))
                .accessibilityHidden(true)

            VStack(alignment: .leading, spacing: 6) {
                Text("Why this answer?")
                    .font(.subheadline)
                    .fontWeight(.bold)

                Text(question.explanation)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(18)
        .frame(maxWidth: .infinity, alignment: .leading)
        .glassCard(cornerRadius: 18)
    }

    private var bottomBar: some View {
        VStack(spacing: 0) {
            Divider().opacity(0.5)

            PrimaryActionButton(
                viewModel.isLastQuestion ? "See Results" : "Next Question",
                systemImage: viewModel.isLastQuestion ? "flag.checkered" : "arrow.right",
                isEnabled: viewModel.hasAnswered
            ) {
                withAnimation(AppTheme.spring) {
                    viewModel.goToNextQuestion()
                }
            }
            .padding(.horizontal, 20)
            .padding(.vertical, 14)
        }
        .background(.ultraThinMaterial)
    }

    private func animateQuestionIn() {
        questionAppeared = false
        answersAppeared = false

        withAnimation(AppTheme.spring) {
            questionAppeared = true
        }
        withAnimation(AppTheme.spring.delay(0.12)) {
            answersAppeared = true
        }
    }
}

#Preview {
    NavigationStack {
        QuizView(viewModel: {
            let vm = QuizViewModel()
            vm.selectCategory(SampleQuizData.categories[0])
            return vm
        }(), onExit: {})
    }
}
