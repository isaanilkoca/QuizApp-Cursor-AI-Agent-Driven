//
//  SwiftInterviewQuestions.swift
//  QuizAppWithCursor
//

import Foundation

enum SwiftInterviewQuestions {
    static let all: [Question] = [
        Question(
            text: "What is the key difference between `let` and `var`?",
            options: [
                "`let` is for classes, `var` is for structs",
                "`let` declares a constant, `var` declares a variable",
                "`let` is thread-safe, `var` is not",
                "There is no difference"
            ],
            correctIndex: 1,
            explanation: "Use `let` when a value won't be reassigned. Use `var` when it may change."
        ),
        Question(
            text: "What happens when you assign a struct instance to a new variable?",
            options: [
                "Both variables share the same instance",
                "A copy of the struct is created",
                "The original becomes nil",
                "A retain cycle is created"
            ],
            correctIndex: 1,
            explanation: "Structs are value types — assignment creates an independent copy."
        ),
        Question(
            text: "Which statement about classes in Swift is correct?",
            options: [
                "Classes are value types stored on the stack",
                "Classes are reference types stored on the heap",
                "Classes cannot inherit from other classes",
                "Classes cannot conform to protocols"
            ],
            correctIndex: 1,
            explanation: "Classes are reference types. Multiple variables can refer to the same instance."
        ),
        Question(
            text: "What does optional chaining (`?.`) return if the optional is nil?",
            options: ["Crashing error", "nil", "false", "An empty string"],
            correctIndex: 1,
            explanation: "Optional chaining short-circuits and returns nil instead of force-unwrapping."
        ),
        Question(
            text: "When should you prefer `guard let` over `if let`?",
            options: [
                "When you need the unwrapped value only inside a nested block",
                "When you want early exit if unwrapping fails",
                "When the optional is implicitly unwrapped",
                "When working with enums only"
            ],
            correctIndex: 1,
            explanation: "`guard let` is ideal for validation at the top of a scope with early return on failure."
        ),
        Question(
            text: "What keyword marks a function that can throw errors?",
            options: ["throw", "throws", "try", "catch"],
            correctIndex: 1,
            explanation: "A throwing function is declared with `throws` in its signature."
        ),
        Question(
            text: "What does `@escaping` mean on a closure parameter?",
            options: [
                "The closure runs on a background thread",
                "The closure may be stored and called after the function returns",
                "The closure cannot capture self",
                "The closure is automatically cancelled"
            ],
            correctIndex: 1,
            explanation: "Escaping closures outlive the function call, e.g. async callbacks or stored properties."
        ),
        Question(
            text: "What is ARC responsible for in Swift?",
            options: [
                "Compiling Swift to machine code",
                "Managing memory for class instances",
                "Encrypting network requests",
                "Layout of SwiftUI views"
            ],
            correctIndex: 1,
            explanation: "Automatic Reference Counting tracks class instances and frees memory when count reaches zero."
        ),
        Question(
            text: "When should you use `weak` instead of `unowned`?",
            options: [
                "When the referenced object can become nil during lifetime",
                "When the referenced object is always non-nil",
                "When working with structs",
                "When the closure is non-escaping"
            ],
            correctIndex: 0,
            explanation: "`weak` is an optional reference for when the other object may be deallocated first."
        ),
        Question(
            text: "What is a retain cycle?",
            options: [
                "Two structs copying each other",
                "Two reference types keeping each other alive via strong references",
                "A compiler optimization",
                "A type-checking error"
            ],
            correctIndex: 1,
            explanation: "Strong reference cycles prevent deallocation. Break them with `weak` or `unowned`."
        ),
        Question(
            text: "What is protocol-oriented programming in Swift?",
            options: [
                "Using only classes for all abstractions",
                "Designing around protocols and protocol extensions",
                "Avoiding generics entirely",
                "Replacing structs with enums"
            ],
            correctIndex: 1,
            explanation: "Swift encourages shared behavior through protocols and default implementations in extensions."
        ),
        Question(
            text: "What is the default access level in Swift?",
            options: ["private", "fileprivate", "internal", "public"],
            correctIndex: 2,
            explanation: "`internal` is the default — accessible anywhere within the same module."
        ),
        Question(
            text: "What does the `defer` statement do?",
            options: [
                "Delays app launch",
                "Runs code just before leaving the current scope",
                "Defers compilation to runtime",
                "Creates a lazy property"
            ],
            correctIndex: 1,
            explanation: "`defer` schedules cleanup code to run when the scope exits, regardless of how it exits."
        ),
        Question(
            text: "Why must struct methods that modify properties be marked `mutating`?",
            options: [
                "Because structs are reference types",
                "Because structs are value types and mutation changes `self`",
                "Because structs cannot have methods",
                "Because the compiler requires it for classes too"
            ],
            correctIndex: 1,
            explanation: "Mutating methods on structs can modify the instance, which is a value type."
        ),
        Question(
            text: "What is a `lazy` stored property?",
            options: [
                "A property initialized at compile time",
                "A property initialized only when first accessed",
                "A property that cannot change",
                "A computed property with no storage"
            ],
            correctIndex: 1,
            explanation: "`lazy` delays initialization until first use, useful for expensive setup."
        ),
        Question(
            text: "What is the purpose of generics in Swift?",
            options: [
                "To avoid type safety",
                "To write flexible, reusable code while keeping type safety",
                "To replace protocols",
                "To force dynamic typing"
            ],
            correctIndex: 1,
            explanation: "Generics let you write functions and types that work with any type while preserving compile-time checks."
        ),
        Question(
            text: "What is an enum with associated values commonly used for?",
            options: [
                "Storing only integer raw values",
                "Modeling state that carries related data per case",
                "Replacing all classes",
                "Avoiding pattern matching"
            ],
            correctIndex: 1,
            explanation: "Associated values let each enum case hold different payloads, e.g. network result cases."
        ),
        Question(
            text: "What does `Codable` combine?",
            options: [
                "Equatable and Hashable",
                "Encodable and Decodable",
                "Identifiable and Sendable",
                "Copyable and Comparable"
            ],
            correctIndex: 1,
            explanation: "`Codable` is a type alias for types that can be encoded to and decoded from external formats like JSON."
        ),
        Question(
            text: "What is the difference between `==` and `===`?",
            options: [
                "They are identical",
                "`==` compares values, `===` compares object identity",
                "`===` compares strings only",
                "`==` is for classes only"
            ],
            correctIndex: 1,
            explanation: "`==` uses Equatable value comparison. `===` checks whether two class references point to the same instance."
        ),
        Question(
            text: "In an interview, why might an interviewer ask about value vs reference types?",
            options: [
                "To test UI design skills",
                "To assess understanding of copying, mutation, and memory behavior",
                "To check Xcode shortcuts",
                "To discuss App Store pricing"
            ],
            correctIndex: 1,
            explanation: "This is a core Swift topic affecting performance, bugs, and API design — very common in junior iOS interviews."
        )
    ]
}
