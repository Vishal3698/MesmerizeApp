//
//  MesmerizeApp.swift
//  Mesmerize
//
//  Created by Vishal Patel on 2021-05-30.
//

import SwiftUI

@main
struct MesmerizeApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
