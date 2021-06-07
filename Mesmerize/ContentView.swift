//
//  ContentView.swift
//  Mesmerize
//
//  Created by Vishal Patel on 2021-05-30.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    var body: some View {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75.0))]){
                    ForEach(viewModel.cards) { card in
                        CardView(card: card).aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
            }
            .foregroundColor(.red)
            }
            .padding(.horizontal)
    }
}


struct CardView: View{
    let card: MemoryGame<String>.Card
    var body: some View{
        ZStack{
            let shape = RoundedRectangle(cornerRadius: 20.0)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3.0).foregroundColor(.red)
                Text(card.content).font(.largeTitle).foregroundColor(.orange)
            }else{
                shape.fill()
            }
        }
    }
}









// MARK: - Preview Code

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
    }
}
