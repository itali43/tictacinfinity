//
//  ViewController.swift
//  TicTacInfinity
//
//  Created by Elliott Williams on 3/30/20.
//  Copyright © 2020 Moonshot Applications. All rights reserved.
//

import UIKit
import PopupDialog

enum tileState {
    case ex, zero, empty
}


struct Tile {
    let button: UIButton
    var tileState: tileState
    var index: Int
}


class ViewController: UIViewController {

    @IBOutlet weak var turnLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var boardView: UIView!
    
    var pick = "3x3"
    var dimension = 3
    
    var buttonCreationCount = 0
    
    var winningSequences: Array<Array<Int>> = []
    
    enum gameState {
        case zerosOngoing
        case exesOngoing
    }
    
    enum gameOutcome {
        case winner
        case noWinner
        case ongoing
    }
    
    var stateOfGame: gameState = .exesOngoing
    
    var tileButtons = [Tile]()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = "Play \(pick)!"
        makeBoard()
        winningSequences = makeWinningConditions()
        
        // quick fix to have an int for the dimension size
        // this should be optimized later in dependency injection
        switch pick {
        case "3x3":
            dimension = 3
        case "4x4":
            dimension = 4
        case "5x5":
            dimension = 5
        default:
            dimension = 3
        }
    } // end viewdidload
    

    func makeBtn(dimension: String, xPosition: Double, yPosition: Double, symbol: String = "") {
        // makes buttons that are used as tiles on the game board
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
        
        let newButtonTile = Tile(button: button, tileState: tileState.empty, index: buttonCreationCount)
        tileButtons.append(newButtonTile)
        
        // tag button for identification
        button.tag = buttonCreationCount
        buttonCreationCount += 1

        // add button to view
        self.boardView.addSubview(button)
    }
    
    
    func deleteBoard() {
        // restart button tags and clear tiles
        buttonCreationCount = 0
        
        // clear tiles array and remove from view
        tileButtons.removeAll()
        boardView.subviews.forEach({ $0.removeFromSuperview() }) // this deletes all buttons
    }


    func makeBoard() {
        var dimensionNumber = 3
        switch pick {
        case "3x3":
            dimensionNumber = 3
        case "4x4":
            dimensionNumber = 4
        case "5x5":
            dimensionNumber = 5

        default:
            dimensionNumber = 3
        }

        // would love to make this dynamic, such that it is calculated programmatically
        // this would allow larger boards, and with a ScrollView, potentially truly infinite boards
        // would also allow for full use of every screen
        
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
                let height = threeDims[tile]
                for i in 0..<dimensionNumber {
                    makeBtn(dimension: pick, xPosition: threeDims[i], yPosition: height)
                }
            }
        case 4:
            // make 3x3 board
            for tile in 0..<dimensionNumber { // repeat over rows
                let height = fourDims[tile]
                for i in 0..<dimensionNumber {
                    makeBtn(dimension: pick, xPosition: fourDims[i], yPosition: height)
                }
            }
        case 5:
            // make 3x3 board
            for tile in 0..<dimensionNumber { // repeat over rows
                let height = fiveDims[tile]
                for i in 0..<dimensionNumber {
                    makeBtn(dimension: pick, xPosition: fiveDims[i], yPosition: height)
                }
            }

        default:
            print("default board initiatied.. 3x3")
        }
    }
    
    
    func makeWinningConditions() -> Array<Array<Int>> {
        // this function produces all winning condition combinations no matter
        // what size the board is and returns a 2D array for checkForWin function to use
        
        var dimensionInt = 3
        switch pick {
        case "3x3":
            dimensionInt = 3
        case "4x4":
            dimensionInt = 4
        case "5x5":
            dimensionInt = 5
        default:
            dimensionInt = 3
        }

        var winningArrs: Array<Array<Int>> = []
        
        // columns combinations
        for col in 0..<dimensionInt{
            var columnArr: Array<Int> = []
            for i in 0..<dimensionInt {
                let newPlace = i * dimensionInt + col
                columnArr.append(newPlace)
            }
            // add winning column sequence to winning conditions
            winningArrs.append(columnArr)
        }

        // row combinations
        for row in 0..<dimensionInt{
            var rowArr: Array<Int> = []
            for i in 0..<dimensionInt {
                let newPlace = i + row * dimensionInt
                rowArr.append(newPlace)
            }
            // add winning row sequence to winning conditions
            winningArrs.append(rowArr)
        }

        // diagonal combinations
            // left to right
            var diagLeftToRightArr: Array<Int> = []
            for i in 0..<dimensionInt {
                let newPlace = i + (dimensionInt * i)
                diagLeftToRightArr.append(newPlace)
            }
            // add winning left to right diag sequence to winning conditions
            winningArrs.append(diagLeftToRightArr)

            // right to left
            var diagRightToLeftArr: Array<Int> = []
            for i in 0..<dimensionInt {
                let n = dimensionInt - 1 // b/c one should always start counting from 0
                let newPlace = (n - i) + (dimensionInt * i)
                diagRightToLeftArr.append(newPlace)
            }
            // add winning right to left diag sequence to winning conditions
            winningArrs.append(diagRightToLeftArr)

        return winningArrs

    }
    
    func checkForAWin(state: gameState, pressed: Int) -> gameOutcome {
        // state will tell us if we should check for X's or O's victory here
        // may want to check which player here
        // make sure to check for a win before the state is changed.. in the turn change sequence
        
        var currentPlayer: tileState = tileState.ex
        
        if state == gameState.zerosOngoing {
            // change to O's if it's their turn
            currentPlayer = tileState.zero
        }
        
        print("current player: \(state)")
        // Get indexes owned by this player
        let selectedIndexes = self.tileButtons.filter({ $0.tileState == currentPlayer }).map { $0.index }
        
        // checks to see if present players most recent move is a winning one
        for i in 0..<winningSequences.count {
            let listSet = Set(winningSequences[i])
            let findListSet = Set(selectedIndexes)
            let allElemsContained = listSet.isSubset(of: findListSet)
            
            if allElemsContained == true {
                print("WINNER!")
                return .winner
            }
        }
        
        // checks to see if all tiles are full.  If they are there will be no winner, game is a tie!
        let maxTiles = dimension * dimension
        let filledTiles = self.tileButtons.filter({ $0.tileState == tileState.ex || $0.tileState == tileState.zero}).map { $0.index }

        if filledTiles.count == maxTiles {
            print("Game is a Tie!")
            return .noWinner
        }
        
        // if no ties and no wins, game is ongoing still
        return .ongoing
    }

    
    func tie() {
        // declare tie with alert
        self.popUpAlert(title: "It's a Tie!", message: "Play again soon..", vc: self)
    }
    

    func winner() {
        // declare winner with alert
        var player = "X"
        if stateOfGame == .zerosOngoing { player = "O" }
        self.popUpAlert(title: "\(player)'s won!", message: "🎉 🎉 Congrats! 🎉 🎉", vc: self)
    }

    
    func resetBoard() {
        // delete board tiles
        deleteBoard()
        
        // make new board
        makeBoard()
        
        // and set state to X's turn
        stateOfGame = .exesOngoing
    }
    

    func changeTurn(to: gameState) {
        // change turn, for after player has chosen a square, or upon reset
//        didAnyoneWin(boardType: pick)
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
        if tileButtons[sender.tag].tileState == tileState.empty {
            if stateOfGame == .exesOngoing { tileButtons[sender.tag].tileState = tileState.ex }
        }
        if tileButtons[sender.tag].tileState == tileState.empty {
            if stateOfGame == .zerosOngoing { tileButtons[sender.tag].tileState = tileState.zero }
        }

        // change button to appropriate symbol and change turn
        if sender.titleLabel!.text == nil || sender.titleLabel!.text == "" {
            if stateOfGame == gameState.exesOngoing {
                sender.setTitle("X", for: .normal)
                let winCheck = self.checkForAWin(state: stateOfGame, pressed: sender.tag)
                if winCheck == .winner {  // this was the winning move for X's
                    winner()
                } else if winCheck == .noWinner {  // this was the last move
                    tie()
                } else {  // game is still going on, no winner yet
                    changeTurn(to: .zerosOngoing)
                }

            } else if stateOfGame == gameState.zerosOngoing {
                sender.setTitle("O", for: .normal)
                let winCheck = self.checkForAWin(state: stateOfGame, pressed: sender.tag)
                if  winCheck == .winner { // winning move for O's
                    winner()
                } else if winCheck == .noWinner {  // this was the last move
                    tie()
                } else {  // game is still going on, no winner yet
                    changeTurn(to: .exesOngoing)
                }
            } else {
                print ("apparently state of game isn't ongoing, this shouldn't happen.... throw error later")
            }
            
        } else {
            print ("must not be nil or \"\", throw error here")
        }
                
        // check if this is the winning play
        // TODO: logic for winning play check
        
//        didAnyoneWin(boardType: pick)
    }
    
    
    func popUpAlert(title: String, message: String, vc: UIViewController) {
        // pop up alert, via PopupDialog

        // Create the dialog
        let popup = PopupDialog(title: title, message: message)
        // appearance of dialog
        let fontMsg = UIFont(name: "Avenir-Medium", size: 20)!
        let fontTitle = UIFont(name: "Avenir-Black", size: 60)!
        let dialogAppearance = PopupDialogDefaultView.appearance()
        dialogAppearance.backgroundColor  = .white
        dialogAppearance.titleFont  = fontTitle
        dialogAppearance.titleColor = UIColor(hexStr: "1034A6", alpha: 1.0)
        dialogAppearance.titleTextAlignment   = .center
        dialogAppearance.messageFont  =  fontMsg
        dialogAppearance.messageColor = UIColor(hexStr: "000000", alpha: 1.0)
        dialogAppearance.messageTextAlignment =  .center
        
        
        // Create buttons
        let oneButton = DefaultButton(title: "Ok") {
            print("You canceled the dialog.")
        }
        oneButton.titleFont = fontTitle
        oneButton.buttonColor = .white
        oneButton.titleColor = UIColor(hexStr: "1034A6", alpha: 1.0)
        oneButton.separatorColor = UIColor(hexStr: "1034A6", alpha: 1.0)
        oneButton.titleFont = UIFont(name: "Avenir-Black", size: 20)!
        popup.addButtons([ oneButton])
//        vc.present(popup, animated: false, completion: nil)
        vc.present(popup, animated: true) {
            self.resetBoard()
        }
    }

} // end ViewController class



// extensions
extension UIColor {
    convenience init(hexStr:String, alpha:CGFloat = 1.0) {
        var cString:String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        var rgbValue:UInt32 = 10066329 //color #999999 if string has wrong format
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        if ((cString.count) == 6) {
            Scanner(string: cString).scanHexInt32(&rgbValue)  // TODO: update for Swift 5
        }
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }
}

extension Array {
    // Prints out to std output, with one element per line, prefixed by
    // the element's index in square brackets
    
    public func printByIndex(delimiter: String = " ")
    {
        for (index, value) in self.enumerated()
        {
            print("[\(index)]\(delimiter)\(value)")
        }
    }
}
