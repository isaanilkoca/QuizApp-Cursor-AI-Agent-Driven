//
//  ArchitectureInterviewQuestions.swift
//  QuizAppWithCursor
//

import Foundation

enum ArchitectureInterviewQuestions {
    static let all: [Question] = [
        Question(
            text: "What does MVVM stand for?",
            options: [
                "Model View ViewManager",
                "Model View ViewModel",
                "Module View ViewModel",
                "Model Visual ViewMap"
            ],
            correctIndex: 1,
            explanation: "MVVM separates UI (View), presentation logic (ViewModel), and data/domain models (Model)."
        ),
        Question(
            text: "In MVVM, what is the primary responsibility of the View?",
            options: [
                "Perform networking directly",
                "Display UI and forward user actions",
                "Own database schema",
                "Write unit tests for services"
            ],
            correctIndex: 1,
            explanation: "Views should remain thin: layout, styling, and sending user intents to the view model."
        ),
        Question(
            text: "In MVVM, what should the ViewModel expose to the View?",
            options: [
                "Only private implementation details",
                "Presentation state and actions the UI can bind to",
                "Raw SQL queries",
                "Storyboard segue identifiers"
            ],
            correctIndex: 1,
            explanation: "The view model transforms model data into UI-ready state and exposes commands/events."
        ),
        Question(
            text: "Why is MVVM popular with SwiftUI?",
            options: [
                "SwiftUI forbids any other pattern",
                "SwiftUI's reactive/state-driven UI maps naturally to observable view models",
                "It removes the need for models",
                "It replaces Combine entirely"
            ],
            correctIndex: 1,
            explanation: "Observable view models fit SwiftUI's data flow and help keep views declarative."
        ),
        Question(
            text: "How does MVVM differ from classic MVC in iOS?",
            options: [
                "MVC always has no models",
                "MVVM introduces a presentation layer between View and Model",
                "MVC cannot use Swift",
                "MVVM removes views completely"
            ],
            correctIndex: 1,
            explanation: "MVVM reduces massive view controllers by moving presentation logic into view models."
        ),
        Question(
            text: "What is separation of concerns?",
            options: [
                "Putting all code in one file for speed",
                "Dividing responsibilities so each layer has one clear job",
                "Avoiding protocols",
                "Using only singletons"
            ],
            correctIndex: 1,
            explanation: "Good architecture makes code easier to test, change, and reason about."
        ),
        Question(
            text: "Why inject dependencies into a ViewModel instead of creating them inside?",
            options: [
                "To increase coupling",
                "To improve testability and flexibility",
                "To prevent previews",
                "To avoid using protocols"
            ],
            correctIndex: 1,
            explanation: "Dependency injection lets you swap real services with mocks in tests and different environments."
        ),
        Question(
            text: "What is the repository pattern often used for?",
            options: [
                "Drawing UI gradients",
                "Abstracting data access behind a clean interface",
                "Replacing all view models",
                "Managing app icons"
            ],
            correctIndex: 1,
            explanation: "Repositories hide whether data comes from network, cache, or database."
        ),
        Question(
            text: "What is a common data flow in MVVM + SwiftUI?",
            options: [
                "View → ViewModel → Model/Service → ViewModel → View",
                "View → Database → View only",
                "Model → View with no intermediate layer",
                "AppDelegate → Storyboard only"
            ],
            correctIndex: 0,
            explanation: "User actions go to the view model, which updates state/models and drives UI refresh."
        ),
        Question(
            text: "Why unit test ViewModels in interview projects?",
            options: [
                "Views are impossible to test",
                "ViewModels contain testable business/presentation logic without UIKit/SwiftUI rendering",
                "Apple requires it for TestFlight",
                "Models cannot be tested"
            ],
            correctIndex: 1,
            explanation: "Testing view models validates logic independently from layout and device rendering."
        ),
        Question(
            text: "What problem does the Coordinator pattern solve?",
            options: [
                "JSON parsing only",
                "Centralizing navigation flow away from views/view models",
                "Replacing all models",
                "Removing async/await"
            ],
            correctIndex: 1,
            explanation: "Coordinators decouple screen flow from individual screens, useful in larger UIKit or hybrid apps."
        ),
        Question(
            text: "What is a single source of truth?",
            options: [
                "Duplicating state in many views",
                "One authoritative place owns a piece of app state",
                "Using global variables everywhere",
                "Hard-coding UI in AppDelegate"
            ],
            correctIndex: 1,
            explanation: "Central state ownership prevents inconsistent UI and hard-to-debug synchronization bugs."
        ),
        Question(
            text: "In Clean Architecture, which layer should not depend on UI frameworks?",
            options: [
                "Presentation layer only",
                "Domain/business logic layer",
                "Launch screen storyboard",
                "Asset catalog"
            ],
            correctIndex: 1,
            explanation: "Domain logic should be framework-agnostic so it remains reusable and testable."
        ),
        Question(
            text: "What is VIPER compared to MVVM?",
            options: [
                "A smaller pattern with fewer layers",
                "A more granular architecture splitting responsibilities further",
                "A SwiftUI-only pattern",
                "A replacement for Codable"
            ],
            correctIndex: 1,
            explanation: "VIPER divides View, Interactor, Presenter, Entity, and Router — common in larger UIKit codebases."
        ),
        Question(
            text: "What belongs in the Model layer?",
            options: [
                "Button colors and fonts",
                "Domain/data structures and business rules/data representation",
                "Navigation bar titles only",
                "Alert button labels"
            ],
            correctIndex: 1,
            explanation: "Models represent your app's data and core domain concepts, not UI formatting."
        ),
        Question(
            text: "Why avoid putting networking code directly in SwiftUI views?",
            options: [
                "SwiftUI views cannot compile with URLSession",
                "It couples UI to infrastructure and makes testing harder",
                "Networking is deprecated",
                "Views cannot import Foundation"
            ],
            correctIndex: 1,
            explanation: "Interviewers expect infrastructure concerns in services/repositories used by view models."
        ),
        Question(
            text: "What is a service layer?",
            options: [
                "A folder for image assets",
                "Components that perform specific tasks like API calls or location updates",
                "A replacement for SwiftUI previews",
                "Only push notification handlers"
            ],
            correctIndex: 1,
            explanation: "Services encapsulate side effects and external integrations behind focused APIs."
        ),
        Question(
            text: "What is a good sign of a well-designed ViewModel API?",
            options: [
                "It exposes every private helper publicly",
                "It exposes only what the view needs, with clear inputs/outputs",
                "It imports SwiftUI in every file",
                "It stores UIView references"
            ],
            correctIndex: 1,
            explanation: "Minimal, intention-revealing APIs make views simpler and view models easier to test."
        ),
        Question(
            text: "What trade-off might MVVM have in small apps?",
            options: [
                "It always makes apps slower",
                "Extra layers can feel like over-engineering for trivial screens",
                "It prevents using SwiftUI",
                "It bans structs"
            ],
            correctIndex: 1,
            explanation: "Good interview answers acknowledge trade-offs: MVVM shines as complexity grows."
        ),
        Question(
            text: "As a new graduate, how should you explain why you chose MVVM in a portfolio app?",
            options: [
                "Because it is the only allowed pattern",
                "Because it separates UI from logic, improves testability, and matches SwiftUI state flow",
                "Because it removes the need for models",
                "Because it avoids learning Swift fundamentals"
            ],
            correctIndex: 1,
            explanation: "Interviewers want practical reasoning: maintainability, clarity, and alignment with SwiftUI."
        )
    ]
}
