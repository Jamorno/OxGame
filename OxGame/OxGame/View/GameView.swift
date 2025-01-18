//
//  GameView.swift
//  OxGame
//
//  Created by Jamorn Suttipong on 17/1/2568 BE.
//

import SwiftUI

struct GameView: View {
    
    @ObservedObject var viewModel = OxViewModel()
    
    var body: some View {
        VStack {
            //result
            if viewModel.winner == "Draw" {
                Text("DRAW!!")
                    .font(.system(size: 50))
                    .fontWeight(.semibold)
                    .padding(.vertical)
            } else if viewModel.winner != "" {
                Text("\(viewModel.winner) Win!!")
                    .font(.system(size: 50))
                    .fontWeight(.semibold)
                    .padding(.vertical)
            }
            
            //game board
            Grid(alignment: .center, horizontalSpacing: 8, verticalSpacing: 8) {
                ForEach(0..<3, id: \.self) {row in
                    GridRow {
                        ForEach(0..<3, id: \.self) {column in
                            let index = row * 3 + column
                            ZStack {
                                RoundedRectangle(cornerRadius: 25.0)
                                    .frame(width: 100, height: 100)
                                    .foregroundStyle(.pink.opacity(0.8))
                                    .onTapGesture {
                                        withAnimation(.snappy) {
                                            if viewModel.board[index] == "" {
                                                viewModel.board[index] = viewModel.currentPlayer
                                                viewModel.currentPlayer = (viewModel.currentPlayer == "X") ? "O" : "X"
                                            }
                                            viewModel.checkWinner()
                                        }
                                    }
                                
                                //show player move
                                Text(viewModel.board[index])
                                    .font(.system(size: 65))
                                    .fontWeight(.bold)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
            }
            .padding(.vertical, 30)
            
            //play again button
            Button {
                viewModel.playAgain()
            } label: {
                Text("Play again")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .padding()
                    .background(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
            }
        }
    }
}

#Preview {
    GameView()
}
