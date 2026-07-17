//
//  Question.swift
//  QuizAppWithCursor
//

import Foundation

struct Question: Identifiable, Equatable {
    let id = UUID()
    let text: String
    let options: [String]
    let correctIndex: Int
    let explanation: String

    var correctAnswer: String {
        options[correctIndex]
    }
}
