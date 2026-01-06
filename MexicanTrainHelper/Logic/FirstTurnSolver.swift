//
//  FirstTurnSolver.swift
//  MexicanTrainHelper
//
//  Created by Ethan Swain on 2026-01-06.
//

import Foundation

struct FirstTurnResult {
    let chain: [Domino]
    let totalPips: Int
}

struct FirstTurnSolver {
    
    static func findBestChain(hand: [Domino],hubValue: Int) -> FirstTurnResult {

        var bestChain: [Domino] = []
        var bestScore = 0

        func dfs(
            currentValue: Int,
            remaining: [Domino],
            currentChain: [Domino],
            currentScore: Int
        ) {
            if currentScore > bestScore {
                bestScore = currentScore
                bestChain = currentChain
            }

            for (index, domino) in remaining.enumerated() {
                guard domino.matches(currentValue) else { continue }

                let nextValue = domino.otherEnd(matching: currentValue)
                var nextRemaining = remaining
                nextRemaining.remove(at: index)

                dfs(
                    currentValue: nextValue,
                    remaining: nextRemaining,
                    currentChain: currentChain + [domino],
                    currentScore: currentScore + domino.pipCount
                )
            }
        }

        dfs(
            currentValue: hubValue,
            remaining: hand,
            currentChain: [],
            currentScore: 0
        )

        return FirstTurnResult(chain: bestChain, totalPips: bestScore)
    }
}
