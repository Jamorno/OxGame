//
//  OxViewModel.swift
//  OxGame
//
//  Created by Jamorn Suttipong on 17/1/2568 BE.
//

import Foundation

class OxViewModel: ObservableObject {
    
    @Published var board: [String] = Array(repeating: "", count: 9)
    @Published var currentPlayer: String = "X"
    @Published var winner: String = ""
    
    let winningIndices = [
        [0, 1, 2], 
        [3, 4, 5],
        [6, 7, 8],
        [0, 3, 6], 
        [1, 4, 7],
        [2, 5, 8],
        [0, 4, 8], 
        [2, 4, 6]
    ]
    
    //check row, column and diagonals win or draw
    func checkWinner() {
        //check winner
//        if board[0] == board[1], board[1] == board[2], board[0] != "" {
//            winner = board[0]
//        } else if board[3] == board[4], board[4] == board[5], board[3] != "" {
//            winner = board[3]
//        } else if board[6] == board[7], board[7] == board[8], board[6] != "" {
//            winner = board[6]
//        } else if board[0] == board[3], board[3] == board[6], board[0] != "" {
//            winner = board[0]
//        } else if board[1] == board[4], board[4] == board[7], board[1] != "" {
//            winner = board[1]
//        } else if board[2] == board[5], board[5] == board[8], board[2] != "" {
//            winner = board[2]
//        } else if board[0] == board[4], board[4] == board[8], board[0] != "" {
//            winner = board[0]
//        } else if board[2] == board[4], board[4] == board[6], board[2] != "" {
//            winner = board[2]
//        }
        for indices in winningIndices {
            if board[indices[0]] == board[indices[1]], board[indices[1]] == board[indices[2]], board[indices[0]] != "" {
                winner = board[indices[0]]
                break
            }
        }
        
        //check draw
        if !board.contains("") && winner == "" {
            winner = "Draw"
        }
    }
    
    func playAgain() {
        board = Array(repeating: "", count: 9)
        currentPlayer = "X"
        winner = ""
    }
}
