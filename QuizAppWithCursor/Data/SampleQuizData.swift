//
//  SampleQuizData.swift
//  QuizAppWithCursor
//

import Foundation

enum SampleQuizData {
    static let categories: [QuizCategory] = [
        QuizCategory(
            title: "Swift",
            subtitle: "Language fundamentals for iOS interviews",
            icon: "swift",
            questions: SwiftInterviewQuestions.all
        ),
        QuizCategory(
            title: "SwiftUI",
            subtitle: "Declarative UI questions new grads get asked",
            icon: "rectangle.3.group",
            questions: SwiftUIInterviewQuestions.all
        ),
        QuizCategory(
            title: "Architecture & MVVM",
            subtitle: "Patterns, layering, and interview reasoning",
            icon: "building.columns",
            questions: ArchitectureInterviewQuestions.all
        )
    ]
}
