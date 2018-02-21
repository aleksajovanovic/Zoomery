//
//  PlayScene.swift
//  Zoomery
//
//  Created by Aleksa Jovanovic on 2015-09-27.
//  Copyright © 2015 Aleksa Jovanovic. All rights reserved.
//

import SpriteKit

class PlayScene: SKScene {
    
    var x:[CGFloat] = [(63), (221), (63), (221), (63), (221), (63), (221)]
    var y:[CGFloat] = [(167), (167), (288), (288), (407), (407), (526), (526)]
    let boxImages:[String] = [("emptybox.png"), ("emptyboxpress.png")]
    let animalImages:[String] = [("parrotSmall.png"), ("rabbit.png"), ("snake.png"), ("elephant.png"), ("giraffe.png"), ("hippo.png"), ("panda.png"), ("penguin.png")]
    let savedScore = NSUserDefaults.standardUserDefaults()
    var highscoreArray = [Int](count: 10, repeatedValue: 0)
    
    
    var didWin = false
    var tileShown = false
    var playerTurn = false
    var patternShown = false
    var nodeTouched:Int = 0
    var firstFrame = true
    var index = 0
    var currentPattern = [Int]()
    var firstTime:CFTimeInterval = 0
    var numberTouch = 0
    var timeDifference:CFTimeInterval = 0
    var round:Int = 1
    var playerTurnTime:CFTimeInterval = 0
    var gameOver = false
    var score:Int = 0
    var imageHeight:CGFloat = 92
    var imageWidth:CGFloat = 92
    var boxHeight:CGFloat = 97
    var boxWidth:CGFloat = 97
    
    var scoreLabel:SKLabelNode! = nil
    var roundLabel:SKLabelNode! = nil
    var box:SKSpriteNode? = nil
    var box1:SKSpriteNode? = nil
    var box2:SKSpriteNode? = nil
    var box3:SKSpriteNode? = nil
    var box4:SKSpriteNode? = nil
    var box5:SKSpriteNode? = nil
    var box6:SKSpriteNode? = nil
    var box7:SKSpriteNode? = nil
    var tile:Tile? = nil
    var tile1:Tile? = nil
    var tile2:Tile? = nil
    var tile3:Tile? = nil
    var tile4:Tile? = nil
    var tile5:Tile? = nil
    var tile6:Tile? = nil
    var tile7:Tile? = nil
    
    
    
    override func didMoveToView(view: SKView) {
        
        let modelName = UIDevice.currentDevice().modelName
        
        if modelName == "iPhone 5s" || modelName == "iPhone 5" || modelName == "iPhone 5c" {
        
            imageHeight *= 0.85
            imageWidth *= 0.85
            boxHeight *= 0.85
            boxWidth *= 0.85
        
            for var i=0; i<8; i++ {
           
                x[i] -= 9
                y[i] -= 25
            
                if i%2 == 1 {
                
                    x[i] -= 24
                
                }
                if i>1 {
                
                    y[i] -= 18
                
                }
                if i>3 {
                
                    y[i] -= 17
                
                }
                if i>5 {
                
                    y[i] -= 17
                
                }
            
            }
        }
        else if modelName == "iPhone 6 Plus" || modelName == "iPhone 6s Plus" {
            
            imageHeight *= 1.12
            imageWidth *= 1.12
            boxHeight *= 1.12
            boxWidth *= 1.12
            
            for var i=0; i<8; i++ {
                
                x[i] += 6
                y[i] += 18
                
                if i%2 == 1 {
                    
                    x[i] += 18
                    
                }
                if i>1 {
                    
                    y[i] += 11
                    
                }
                if i>3 {
                    
                    y[i] += 14
                    
                }
                if i>5 {
                    
                    y[i] += 11
                    
                }
                
            }
            
        }
        else if modelName == "iPad 2" || modelName == "iPad Air" || modelName == "iPad Air 2" || modelName == "iPad Retina"{
            
            imageHeight *= 0.77
            imageWidth *= 0.85
            boxHeight *= 0.73
            boxWidth *= 0.85
            
            for var i=0; i<8; i++ {
                
                x[i] -= 9
                y[i] -= 48
                
                if i%2 == 1 {
                    
                    x[i] -= 22
                    
                }
                if i>1 {
                    
                    y[i] -= 34
                   
                    if i%2 == 0 {
                        
                        x[i] += 1
                        
                    }
                    else {
                        
                        x[i] -= 2
                        
                    }
                    
                }
                if i>3 {
                    
                    y[i] -= 33
                    
                }
                if i>5 {
                    
                    y[i] -= 33
                    
                }
                
            }
            
        }
        var imageSet = [Int]()
        var i: Int = 0
        while(i<8){
            let imageSelector = Int(arc4random_uniform(8))
            
            if imageSet.contains(imageSelector) {
                //do nothing
            }
            else {
                imageSet.append(imageSelector)
                i++
            }
            
        }
        
        if singlePicture == false{
            
            tile = Tile(imageNamed: animalImages[imageSet[0]])
            tile?.size = CGSize(width: imageWidth, height: imageHeight)
            tile!.anchorPoint = CGPointMake(0, 0)
            tile!.position = CGPointMake(x[0], y[0])
            tile!.zPosition = 2.0
            
            tile1 = Tile(imageNamed: animalImages[imageSet[1]])
            tile1?.size = CGSize(width: imageWidth, height: imageHeight)
            tile1!.anchorPoint = CGPointMake(0, 0)
            tile1!.position = CGPointMake(x[1], y[1])
            tile1!.zPosition = 2.0
            
            tile2 = Tile(imageNamed: animalImages[imageSet[2]])
            tile2?.size = CGSize(width: imageWidth, height: imageHeight)
            tile2!.anchorPoint = CGPointMake(0, 0)
            tile2!.position = CGPointMake(x[2], y[2])
            tile2!.zPosition = 2.0
            
            tile3 = Tile(imageNamed: animalImages[imageSet[3]])
            tile3?.size = CGSize(width: imageWidth, height: imageHeight)
            tile3!.anchorPoint = CGPointMake(0, 0)
            tile3!.position = CGPointMake(x[3], y[3])
            tile3!.zPosition = 2.0
            
            tile4 = Tile(imageNamed: animalImages[imageSet[4]])
            tile4?.size = CGSize(width: imageWidth, height: imageHeight)
            tile4!.anchorPoint = CGPointMake(0, 0)
            tile4!.position = CGPointMake(x[4], y[4])
            tile4!.zPosition = 2.0
            
            tile5 = Tile(imageNamed: animalImages[imageSet[5]])
            tile5?.size = CGSize(width: imageWidth, height: imageHeight)
            tile5!.anchorPoint = CGPointMake(0, 0)
            tile5!.position = CGPointMake(x[5], y[5])
            tile5!.zPosition = 2.0
            
            tile6 = Tile(imageNamed: animalImages[imageSet[6]])
            tile6?.size = CGSize(width: imageWidth, height: imageHeight)
            tile6!.anchorPoint = CGPointMake(0, 0)
            tile6!.position = CGPointMake(x[6], y[6])
            tile6!.zPosition = 2.0
            
            tile7 = Tile(imageNamed: animalImages[imageSet[7]])
            tile7?.size = CGSize(width: imageWidth, height: imageHeight)
            tile7!.anchorPoint = CGPointMake(0, 0)
            tile7!.position = CGPointMake(x[7], y[7])
            tile7!.zPosition = 2.0
        }
        else {
            let imageSelector = Int(arc4random_uniform(8))
            
            tile = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile?.size = CGSize(width: imageWidth, height: imageHeight)
            tile!.anchorPoint = CGPointMake(0, 0)
            tile!.position = CGPointMake(x[0], y[0])
            tile!.zPosition = 2.0
            
            
            tile1 = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile1?.size = CGSize(width: imageWidth, height: imageHeight)
            tile1!.anchorPoint = CGPointMake(0, 0)
            tile1!.position = CGPointMake(x[1], y[1])
            tile1!.zPosition = 2.0
            
            tile2 = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile2?.size = CGSize(width: imageWidth, height: imageHeight)
            tile2!.anchorPoint = CGPointMake(0, 0)
            tile2!.position = CGPointMake(x[2], y[2])
            tile2!.zPosition = 2.0
            
            tile3 = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile3?.size = CGSize(width: imageWidth, height: imageHeight)
            tile3!.anchorPoint = CGPointMake(0, 0)
            tile3!.position = CGPointMake(x[3], y[3])
            tile3!.zPosition = 2.0
            
            tile4 = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile4?.size = CGSize(width: imageWidth, height: imageHeight)
            tile4!.anchorPoint = CGPointMake(0, 0)
            tile4!.position = CGPointMake(x[4], y[4])
            tile4!.zPosition = 2.0
            
            tile5 = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile5?.size = CGSize(width: imageWidth, height: imageHeight)
            tile5!.anchorPoint = CGPointMake(0, 0)
            tile5!.position = CGPointMake(x[5], y[5])
            tile5!.zPosition = 2.0
            
            tile6 = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile6?.size = CGSize(width: imageWidth, height: imageHeight)
            tile6!.anchorPoint = CGPointMake(0, 0)
            tile6!.position = CGPointMake(x[6], y[6])
            tile6!.zPosition = 2.0
            
            tile7 = Tile(imageNamed: animalImages[imageSet[imageSelector]])
            tile7?.size = CGSize(width: imageWidth, height: imageHeight)
            tile7!.anchorPoint = CGPointMake(0, 0)
            tile7!.position = CGPointMake(x[7], y[7])
            tile7!.zPosition = 2.0
            
        }
        
        let background = SKSpriteNode(imageNamed: "gameSceen.png")
        background.position = CGPoint(x:0, y:0)
        background.zPosition = 0.0
        background.anchorPoint = CGPoint(x:0.0, y:0.0)
        background.size = view.bounds.size
        background.name = "background"
        
        let exitButton = SKSpriteNode(imageNamed: "exit.png")
        exitButton.position = CGPoint(x:(CGRectGetMidX(self.frame)), y:50)
        exitButton.zPosition = 1.0
        exitButton.size = CGSize(width: 150, height: 40)
        exitButton.name = "exit"
        
        scoreLabel = SKLabelNode(fontNamed: "Copperplate")
        scoreLabel.text = "Score: \(score)"
        scoreLabel.fontSize = 25
        scoreLabel.fontColor = SKColor.blackColor()
        scoreLabel.horizontalAlignmentMode = .Left
        scoreLabel.position = CGPoint(x: 90, y: 112)
        scoreLabel.zPosition = 1.0
        
        roundLabel = SKLabelNode(fontNamed: "Copperplate")
        roundLabel.text = "Score: \(score)"
        roundLabel.fontSize = 25
        roundLabel.fontColor = SKColor.blackColor()
        roundLabel.horizontalAlignmentMode = .Left
        roundLabel.position = CGPoint(x: 90, y: 112)
        roundLabel.zPosition = 1.0
        
        box = SKSpriteNode(imageNamed: boxImages[0])
        box!.position = CGPointMake(x[0], y[0] - 2)
        box!.anchorPoint = CGPointMake(0, 0)
        box!.zPosition = 1.0
        box?.size = CGSize(width: imageWidth, height: boxHeight)
        box!.name = "0"
        
        box1 = SKSpriteNode(imageNamed: boxImages[0])
        box1!.position = CGPointMake(x[1], y[1] - 2)
        box1!.anchorPoint = CGPointMake(0, 0)
        box1!.zPosition = 1.0
        box1?.size = CGSize(width: imageWidth, height: boxHeight)
        box1!.name = "1"
        
        box2 = SKSpriteNode(imageNamed: boxImages[0])
        box2!.position = CGPointMake(x[2], y[2] - 2)
        box2!.anchorPoint = CGPointMake(0, 0)
        box2!.zPosition = 1.0
        box2?.size = CGSize(width: imageWidth, height: boxHeight)
        box2!.name = "2"
        
        box3 = SKSpriteNode(imageNamed: boxImages[0])
        box3!.position = CGPointMake(x[3], y[3] - 2)
        box3!.anchorPoint = CGPointMake(0, 0)
        box3!.zPosition = 1.0
        box3?.size = CGSize(width: imageWidth, height: boxHeight)
        box3!.name = "3"
        
        box4 = SKSpriteNode(imageNamed: boxImages[0])
        box4!.position = CGPointMake(x[4], y[4] - 2)
        box4!.anchorPoint = CGPointMake(0, 0)
        box4!.zPosition = 1.0
        box4?.size = CGSize(width: imageWidth, height: boxHeight)
        box4!.name = "4"
        
        box5 = SKSpriteNode(imageNamed: boxImages[0])
        box5!.position = CGPointMake(x[5], y[5] - 2)
        box5!.anchorPoint = CGPointMake(0, 0)
        box5!.zPosition = 1.0
        box5?.size = CGSize(width: imageWidth, height: boxHeight)
        box5!.name = "5"
        
        box6 = SKSpriteNode(imageNamed: boxImages[0])
        box6!.anchorPoint = CGPointMake(0, 0)
        box6!.position = CGPointMake(x[6], y[6] - 2)
        box6!.zPosition = 1.0
        box6?.size = CGSize(width: imageWidth, height: boxHeight)
        box6!.name = "6"
        
        box7 = SKSpriteNode(imageNamed: boxImages[0])
        box7!.position = CGPointMake(x[7], y[7] - 2)
        box7!.anchorPoint = CGPointMake(0, 0)
        box7!.zPosition = 1.0
        box7?.size = CGSize(width: imageWidth, height: boxHeight)
        box7!.name = "7"
        
        addChild(background)
        addChild(exitButton)
        addChild(scoreLabel)
        addChild(box!)
        addChild(box1!)
        addChild(box2!)
        addChild(box3!)
        addChild(box4!)
        addChild(box5!)
        addChild(box6!)
        addChild(box7!)
        addChild(tile!)
        addChild(tile1!)
        addChild(tile2!)
        addChild(tile3!)
        addChild(tile4!)
        addChild(tile5!)
        addChild(tile6!)
        addChild(tile7!)
        
        let hide = SKAction.hide()
        
        tile?.runAction(hide)
        tile1?.runAction(hide)
        tile2?.runAction(hide)
        tile3?.runAction(hide)
        tile4?.runAction(hide)
        tile5?.runAction(hide)
        tile6?.runAction(hide)
        tile7?.runAction(hide)
        
        
        
    }
    override func update(currentTime: CFTimeInterval) {
        let tileArray: [Tile] = [(tile!), (tile1!), (tile2!), (tile3!), (tile4!), (tile5!), (tile6!), (tile7!)]
        let delta: CFTimeInterval = currentTime - firstTime
        let timeInterval:CFTimeInterval
        
        if picSpeed == 1 {
            timeInterval = 1.6
        }
        else if picSpeed == 2 {
            timeInterval = 1.2
        }
        else if picSpeed == 3 {
            timeInterval = 0.8
        }
        else if picSpeed == 4 {
            timeInterval = 0.4
        }
        else {
            timeInterval = 0.2
        }
        
        if(firstFrame){
            
            firstTime = currentTime
            firstFrame = false
        }
        
        else if(delta >= 4 && timeDifference <= currentTime){
            // show tiles
            if(round > currentPattern.count && !playerTurn && !gameOver){
                if(!currentPattern.isEmpty && index < currentPattern.count){
                    // go through array and show all tiles
                    showTile(currentPattern[index], tileArray: tileArray)
                    
                    index++
                }
                else {
                    addNewTile(tileArray)
                    playerTurn = true
                    playerTurnTime = currentTime + ((CFTimeInterval)(currentPattern.count)*timeInterval*3)
    
                }
            }
                // players turn
            else if(playerTurn){
                print("players turn...")
                print(round)
                index = 0
                
                if(playerTurnTime <= currentTime && !didWin){
                    didWin = false
                    gameOver = true
                    playerTurn = false
                    print ("time has expired")
                }
                else if(didWin) {
                    playerTurn = false
                    didWin = false
                    let bonus = Int(currentTime - playerTurnTime)*2
                    updateScore(round*10)
                    updateScore(bonus)
                    round++
                }
                
            }
            else if(gameOver){
                
                isHighScore(score)
                let testPrint = savedScore.objectForKey("highscore")
                print(testPrint)
                
                let transition = SKTransition.doorsCloseHorizontalWithDuration(0.5)
                let nextScene = PlayScene(size: scene!.size)
                nextScene.scaleMode = .AspectFill
                
                scene?.view?.presentScene(nextScene, transition: transition)
            }
            //remember time and add timInterval
            timeDifference = currentTime + timeInterval
        }
        
    }
    
    func addNewTile(tileArray: [Tile]) {
        
        let hide = SKAction.hide()
        let unhide = SKAction.unhide()
        let rand = Int(arc4random_uniform(8))
        
        let waitDuration:NSTimeInterval
        
        if picSpeed == 1 {
            waitDuration = NSTimeInterval(0.8)
        }
        else if picSpeed == 2 {
            waitDuration = NSTimeInterval(0.6)
        }
        else if picSpeed == 3 {
            waitDuration = NSTimeInterval(0.4)
        }
        else if picSpeed == 4 {
            waitDuration = NSTimeInterval(0.2)
        }
        else {
            waitDuration = NSTimeInterval(0.1)
        }
        
        let showWait = SKAction.waitForDuration(waitDuration)
        let sequence = SKAction.sequence([unhide, showWait, hide])
        
        tileArray[rand].runAction(sequence)
        currentPattern.append(rand)
        print(currentPattern)
        
        
    }
    
    func showTile(tileNum: Int, tileArray: [Tile]) {
        
        let hide = SKAction.hide()
        let unhide = SKAction.unhide()
        let waitDuration:NSTimeInterval
        
        if picSpeed == 1 {
            waitDuration = NSTimeInterval(0.8)
        }
        else if picSpeed == 2 {
            waitDuration = NSTimeInterval(0.6)
        }
        else if picSpeed == 3 {
            waitDuration = NSTimeInterval(0.4)
        }
        else if picSpeed == 4 {
            waitDuration = NSTimeInterval(0.2)
        }
        else {
            waitDuration = NSTimeInterval(0.1)
        }

        let showWait = SKAction.waitForDuration(waitDuration)
        let sequence = SKAction.sequence([unhide, showWait, hide])
        
        
        tileArray[tileNum].runAction(sequence)
        
    }
    
    func updateScore(value:Int) {
        score += value
        scoreLabel.text = "Score: \(score)"
    }
    
    func isHighScore(score: Int) {
        
        if let prevScore = savedScore.objectForKey("highscore") {
            highscoreArray = prevScore as! [Int]
        }
        
        for var i = 0;i < 10;i++ {
            
            if highscoreArray[i] == 0 {
                
                highscoreArray[i] = score
                
                break
            }
            else if score > highscoreArray[i]{
                
                highscoreArray.insert(score, atIndex: i)
                
                break
            }
        }
        savedScore.removeObjectForKey("highscore")
        savedScore.setObject(highscoreArray, forKey: "highscore")
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        super.touchesBegan(touches, withEvent: event)
        
        if let location = touches.first?.locationInNode(self) {
            let touchedNode = nodeAtPoint(location)
            
            if touchedNode.name == "exit" {
                let transition = SKTransition.doorsCloseHorizontalWithDuration(0.0)
                
                let nextScene = WelcomeScene(size: scene!.size)
                nextScene.scaleMode = .AspectFill
                
                scene?.view?.presentScene(nextScene, transition: transition)
                
            }
            if playerTurn == true {
                
                
                if(numberTouch < currentPattern.count || numberTouch == 0){
                    if(touchedNode.name == String(currentPattern[numberTouch])) {
                        print(currentPattern[numberTouch])
                        print(touchedNode.name)
                        numberTouch++
                        updateScore(10)
                        
                        if(touchedNode.name == "0") {
                            box?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        else if(touchedNode.name == "1") {
                            box1?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        else if(touchedNode.name == "2") {
                            box2?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        else if(touchedNode.name == "3") {
                            box3?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        else if(touchedNode.name == "4") {
                            box4?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        else if(touchedNode.name == "5") {
                            box5?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        else if(touchedNode.name == "6") {
                            box6?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        else if(touchedNode.name == "7") {
                            box7?.texture = SKTexture(imageNamed: boxImages[1])
                        }
                        if(numberTouch == currentPattern.count) {
                            didWin = true
                            numberTouch = 0
                        }
                    }
                    else if(touchedNode.name == "background"){
                        
                    }
                    else {
                        playerTurn = false
                        didWin = false
                        gameOver = true
                        print("you lose...")
                    }
                }
                
            }
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesEnded(touches, withEvent: event)
        
        if let location = touches.first?.locationInNode(self){
            let touchedNode = nodeAtPoint(location)
            
            if(touchedNode.name == "0") {
                box?.texture = SKTexture(imageNamed: boxImages[0])
            }
            else if(touchedNode.name == "1") {
                box1?.texture = SKTexture(imageNamed: boxImages[0])
            }
            else if(touchedNode.name == "2") {
                box2?.texture = SKTexture(imageNamed: boxImages[0])
            }
            else if(touchedNode.name == "3") {
                box3?.texture = SKTexture(imageNamed: boxImages[0])
            }
            else if(touchedNode.name == "4") {
                box4?.texture = SKTexture(imageNamed: boxImages[0])
            }
            else if(touchedNode.name == "5") {
                box5?.texture = SKTexture(imageNamed: boxImages[0])
            }
            else if(touchedNode.name == "6") {
                box6?.texture = SKTexture(imageNamed: boxImages[0])
            }
            else if(touchedNode.name == "7") {
                box7?.texture = SKTexture(imageNamed: boxImages[0])
            }
        }
    }
}
