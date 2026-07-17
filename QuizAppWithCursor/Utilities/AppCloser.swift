//
//  AppCloser.swift
//  QuizAppWithCursor
//

import UIKit

enum AppCloser {
    static func close() {
        UIApplication.shared.perform(#selector(NSXPCConnection.suspend))
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            exit(0)
        }
    }
}
