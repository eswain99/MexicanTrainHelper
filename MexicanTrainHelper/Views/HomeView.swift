//
//  HomeView.swift
//  MexicanTrainHelper
//
//  Created by Ethan Swain on 2026-01-06.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                NavigationLink("First Turn Optimizer") {
                    FirstTurnView()
                }
                .buttonStyle(.borderedProminent)

                NavigationLink("Count Pips") {
                    CountPipsView()
                }
                .buttonStyle(.bordered)

                Spacer()
            }
            .padding()
            .navigationTitle("Mexican Train Helper")
        }
    }
}
