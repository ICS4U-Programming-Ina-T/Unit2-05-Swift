//
// MagicSquares.swift
//
// Created by Ina Tolo
// Created on 2022-4-20
// Version 1.0
// Copyright (c) 2022 Ina Tolo. All rights reserved.
//
// The MagicSquares program implements an application that
// calls a function which uses recursion to determine all
// of the possible magic squares when the magic nuber is 15.

// declaring constants
let three: Int = 3
let four: Int = 4
let five: Int = 5
let six: Int = 6
let seven: Int = 7
let eight: Int = 8
let nine: Int = 9
let magicNum: Int = 15

// generates magic squares
func genSquare(square: [Int], currentSquare: [Int], index: Int) {
    // mutating arguments to variables
    var square: [Int] = square
    var currentSquare: [Int] = currentSquare

    // checks if position in array has been filled
    for counter in 0..<square.count where currentSquare[counter] == 0 {

        currentSquare[counter] = 1
        square[index] = counter + 1

        if index < square.count - 1 {
            // calls function with incremented index position
            genSquare(square: square, currentSquare: currentSquare, index: index + 1)
        } else {
            // checks if array is a magic square
            if isMagic(preSquare: square) == true {
                printMagicSquare(outputSquare: square)
            }
        }
        // resets position to be empty
        currentSquare[counter] = 0
    }
}

// function returns true or false for whether or not array is a magic square.
func isMagic(preSquare: [Int]) -> Bool {
    // initializing variables that determine sum for combinations
    let row1 = preSquare[0] + preSquare[1] + preSquare[2]
    let row2 = preSquare[three] + preSquare[four] + preSquare[five]
    let row3 = preSquare[six] + preSquare[seven] + preSquare[eight]
    let col1 = preSquare[0] + preSquare[three] + preSquare[six]
    let col2 = preSquare[1] + preSquare[four] + preSquare[seven]
    let col3 = preSquare[2] + preSquare[five] + preSquare[eight]
    let diag1 = preSquare[0] + preSquare[four] + preSquare[eight]
    let diag2 = preSquare[2] + preSquare[four] + preSquare[six]

    // copies results back to genSquare function
    return row1 == magicNum && row2 == magicNum && row3 == magicNum
        && col1 == magicNum && col2 == magicNum
        && col3 == magicNum && diag1 == magicNum && diag2 == magicNum
}

// prints inputted array in a magic square format
func printMagicSquare(outputSquare: [Int]) {
    print("\n*****")

    // loops through each index in each array to format
    for count in 0..<outputSquare.count {
        if count == three || count == six {
            print()
            print("\(outputSquare[count]) ", terminator: "")
        } else {
            print("\(outputSquare[count]) ", terminator: "")
        }
    }
    print("\n*****")
}

// initializing arrays
var magicSquare: [Int] = [1, 2, three, four, five, six, seven, eight, nine]
var extraArray: [Int] = [0, 0, 0, 0, 0, 0, 0, 0, 0]

print()
print("All Possible Magic Squares (3x3):")

// function call to generate magic sqare
genSquare(square: magicSquare, currentSquare: extraArray, index: 0)
