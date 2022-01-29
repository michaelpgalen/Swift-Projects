//
//  ContentView.swift
//  rockPaperScissors
//
//  Created by Michael Galen on 1/4/22.
//

import SwiftUI

struct BigButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 250, height: 50)
            .padding()
            .background(Color(red: 0.9, green: 0.9, blue: 0.9))
            .clipShape(Capsule())
    }
}

extension View {
    func gameButtonStyle() -> some View {
        modifier(BigButton())
    }
}

struct ContentView: View {
    let moves = ["rock", "paper", "scissors"]
    @State private var shouldWin = Bool.random()
    @State private var computerMove = Int.random(in: 0..<3)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var totalCorrect = 0
    @State private var totalTaps = 0
    @State private var roundOver = false
        
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 10) {
                Spacer()
                //Below: Show computer's play
                Text("Opponent plays")
                Text(moves[computerMove])
                .font(.system(size: 50))

                //Below: show challenge to win or lose
                if shouldWin {
                    Text("Play to win")
                } else {
                    Text("Play to lose")
                }
                Spacer()
                VStack {
                 // Buttons for user's move
                    Button("Rock") {
                        rockTapped()
                    }
                    .gameButtonStyle()
                    Button("Paper") {
                       paperTapped()
                    }
                    .gameButtonStyle()
                    Button("Scissors") {
                       scissorsTapped()
                        }
                    .gameButtonStyle()
                }
                .font(.system(size: 50))
                Spacer()
            }
        }.ignoresSafeArea()
        
        .alert(scoreTitle, isPresented: $showingScore) {
          Button("continue", action: nextHand)
        } message: {
            Text("Your score is \(totalCorrect) out of \(totalTaps).")
        }
        .alert("Round is Over", isPresented: $roundOver) {
            Button("Reset", action: reset)
        } message: {
            Text("Your score is \(totalCorrect) out of \(totalTaps).")
        }
        
    }
    func rockTapped() {
        showingScore = true
        totalTaps += 1
        if shouldWin {
            switch computerMove {
            case 0: scoreTitle = "Wrong"
            case 1: scoreTitle = "Wrong"
            case 2: scoreTitle = "Correct"
            default: scoreTitle = "Error"
            }
        } else {
            switch computerMove {
            case 0: scoreTitle = "Wrong"
            case 1: scoreTitle = "Correct"
            case 2: scoreTitle = "Wrong"
            default: scoreTitle = "Error"
            }
        }
        if scoreTitle == "Correct" {
            totalCorrect += 1
        }
    }
    func paperTapped() {
        showingScore = true
        totalTaps += 1
        if shouldWin {
            switch computerMove {
            case 0: scoreTitle = "Correct"
            case 1: scoreTitle = "Wrong"
            case 2: scoreTitle = "Wrong"
            default: scoreTitle = "Error"
            }
        } else {
            switch computerMove {
            case 0: scoreTitle = "Wrong"
            case 1: scoreTitle = "Wrong"
            case 2: scoreTitle = "Correct"
            default: scoreTitle = "Error"
            }
        }
        if scoreTitle == "Correct" {
            totalCorrect += 1
        }
    }
    func scissorsTapped() {
        showingScore = true
        totalTaps += 1
        if shouldWin {
            switch computerMove {
            case 0: scoreTitle = "Wrong"
            case 1: scoreTitle = "Correct"
            case 2: scoreTitle = "Wrong"
            default: scoreTitle = "Error"
            }
        } else {
            switch computerMove {
            case 0: scoreTitle = "Correct"
            case 1: scoreTitle = "Wrong"
            case 2: scoreTitle = "Wrong"
            default: scoreTitle = "Error"
            }
        }
        if scoreTitle == "Correct" {
            totalCorrect += 1
        }
    }
    func nextHand() {
        shouldWin.toggle()
        computerMove = Int.random(in: 0..<3)
        if totalTaps == 10 {
            roundOver = true
        }
    }
    func reset() {
        shouldWin.toggle()
        computerMove = Int.random(in: 0..<3)
        totalTaps = 0
        totalCorrect = 0
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
