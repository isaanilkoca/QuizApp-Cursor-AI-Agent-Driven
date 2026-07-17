//
//  SwiftUIInterviewQuestions.swift
//  QuizAppWithCursor
//

import Foundation

enum SwiftUIInterviewQuestions {
    static let all: [Question] = [
        Question(
            text: "Which property wrapper owns local mutable state inside a view?",
            options: ["@Binding", "@State", "@Environment", "@AppStorage"],
            correctIndex: 1,
            explanation: "`@State` is for private view-owned state that SwiftUI stores and updates."
        ),
        Question(
            text: "What is `@Binding` used for?",
            options: [
                "Creating a permanent copy of data",
                "Reading and writing a value owned by a parent",
                "Injecting global singletons",
                "Replacing the view model"
            ],
            correctIndex: 1,
            explanation: "`@Binding` creates a two-way connection to state owned elsewhere, often a parent's `@State`."
        ),
        Question(
            text: "In modern SwiftUI MVVM, what does `@Observable` replace for many view models?",
            options: [
                "Only `@State`",
                "ObservableObject + `@Published` boilerplate",
                "UIKit view controllers",
                "Core Data entities"
            ],
            correctIndex: 1,
            explanation: "`@Observable` (iOS 17+) simplifies change tracking for reference-type view models."
        ),
        Question(
            text: "When should you use `@StateObject` instead of `@ObservedObject`?",
            options: [
                "When the view creates and owns the object",
                "When the object is passed from a parent only",
                "When using structs",
                "When the object is a singleton"
            ],
            correctIndex: 0,
            explanation: "`@StateObject` ensures the object is created once and kept alive for the view's lifetime."
        ),
        Question(
            text: "What does `@Environment(\\.dismiss)` provide?",
            options: [
                "Access to user defaults",
                "A way to dismiss the current presentation",
                "Network session configuration",
                "Automatic navigation pop on app launch"
            ],
            correctIndex: 1,
            explanation: "The dismiss action closes sheets, popovers, or other presented content."
        ),
        Question(
            text: "Why does SwiftUI re-render a view?",
            options: [
                "Only when the app enters foreground",
                "When observed state affecting the view changes",
                "Every second on a timer",
                "Only when using UIKit bridges"
            ],
            correctIndex: 1,
            explanation: "SwiftUI diffing re-evaluates views when their dependencies change."
        ),
        Question(
            text: "What is `@ViewBuilder` used for?",
            options: [
                "Building network requests",
                "Combining multiple child views into one view result",
                "Creating Core Data stacks",
                "Generating app icons"
            ],
            correctIndex: 1,
            explanation: "`@ViewBuilder` enables DSL-style composition of conditional and multiple child views."
        ),
        Question(
            text: "What is the main difference between `List` and `LazyVStack`?",
            options: [
                "`List` cannot scroll",
                "`List` provides platform styling and features like swipe actions",
                "`LazyVStack` is always faster for every use case",
                "There is no difference"
            ],
            correctIndex: 1,
            explanation: "`List` is a higher-level, platform-adaptive container with built-in row behaviors."
        ),
        Question(
            text: "When presenting a modal in SwiftUI, what is `.sheet` typically used for?",
            options: [
                "Permanent navigation",
                "Temporary modal content over the current screen",
                "Replacing the root window",
                "Background fetch only"
            ],
            correctIndex: 1,
            explanation: "`.sheet` presents modal content that the user dismisses to return to the underlying screen."
        ),
        Question(
            text: "What does `.task` do compared to `.onAppear`?",
            options: [
                "It never cancels work",
                "It can run async work and cancel it when the view disappears",
                "It only works in UIKit",
                "It replaces `@State`"
            ],
            correctIndex: 1,
            explanation: "`.task` is ideal for structured async work tied to view lifetime."
        ),
        Question(
            text: "Why use semantic fonts like `.body` and `.headline`?",
            options: [
                "They disable Dynamic Type",
                "They adapt to the user's preferred text size and system styling",
                "They are required for networking",
                "They only work on iPad"
            ],
            correctIndex: 1,
            explanation: "Semantic text styles support accessibility and consistent platform typography."
        ),
        Question(
            text: "What does `NavigationStack` replace from older SwiftUI APIs?",
            options: [
                "TabView",
                "NavigationView-based navigation patterns",
                "ScrollView",
                "GeometryReader"
            ],
            correctIndex: 1,
            explanation: "`NavigationStack` is the modern programmatic navigation container."
        ),
        Question(
            text: "What is a common interview answer for where business logic should live in SwiftUI MVVM?",
            options: [
                "Directly inside every View body",
                "In the ViewModel, not the View",
                "Only in AppDelegate",
                "Only in Asset Catalogs"
            ],
            correctIndex: 1,
            explanation: "Views should stay declarative; view models hold presentation logic and state transformations."
        ),
        Question(
            text: "What does `.animation(_:value:)` help prevent?",
            options: [
                "All view updates",
                "Animating unrelated state changes",
                "Using SF Symbols",
                "Dark Mode support"
            ],
            correctIndex: 1,
            explanation: "Scoping animation to a specific value avoids animating every state change in the view."
        ),
        Question(
            text: "Why is `ForEach` often used with `Identifiable` data?",
            options: [
                "To force random ordering",
                "So SwiftUI can track identity across updates efficiently",
                "To disable scrolling",
                "To remove accessibility"
            ],
            correctIndex: 1,
            explanation: "Stable identity helps diffing and prevents incorrect row reuse or animation glitches."
        ),
        Question(
            text: "What is `@FocusState` used for?",
            options: [
                "Managing keyboard focus for input fields",
                "Tracking GPS location",
                "Handling push notifications",
                "Storing images on disk"
            ],
            correctIndex: 0,
            explanation: "`@FocusState` binds and controls which field is focused in a form."
        ),
        Question(
            text: "What is a preview in SwiftUI primarily for?",
            options: [
                "App Store submission",
                "Rapid UI iteration and visual testing during development",
                "Production crash reporting",
                "Database migrations"
            ],
            correctIndex: 1,
            explanation: "Previews let developers validate layouts quickly without full app runs."
        ),
        Question(
            text: "What does `.refreshable` add to a scrollable view?",
            options: [
                "Automatic dark mode",
                "Pull-to-refresh async action support",
                "Core Data syncing",
                "Force landscape orientation"
            ],
            correctIndex: 1,
            explanation: "`.refreshable` integrates the standard pull-to-refresh interaction with async work."
        ),
        Question(
            text: "Why might you use `@EnvironmentObject`?",
            options: [
                "To inject shared observable data down the view hierarchy",
                "To store images in memory only",
                "To replace Codable models",
                "To disable navigation"
            ],
            correctIndex: 0,
            explanation: "Environment objects propagate shared app state without passing parameters manually at every level."
        ),
        Question(
            text: "In interviews, why is SwiftUI's declarative style important to explain clearly?",
            options: [
                "It shows you describe UI as a function of state, not manual imperative updates",
                "It proves you never use view models",
                "It means UIKit is obsolete in all apps",
                "It removes the need for testing"
            ],
            correctIndex: 0,
            explanation: "Interviewers want to hear that you understand state-driven UI and separation from imperative layout code."
        )
    ]
}
