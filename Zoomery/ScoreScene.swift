//
//  ScoreScene.swift
//  Zoomery
//
//  Created by Aleksa Jovanovic on 2015-09-27.
//  Copyright © 2015 Aleksa Jovanovic. All rights reserved.
//

import SpriteKit

class ScoreScene: SKScene {
   
    override func didMoveToView(view: SKView) {
        let exitButton = SKSpriteNode(imageNamed: "exit.png")
        exitButton.position = CGPoint(x:(CGRectGetMidX(self.frame)), y:50)
        exitButton.zPosition = 1.0
        exitButton.size = CGSize(width: 150, height: 40)
        exitButton.name = "exit"
        
        let background = SKSpriteNode(imageNamed: "frontpage.png")
        background.position = CGPoint(x:0, y:0)
        background.zPosition = 0.0
        background.anchorPoint = CGPoint(x:0.0, y:0.0)
        background.size = view.bounds.size
        
        let offset:CGFloat = 35
        
        let highscores = NSUserDefaults.standardUserDefaults()
        var highscoreArray = [Int](count: 10, repeatedValue: 0)
        highscoreArray = highscores.objectForKey("highscore") as! [Int]
        
        let highscore0 = SKLabelNode()
        highscore0.fontName = "Copperplate"
        highscore0.fontColor = SKColor.blackColor()
        highscore0.text = "\(highscoreArray[0])"
        highscore0.fontSize = 35
        highscore0.horizontalAlignmentMode = .Center
        highscore0.zPosition = 1.0
        highscore0.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450)
        
        let highscore1 = SKLabelNode()
        highscore1.fontName = "Copperplate"
        highscore1.fontColor = SKColor.blackColor()
        highscore1.text = "\(highscoreArray[1])"
        highscore1.fontSize = 35
        highscore1.horizontalAlignmentMode = .Center
        highscore1.zPosition = 1.0
        highscore1.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset)
        
        let highscore2 = SKLabelNode()
        highscore2.fontName = "Copperplate"
        highscore2.fontColor = SKColor.blackColor()
        highscore2.text = "\(highscoreArray[2])"
        highscore2.fontSize = 35
        highscore2.horizontalAlignmentMode = .Center
        highscore2.zPosition = 1.0
        highscore2.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*2)
        
        let highscore3 = SKLabelNode()
        highscore3.fontName = "Copperplate"
        highscore3.fontColor = SKColor.blackColor()
        highscore3.text = "\(highscoreArray[3])"
        highscore3.fontSize = 35
        highscore3.horizontalAlignmentMode = .Center
        highscore3.zPosition = 1.0
        highscore3.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*3)
        
        let highscore4 = SKLabelNode()
        highscore4.fontName = "Copperplate"
        highscore4.fontColor = SKColor.blackColor()
        highscore4.text = "\(highscoreArray[4])"
        highscore4.fontSize = 35
        highscore4.horizontalAlignmentMode = .Center
        highscore4.zPosition = 1.0
        highscore4.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*4)
        
        let highscore5 = SKLabelNode()
        highscore5.fontName = "Copperplate"
        highscore5.fontColor = SKColor.blackColor()
        highscore5.text = "\(highscoreArray[5])"
        highscore5.fontSize = 35
        highscore5.horizontalAlignmentMode = .Center
        highscore5.zPosition = 1.0
        highscore5.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*5)
        
        let highscore6 = SKLabelNode()
        highscore6.fontName = "Copperplate"
        highscore6.fontColor = SKColor.blackColor()
        highscore6.text = "\(highscoreArray[6])"
        highscore6.fontSize = 35
        highscore6.horizontalAlignmentMode = .Center
        highscore6.zPosition = 1.0
        highscore6.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*6)
        
        let highscore7 = SKLabelNode()
        highscore7.fontName = "Copperplate"
        highscore7.fontColor = SKColor.blackColor()
        highscore7.text = "\(highscoreArray[7])"
        highscore7.fontSize = 35
        highscore7.horizontalAlignmentMode = .Center
        highscore7.zPosition = 1.0
        highscore7.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*7)
        
        let highscore8 = SKLabelNode()
        highscore8.fontName = "Copperplate"
        highscore8.fontColor = SKColor.blackColor()
        highscore8.text = "\(highscoreArray[8])"
        highscore8.fontSize = 35
        highscore8.horizontalAlignmentMode = .Center
        highscore8.zPosition = 1.0
        highscore8.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*8)
        
        let highscore9 = SKLabelNode()
        highscore9.fontName = "Copperplate"
        highscore9.fontColor = SKColor.blackColor()
        highscore9.text = "\(highscoreArray[9])"
        highscore9.fontSize = 35
        highscore9.horizontalAlignmentMode = .Center
        highscore9.zPosition = 1.0
        highscore9.position = CGPoint(x: CGRectGetMidX(self.frame), y: 450 - offset*9)
        
        addChild(exitButton)
        addChild(background)
        addChild(highscore0)
        addChild(highscore1)
        addChild(highscore2)
        addChild(highscore3)
        addChild(highscore4)
        addChild(highscore5)
        addChild(highscore6)
        addChild(highscore7)
        addChild(highscore8)
        addChild(highscore9)
        
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
        }
    }
}

