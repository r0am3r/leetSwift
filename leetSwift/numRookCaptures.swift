//
//  numRookCaptures.swift
//  leetSwift
//
//  Created by Wong Feng on 26/3/2020.
//  Copyright © 2020 Wong Feng. All rights reserved.
//

// On an 8 x 8 chessboard, there is one white rook.  There also may be empty squares, white bishops,
// and black pawns.  These are given as characters 'R', '.', 'B', and 'p' respectively.
// Uppercase characters represent white pieces, and lowercase characters represent black pieces.
//
// The rook moves as in the rules of Chess: it chooses one of four cardinal directions
// (north, east, west, and south), then moves in that direction until it chooses to stop,
// reaches the edge of the board, or captures an opposite colored pawn by moving to the same square
// it occupies.  Also, rooks cannot move into the same square as other friendly bishops.
//
// Return the number of pawns the rook can capture in one move.
//
//
// Example 1:
// Input: [
//  [".",".",".",".",".",".",".","."],
//  [".",".",".","p",".",".",".","."],
//  [".",".",".","R",".",".",".","p"],
//  [".",".",".",".",".",".",".","."],
//  [".",".",".",".",".",".",".","."],
//  [".",".",".","p",".",".",".","."],
//  [".",".",".",".",".",".",".","."],
//  [".",".",".",".",".",".",".","."]
// ]
// Output: 3
// Explanation:
// In this example the rook is able to capture all the pawns.


// Example 2:
// Input: [
//  [".",".",".",".",".",".",".","."],
//  [".","p","p","p","p","p",".","."],
//  [".","p","p","B","p","p",".","."],
//  [".","p","B","R","B","p",".","."],
//  [".","p","p","B","p","p",".","."],
//  [".","p","p","p","p","p",".","."],
//  [".",".",".",".",".",".",".","."],
//  [".",".",".",".",".",".",".","."]
// ]
// Output: 0
// Explanation:
// Bishops are blocking the rook to capture any pawn.


// Example 3:
// Input: [
//  [".",".",".",".",".",".",".","."],
//  [".",".",".","p",".",".",".","."],
//  [".",".",".","p",".",".",".","."],
//  ["p","p",".","R",".","p","B","."],
//  [".",".",".",".",".",".",".","."],
//  [".",".",".","B",".",".",".","."],
//  [".",".",".","p",".",".",".","."],
//  [".",".",".",".",".",".",".","."]
// ]

// Output: 3
// Explanation:
// The rook can capture the pawns at positions b5, d6 and f5.
//
//
// Note:
// board.length == board[i].length == 8
// board[i][j] is either 'R', '.', 'B', or 'p'
// There is exactly one cell with board[i][j] == 'R'


import Foundation

class numRookCaptures {
    func numRookCaptures(_ board: [[Character]]) -> Int {
        var cnt = 0
        var rX, rY: Int?
        for x in 0..<8 {
            for y in 0..<8 {
                if board[x][y] == Character("R") {
                    rX = x
                    rY = y
                    break
                }
            }
        }

        let dX = [0, 1, 0, -1]
        let dY = [1, 0, -1, 0]
        for d in 0..<4 {
            for step in 0..<8 {
                let x = rX! + step * dX[d]
                let y = rY! + step * dY[d]
                guard x >= 0 && x < 8 && y >= 0 && y < 8 && board[x][y] != Character("B") else {
                    break
                }
                if board[x][y] == Character("p") {
                    cnt += 1
                    break
                }
            }
        }
        return cnt
    }
}
