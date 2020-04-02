//
//  ViewController.swift
//  TicTacInfinity
//
//  Created by Elliott Williams on 3/30/20.
//  Copyright © 2020 Moonshot Applications. All rights reserved.
//

import UIKit


enum tileState {
    case ex, zero, empty
}

struct Tile {
    let button: UIButton
    var tileState: tileState
}


class ViewController: UIViewController {

    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var boardView: UIView!
    
    var pick = "3x3"
    
    var buttonCreationCount = 0
    
    enum gameState {
        case zerosOngoing
        case exesOngoing
        case winnerExes
        case winnerZeros
        case noWinner
    }
    var stateOfGame: gameState = .exesOngoing
    
    var tileButtons = [Tile]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         

        func makeBtn(dimension: String, xPosition: Double, yPosition: Double, symbol: String = "") {

            var widthAndHeight = 95.0
            
            switch dimension {
            case "3x3":
                widthAndHeight = 95
            case "4x4":
                widthAndHeight = 67.5
            case "5x5":
                widthAndHeight = 56
            default:
                widthAndHeight = 95
            }

            // make button
            let button = UIButton()
            button.frame = CGRect(x: xPosition, y: yPosition, width: widthAndHeight, height: widthAndHeight)
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor(named: "mainBlue"), for: .normal)
            button.setTitle(symbol, for: .normal)
            button.titleLabel?.font =  UIFont(name: "Avenir-Heavy", size: 60)
            
            button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
            
            let newButtonTile = Tile(button: button, tileState: tileState.empty)
            tileButtons.append(newButtonTile)
            
            // tag button for identification
            button.tag = buttonCreationCount
            print("tagged button as: \(buttonCreationCount)")
            buttonCreationCount += 1

            // add button to view
            self.boardView.addSubview(button)
            print("made button with dimen: \(dimension), xpos: \(xPosition), ypos: \(yPosition), sym: \(symbol), w/h size: \(widthAndHeight)")
            

        }
        
        
                        
        func makeBoard(dimensionNumber: Int) {
            // LCM (3,4,5) = 60 ==== 60*5 = 300
            // 3x3: 300/3 = 95 per square, 7.5 distance
            let threeDims: Array<Double> = [0.0, 105.0, 210.0]

            // 4x4: 300/4 = 65 per square, 10 distance
            let fourDims = [0.0, 78.33333, 156.666666, 235]

            // 5x5: 300/5 = 56 per square, 5 distance
            let fiveDims = [0.0, 61, 122, 183, 244]

            switch dimensionNumber {
            case 3:
                // make 3x3 board
                for tile in 0..<dimensionNumber { // repeat over rows
                    print("\(tile) tile in \(dimensionNumber)")
                    
                    let height = threeDims[tile]
                    for i in 0..<dimensionNumber {
                        makeBtn(dimension: pick, xPosition: threeDims[i], yPosition: height)
                        print("hey, you just made a button with row num: \(height) and column num \(threeDims[i])")
                    }
                }
                
            case 4:
                // make 3x3 board
                for tile in 0..<dimensionNumber { // repeat over rows
                    print("\(tile) tile in \(dimensionNumber)")
                    
                    let height = fourDims[tile]
                    for i in 0..<dimensionNumber {
                        makeBtn(dimension: pick, xPosition: fourDims[i], yPosition: height)
                        print("hey, you just made a button with row num: \(height) and column num \(fourDims[i])")
                    }
                }

                
            case 5:
                // make 3x3 board
                for tile in 0..<dimensionNumber { // repeat over rows
                    print("\(tile) tile in \(dimensionNumber)")
                    
                    let height = fiveDims[tile]
                    for i in 0..<dimensionNumber {
                        makeBtn(dimension: pick, xPosition: fiveDims[i], yPosition: height)
                        print("hey, you just made a button with row num: \(height) and column num \(fiveDims[i])")
                    }
                }

                
            default:
                print("default board initiatied.. 3x3")

            }

            
        }
                
        switch pick {
        case "3x3":
            makeBoard(dimensionNumber: 3)
        case "4x4":
            makeBoard(dimensionNumber: 4)
        case "5x5":
            makeBoard(dimensionNumber: 5)

        default:
            makeBoard(dimensionNumber: 3)
        }

    } // end vdl
    
    
    
    func didAnyoneWin(boardType: String) {
        // algos to decide if anyone won, and if so call winner function
        switch boardType {
        case "3x3":
            print("3x3 wins?")
            
        case "4x4":
            print("4x4 wins?")

        case "5x5":
            print("5x5 wins?")

        default:
            print("default board initiatied.. 3x3")
        }
        
    }

    func winner(is: String) {
        // declare winner with alert
    }

    
    func resetBoard() {
        // clear board
        
        
        // and set state to X's turn
        stateOfGame = .exesOngoing
        
    }


    func changeBtn(which: Int) {
        // change button to x or y depending on what state it is in
        
    }
    func changeTurn(to: gameState) {
        // change turn, for after player has chosen a square, or upon reset
        didAnyoneWin(boardType: pick)
        stateOfGame = to

        if stateOfGame == gameState.exesOngoing {
            turnLabel.text = "It is X's Turn."

        } else if stateOfGame == gameState.zerosOngoing {
            turnLabel.text = "It is O's Turn."
            
        } else {
            print ("Game is not ongoing")
        }
        
    }
    
    @objc func buttonAction(sender: UIButton!) {
        // this function discerns which button was clicked and take appropriate action
        
        // change Tile's state in array
        print("Button tapped: \(sender.tag)")
        print("state of tile clicked: \(tileButtons[sender.tag].tileState)")
        
        if tileButtons[sender.tag].tileState == tileState.empty {
            if stateOfGame == .exesOngoing { tileButtons[sender.tag].tileState = tileState.ex }
        }
        
        if tileButtons[sender.tag].tileState == tileState.empty {
            if stateOfGame == .zerosOngoing { tileButtons[sender.tag].tileState = tileState.zero }
        }

        print(tileButtons[sender.tag].tileState)

        // change button to appropriate symbol and change turn
        print(sender.titleLabel?.text)
        if sender.titleLabel!.text == nil || sender.titleLabel!.text == "" {
            if stateOfGame == gameState.exesOngoing {
                sender.setTitle("X", for: .normal)
                changeTurn(to: .zerosOngoing)

            } else if stateOfGame == gameState.zerosOngoing {
                sender.setTitle("O", for: .normal)
                changeTurn(to: .exesOngoing)

            } else {
                print ("apparently state of game isn't ongoing.")
            }
            
        } else {
            print ("must not be nil or \"\"")
        }
        
        
        
        // check if this is the winning play
        
        
        
        // change turn state
    }
    
    



}

