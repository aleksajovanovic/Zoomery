//
//  WelcomeScene.swift
//  Zoomery
//
//  Created by Aleksa Jovanovic on 2015-09-27.
//  Copyright © 2015 Aleksa Jovanovic. All rights reserved.
//

import SpriteKit

var firstStart = true

class WelcomeScene: SKScene {
    
    let playButtonImages: [String] = [("playbutton1.png"),("playbutton2.png")]
    let scoresButtonImages: [String] = [("mainmenu1.png"),("playpressed.png")]
    let settingsButtonImages: [String] = [("settings.png"),("playpressed.png")]
    let creditsButtonImages: [String] = [("credits.png"),("playpressed.png")]
    
    let playButton = SKSpriteNode()
    let scoresButton = SKSpriteNode()
    let settingsButton = SKSpriteNode()
    let creditsButton = SKSpriteNode()
    
    var baseSpeed:CGFloat = 50
    var baseWiggle:CGFloat = 1
    let buttonOffset: CGFloat = 60;
    
    var nextSceneReady = false
    
    override func didMoveToView(view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "titlepage.png")
        background.position = CGPoint(x:0, y:0)
        background.zPosition = 0.0
        background.anchorPoint = CGPoint(x:0.0, y:0.0)
        background.size = view.bounds.size
        
        buttonsUp()
        
        playButton.texture = SKTexture(imageNamed: playButtonImages[0])
        playButton.zPosition = 1.0
        playButton.size = CGSize(width: 150, height: 40)
        playButton.name = "play";
        
            
            //playButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:(CGRectGetMidY(self.frame)))
            
        
        
        scoresButton.texture = SKTexture(imageNamed: scoresButtonImages[0])
        scoresButton.zPosition = 1.0
        scoresButton.size = CGSize(width: 150, height: 40)
        scoresButton.name = "scores";
       
            
            //scoresButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:((CGRectGetMidY(self.frame))-buttonOffset))
            
        
        
        settingsButton.texture = SKTexture(imageNamed: settingsButtonImages[0])
        settingsButton.zPosition = 1.0
        settingsButton.size = CGSize(width: 150, height: 40)
        settingsButton.name = "settings";
        
        
            
            //settingsButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:((CGRectGetMidY(self.frame))-buttonOffset*2))
            
        
        
        creditsButton.texture = SKTexture(imageNamed: creditsButtonImages[0])
        creditsButton.zPosition = 1.0
        creditsButton.size = CGSize(width: 150, height: 40)
        creditsButton.name = "credits";
        
       
       
            
            //creditsButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:((CGRectGetMidY(self.frame))-buttonOffset*3))
            
        
        
        
        addChild(background)
        addChild(playButton)
        addChild(scoresButton)
        addChild(settingsButton)
        addChild(creditsButton)
        
        
 

    }
    
    func buttonsUp() {
        
        playButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:-19)
        let moveUp = SKAction.moveToY(CGRectGetMidY(self.frame), duration: 0.4)
        playButton.runAction(moveUp)
        
        scoresButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:-19)
        let moveUp1 = SKAction.moveToY(CGRectGetMidY(self.frame)-buttonOffset, duration: 0.4)
        let moveWait = SKAction.waitForDuration(0.2)
        let sequence1 = SKAction.sequence([moveWait, moveUp1])
        scoresButton.runAction(sequence1)
        
        settingsButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:-19)
        let moveUp2 = SKAction.moveToY(CGRectGetMidY(self.frame)-buttonOffset*2, duration: 0.4)
        let moveWait1 = SKAction.waitForDuration(0.35)
        let sequence2 = SKAction.sequence([moveWait1, moveUp2])
        settingsButton.runAction(sequence2)
        
        creditsButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:-19)
        let moveUp3 = SKAction.moveToY(CGRectGetMidY(self.frame)-buttonOffset*3, duration: 0.4)
        let moveWait2 = SKAction.waitForDuration(0.5)
        let sequence3 = SKAction.sequence([moveWait2, moveUp3])
        creditsButton.runAction(sequence3)

        
    }
    
    func buttonsDown(){
        
        creditsButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-buttonOffset*3)
        let moveDown3 = SKAction.moveToY(-19, duration: 0.4)
        creditsButton.runAction(moveDown3)
        
        settingsButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-buttonOffset*2)
        let moveDown1 = SKAction.moveToY(-19, duration: 0.4)
        let moveWait = SKAction.waitForDuration(0.2)
        let sequence1 = SKAction.sequence([moveWait, moveDown1])
        settingsButton.runAction(sequence1)
        
        scoresButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame)-buttonOffset)
        let moveDown2 = SKAction.moveToY(-19, duration: 0.4)
        let moveWait1 = SKAction.waitForDuration(0.35)
        let sequence2 = SKAction.sequence([moveWait1, moveDown2])
        scoresButton.runAction(sequence2)
        
        playButton.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        let moveDown = SKAction.moveToY(-19, duration: 0.4)
        let moveWait2 = SKAction.waitForDuration(0.5)
        let sequence3 = SKAction.sequence([moveWait2, moveDown])
        playButton.runAction(sequence3, completion: {
            
           //self.nextSceneReady = true
            
            let transition = SKTransition.doorsCloseHorizontalWithDuration(0.0)
            let nextScene = PlayScene(size: self.scene!.size)
            
            nextScene.scaleMode = .AspectFill
            self.scene?.view?.presentScene(nextScene, transition: transition)
            
        })
        
    }
    
    override func update(currentTime: NSTimeInterval) {
       
        if playButton.position.y == CGRectGetMidY(self.frame) {
            
            animateWiggle(playButton)
            
        }
        if scoresButton.position.y == CGRectGetMidY(self.frame)-buttonOffset {
            
            animateWiggle(scoresButton)
            
        }
        if settingsButton.position.y == CGRectGetMidY(self.frame)-buttonOffset*2 {
            
            animateWiggle(settingsButton)
            
        }
        if creditsButton.position.y == CGRectGetMidY(self.frame)-buttonOffset*3 {
            
            animateWiggle(creditsButton)
            firstStart = false
            
        }
        
        
    
    }
    
    func animateWiggle(button:SKSpriteNode) {
        
        let wait = SKAction.waitForDuration(0.04)
        
        let up3 = SKAction.moveToY(button.position.y+3, duration: 0.04)
        let down5 = SKAction.moveToY(button.position.y-5, duration: 0.04)
        let up_3 = SKAction.moveToY(button.position.y+3, duration: 0.04)
        let down1 = SKAction.moveToY(button.position.y-1, duration: 0.04)
        
        let sequence = SKAction.sequence([up3, wait, down5, wait, up_3, wait, down1])
        button.runAction(sequence)
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches, withEvent: event)
        
        if let location = touches.first?.locationInNode(self) {
            let touchedNode = nodeAtPoint(location)
        
            if touchedNode.name == "play" {
                playButton.texture = SKTexture(imageNamed: playButtonImages[1])
                
            }
            
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
       
        playButton.texture = SKTexture(imageNamed: playButtonImages[0])
        
        super.touchesEnded(touches, withEvent: event)
        
        if firstStart == false {
        
            if let location = touches.first?.locationInNode(self) {
                let touchedNode = nodeAtPoint(location)
            
                
                if touchedNode.name == "play" {
                    
                    buttonsDown()
                
                }
                else if touchedNode.name == "scores" {
                    let transition = SKTransition.doorsCloseHorizontalWithDuration(0.0)
                
                    let nextScene = ScoreScene(size: scene!.size)
                    nextScene.scaleMode = .AspectFill
                
                    scene?.view?.presentScene(nextScene, transition: transition)
                }
                else if touchedNode.name == "settings" {
                    let transition = SKTransition.doorsCloseHorizontalWithDuration(0.0)
                
                    let nextScene = OptionsScene(size: scene!.size)
                    nextScene.scaleMode = .AspectFill
                
                    scene?.view?.presentScene(nextScene, transition: transition)
                }
                else if touchedNode.name == "credits" {
                
                }
            }
        }
        
    }
}

