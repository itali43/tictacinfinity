#  TicTacInfinity

### Assignment
Task: Implement a 2-player (not AI) version of TicTacToe with a variable number of squares.
* The app has to be built using Swift and needs to be able to run on both iPhone & iPad. Use the latest stable version of Xcode & ensure that the latest version of iOS is supported. Feel free to choose the minimum version to support.
* Make use of code comments where deemed necessary.
* If you are to use dependencies, opt for Cocoapods/Carthage. Keep compilation easy and straight-forward.
* Please don’t spend more than 4 hours on this assignment.
* For any best practices that would take more than the 4 hour window, describe what they are, why they are needed, and how long each of them would take to implement 


### Best Practices Beyond The 4 Hour Window 
###### What, why and how long for implementation (tried to be conservative on timing)
-  dynamic sizing for the board dependent on screen space available and using a scrollview when necessary, which would more easily enable boards larger than 5 x 5 and standardize/unify the width of the tictactoe boards separating lines (estimated timing: basic arrangment perhaps 1-2+ days, with scrollview probably 3-4 to work out bugs)
- a testing suite for UI, winning outcomes, etc (estimated timing: 5 hours)
- change the dependency injection from StartingVC to the Play VC to an Int value instead of its current String value then refactor. (this is a small change that I put off until I was out of time but it would make the susequent code much cleaner) (estimated timing: 15 minutes or less)
- further optimize winning algos towards a v1 quality release: I built the algos fairly fast, I'm sure there are some things I can do to optimize for speed and readability still if I reexamined them (estimated timing: a day)
- Keep score.  Who doesn't want to know who wins best two out of three?  (estimated timing: 30 minutes)
- Make it bigger on iPad.  Both the board and the icons.  This ties into dynamic sizing, mentioned first. (estimated timing: 4 hours)
