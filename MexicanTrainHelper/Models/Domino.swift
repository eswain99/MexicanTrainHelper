//
//  Domino.swift
//  MexicanTrainHelper
//
//  Created by Ethan Swain on 2026-01-06.
//

import Foundation

struct Domino: Identifiable, Hashable {
    let id = UUID()
    let left: Int
    let right: Int

    // Total points for a whole domino tile
    var pipCount: Int {
        left + right
    }

    // Whether 2 tiles can connect, used when forming a train
    func matches(_ value: Int) -> Bool {
        left == value || right == value
    }

    // Return the other end of the domino tile in order to know which value the next domino must connect to
    func otherEnd(matching value: Int) -> Int {
        if left == value{
            return right
        } else {
            return left
        }
    }
    
    // Whether a tile is a double
    var isDouble: Bool {
        left == right
    }
}
