//
//  QuizCategory.swift
//  QuizAppWithCursor
//

import Foundation

struct QuizCategory: Identifiable, Equatable {
    let id = UUID()
    let title: String
    let subtitle: String
    let icon: String
    let questions: [Question]
}
