//
//  CountPipsView.swift
//  MexicanTrainHelper
//
//  Created by Ethan Swain on 2026-01-06.
//

import SwiftUI

struct CountPipsView: View {
    @State private var hand: [Domino] = []

    var total: Int {
        PipCounter.totalPips(in: hand)
    }

    var body: some View {
        VStack(spacing: 16) {
            DominoPicker(dominoes: $hand)

            List {
                ForEach(hand) { domino in
                    Text("\(domino.left) | \(domino.right)")
                }
                .onDelete { hand.remove(atOffsets: $0) }
            }

            Text("Total Pips: \(total)")
                .font(.title2)
                .bold()

            Spacer()
        }
        .padding()
        .navigationTitle("Count Pips")
    }
}
