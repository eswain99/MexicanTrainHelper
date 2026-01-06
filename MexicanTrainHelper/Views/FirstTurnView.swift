//
//  FirstTurnView.swift
//  MexicanTrainHelper
//
//  Created by Ethan Swain on 2026-01-06.
//

import SwiftUI

struct FirstTurnView: View {
    @State private var hand: [Domino] = []
    @State private var hubValue = 12
    @State private var result: FirstTurnResult?

    var body: some View {
        VStack(spacing: 16) {
            Picker("Hub Value", selection: $hubValue) {
                ForEach(0...12, id: \.self) { Text("\($0)") }
            }
            .pickerStyle(.segmented)

            DominoPicker(dominoes: $hand)

            Button("Calculate Best First Turn") {
                result = FirstTurnSolver.findBestChain(
                    hand: hand,
                    hubValue: hubValue
                )
            }
            .buttonStyle(.borderedProminent)

            List {
                Section("Your Hand") {
                    ForEach(hand) { domino in
                        Text("\(domino.left) | \(domino.right)")
                    }
                }

                if let result = result {
                    Section("Best Play") {
                        ForEach(result.chain) { domino in
                            Text("\(domino.left) | \(domino.right)")
                        }
                        Text("Total Pips Removed: \(result.totalPips)")
                            .bold()
                    }
                }
            }

            Spacer()
        }
        .padding()
        .navigationTitle("First Turn")
    }
}
