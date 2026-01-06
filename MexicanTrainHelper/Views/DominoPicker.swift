//
//  DominoPicker.swift
//  MexicanTrainHelper
//
//  Created by Ethan Swain on 2026-01-06.
//

import SwiftUI

struct DominoPicker: View {
    @Binding var dominoes: [Domino]

    @State private var left = 0
    @State private var right = 0

    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Picker("Left", selection: $left) {
                    ForEach(0...12, id: \.self) { Text("\($0)") }
                }
                .pickerStyle(.wheel)

                Picker("Right", selection: $right) {
                    ForEach(0...12, id: \.self) { Text("\($0)") }
                }
                .pickerStyle(.wheel)
            }
            .frame(height: 120)

            Button("Add Domino") {
                dominoes.append(Domino(left: left, right: right))
            }
            .buttonStyle(.borderedProminent)
        }
    }
}
