//
//  QuizViewModel.swift
//  QuizAppWithCursor
//

import Foundation
import Observation

@Observable
final class QuizViewModel {

    // MARK: - Published State

    private(set) var phase: QuizPhase = .welcome
    private(set) var selectedCategory: QuizCategory?
    private(set) var currentQuestionIndex = 0
    private(set) var score = 0
    private(set) var selectedAnswerIndex: Int?
    private(set) var hasAnswered = false

    let categories: [QuizCategory]

    // MARK: - Computed Properties

    var currentQuestion: Question? {
        guard let category = selectedCategory,
              currentQuestionIndex < category.questions.count else { return nil }
        return category.questions[currentQuestionIndex]
    }

    var totalQuestions: Int {
        selectedCategory?.questions.count ?? 0
    }

    var progress: Double {
        guard totalQuestions > 0 else { return 0 }
        return Double(currentQuestionIndex) / Double(totalQuestions)
    }

    var scorePercentage: Int {
        guard totalQuestions > 0 else { return 0 }
        return Int((Double(score) / Double(totalQuestions)) * 100)
    }

    var isLastQuestion: Bool {
        currentQuestionIndex >= totalQuestions - 1
    }

    // MARK: - Init

    init(categories: [QuizCategory] = SampleQuizData.categories) {
        self.categories = categories
    }

    // MARK: - Actions

    func selectCategory(_ category: QuizCategory) {
        selectedCategory = category
        resetQuizState()
        phase = .playing
    }

    func selectAnswer(at index: Int) {
        guard !hasAnswered, let question = currentQuestion else { return }

        selectedAnswerIndex = index
        hasAnswered = true

        if index == question.correctIndex {
            score += 1
        }
    }

    func goToNextQuestion() {
        guard hasAnswered else { return }

        if isLastQuestion {
            phase = .finished
        } else {
            currentQuestionIndex += 1
            selectedAnswerIndex = nil
            hasAnswered = false
        }
    }

    func restartQuiz() {
        resetQuizState()
        phase = .playing
    }

    func returnToWelcome() {
        selectedCategory = nil
        resetQuizState()
        phase = .welcome
    }

    // MARK: - Helpers

    func answerState(for index: Int) -> AnswerState {
        guard hasAnswered, let question = currentQuestion else {
            return selectedAnswerIndex == index ? .selected : .neutral
        }

        if index == question.correctIndex {
            return .correct
        }
        if index == selectedAnswerIndex {
            return .incorrect
        }
        return .neutral
    }

    private func resetQuizState() {
        currentQuestionIndex = 0
        score = 0
        selectedAnswerIndex = nil
        hasAnswered = false
    }
}

enum AnswerState {
    case neutral
    case selected
    case correct
    case incorrect
}
