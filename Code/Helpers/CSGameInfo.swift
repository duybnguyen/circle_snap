//
//  CSGameInfo.swift
//  circle_snap
//
//  Created by Duy Nguyen on 10/24/24.
//

import SpriteKit
import GameplayKit

class GameState {
    var progress: Double = 0.0
    var randomNodeAngle: Double = Double.random(in: 0..<360)
    var scale: CGFloat = 1.0
    var shakeOffset: CGFloat = 0
    var isGlowing: Bool = false
    var lastClickProgress: Double = 0.0

    // Score System
    var score: Int = 0

    // Timer and Modifiers
    var gameTimer: Int = 5
    var animationSpeed: Double = 3.5

    // Conditions
    var currentCondition: ConditionType = .none
    var conditionPatchStartAngle: Double = 0
    var isInConditionPatch: Bool = false
    var isBarVisible: Bool = true

    // State Management
    var stateMachine: GKStateMachine?

    init() {
        configureStateMachine()
    }

    private func configureStateMachine() {
        stateMachine = GKStateMachine(states: [
            GameNotStartedState(gameState: self),
            GameInProgressState(gameState: self),
            GameOverState(gameState: self)
        ])
        stateMachine?.enter(GameNotStartedState.self)
    }
}

// Enum for Condition Types
enum ConditionType {
    case none
    case sand
    case ice
    case wind
    case fog
}

// States for Gameplay
class GameNotStartedState: GKState {
    unowned let gameState: GameState

    init(gameState: GameState) {
        self.gameState = gameState
    }

    override func didEnter(from previousState: GKState?) {
        print("Game not started")
    }
}

class GameInProgressState: GKState {
    unowned let gameState: GameState

    init(gameState: GameState) {
        self.gameState = gameState
    }

    override func didEnter(from previousState: GKState?) {
        print("Game in progress")
    }
}

class GameOverState: GKState {
    unowned let gameState: GameState

    init(gameState: GameState) {
        self.gameState = gameState
    }

    override func didEnter(from previousState: GKState?) {
        print("Game over")
    }
}
