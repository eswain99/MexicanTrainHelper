//
//  PipCounter.swift
//  MexicanTrainHelper
//
//  Created by Ethan Swain on 2026-01-06.
//

import Foundation

struct PipCounter {
    static func totalPips(in hand: [Domino]) -> Int {
        hand.reduce(0) { $0 + $1.pipCount }
    }
}
