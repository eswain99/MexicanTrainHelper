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
    @State private var showDuplicateAlert = false
    
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
                let newDomino = Domino(left: left, right: right)
                let newKey = newDomino.normalizedKey

                let existingKeys = Set(dominoes.map { $0.normalizedKey })

                if existingKeys.contains(newKey) {
                    showDuplicateAlert = true
                } else {
                    dominoes.insert(newDomino, at: 0)
                }
            }
            .alert("Duplicate Domino", isPresented: $showDuplicateAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text("Each domino tile must be unique.")
            }

            .buttonStyle(.borderedProminent)
        }
    }
}
