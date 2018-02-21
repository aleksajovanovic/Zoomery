//
//  OptionsScene.swift
//  Zoomery
//
//  Created by Aleksa Jovanovic on 2015-09-27.
//  Copyright © 2015 Aleksa Jovanovic. All rights reserved.
//

import SpriteKit

var singlePicture = false
var sound = true
var picSpeed = 3

class OptionsScene: SKScene {
    
    var picButton1:SKSpriteNode? = nil
    var picButton2:SKSpriteNode? = nil
    var picButtonClicked1:SKSpriteNode? = nil
    var picButtonClicked2:SKSpriteNode? = nil
    var soundButton1:SKSpriteNode? = nil
    var soundButton2:SKSpriteNode? = nil
    var soundButtonClicked1:SKSpriteNode? = nil
    var soundButtonClicked2:SKSpriteNode? = nil
    var speedButton1:SKSpriteNode? = nil
    var speedButton2:SKSpriteNode? = nil
    var speedButton3:SKSpriteNode? = nil
    var speedButton4:SKSpriteNode? = nil
    var speedButton5:SKSpriteNode? = nil
    var speedButtonClicked1:SKSpriteNode? = nil
    var speedButtonClicked2:SKSpriteNode? = nil
    var speedButtonClicked3:SKSpriteNode? = nil
    var speedButtonClicked4:SKSpriteNode? = nil
    var speedButtonClicked5:SKSpriteNode? = nil
    
    
    override func didMoveToView(view: SKView) {
        let labelOffset:CGFloat = 60
        
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
        
        let singlePicLabel = SKLabelNode()
        singlePicLabel.fontName = "Copperplate"
        singlePicLabel.fontColor = SKColor.blackColor()
        singlePicLabel.text = "Picture Mode:"
        singlePicLabel.fontSize = 20
        singlePicLabel.horizontalAlignmentMode = .Center
        singlePicLabel.zPosition = 1.0
        singlePicLabel.position = CGPoint(x: 90, y: (CGRectGetMidY(self.frame)))
        
        picButton1 = SKSpriteNode(imageNamed: "optionsbutton.png")
        picButton1?.size = CGSize(width: 15, height: 15)
        picButton1!.anchorPoint = CGPointMake(0, 0)
        picButton1!.position = CGPoint(x: 200, y: (CGRectGetMidY(self.frame)))
        picButton1!.zPosition = 1.0
        picButton1!.name = "picButton1"
        
        picButton2 = SKSpriteNode(imageNamed: "optionsbutton.png")
        picButton2?.size = CGSize(width: 15, height: 15)
        picButton2!.anchorPoint = CGPointMake(0, 0)
        picButton2!.position = CGPoint(x: 230, y: (CGRectGetMidY(self.frame)))
        picButton2!.zPosition = 1.0
        picButton2!.name = "picButton2"
        
        picButtonClicked1 = SKSpriteNode(imageNamed: "optionsbuttonclick")
        picButtonClicked1?.size = CGSize(width: 15, height: 15)
        picButtonClicked1!.anchorPoint = CGPointMake(0, 0)
        picButtonClicked1!.position = CGPoint(x: 200, y: (CGRectGetMidY(self.frame)))
        picButtonClicked1!.zPosition = 2.0
        picButtonClicked1!.name = "picButtonClicked1"
        
        picButtonClicked2 = SKSpriteNode(imageNamed: "optionsbuttonclick")
        picButtonClicked2?.size = CGSize(width: 15, height: 15)
        picButtonClicked2!.anchorPoint = CGPointMake(0, 0)
        picButtonClicked2!.position = CGPoint(x: 230, y: (CGRectGetMidY(self.frame)))
        picButtonClicked2!.zPosition = 2.0
        picButtonClicked2!.name = "picButtonClicked2"
        
        let soundLabel = SKLabelNode()
        soundLabel.fontName = "Copperplate"
        soundLabel.fontColor = SKColor.blackColor()
        soundLabel.text = "Sound:"
        soundLabel.fontSize = 20
        soundLabel.horizontalAlignmentMode = .Left
        soundLabel.zPosition = 1.0
        soundLabel.position = CGPoint(x: 90, y: (CGRectGetMidY(self.frame)) - labelOffset)
        
        soundButton1 = SKSpriteNode(imageNamed: "optionsbutton.png")
        soundButton1?.size = CGSize(width: 15, height: 15)
        soundButton1!.anchorPoint = CGPointMake(0, 0)
        soundButton1!.position = CGPoint(x: 200, y: (CGRectGetMidY(self.frame)) - labelOffset)
        soundButton1!.zPosition = 1.0
        soundButton1!.name = "soundButton1"
        
        soundButton2 = SKSpriteNode(imageNamed: "optionsbutton.png")
        soundButton2?.size = CGSize(width: 15, height: 15)
        soundButton2!.anchorPoint = CGPointMake(0, 0)
        soundButton2!.position = CGPoint(x: 230, y: (CGRectGetMidY(self.frame)) - labelOffset)
        soundButton2!.zPosition = 1.0
        soundButton2!.name = "soundButton2"
        
        soundButtonClicked1 = SKSpriteNode(imageNamed: "optionsbuttonclick.png")
        soundButtonClicked1?.size = CGSize(width: 15, height: 15)
        soundButtonClicked1!.anchorPoint = CGPointMake(0, 0)
        soundButtonClicked1!.position = CGPoint(x: 200, y: (CGRectGetMidY(self.frame)) - labelOffset)
        soundButtonClicked1!.zPosition = 2.0
        soundButtonClicked1!.name = "soundButtonClicked1"
        
        soundButtonClicked2 = SKSpriteNode(imageNamed: "optionsbuttonclick.png")
        soundButtonClicked2?.size = CGSize(width: 15, height: 15)
        soundButtonClicked2!.anchorPoint = CGPointMake(0, 0)
        soundButtonClicked2!.position = CGPoint(x: 230, y: (CGRectGetMidY(self.frame)) - labelOffset)
        soundButtonClicked2!.zPosition = 2.0
        soundButtonClicked2!.name = "soundButtonClicked2"
        
        let speedLabel = SKLabelNode()
        speedLabel.fontName = "Copperplate"
        speedLabel.fontColor = SKColor.blackColor()
        speedLabel.text = "Speed:"
        speedLabel.fontSize = 20
        speedLabel.horizontalAlignmentMode = .Left
        speedLabel.zPosition = 1.0
        speedLabel.position = CGPoint(x: 90, y: (CGRectGetMidY(self.frame)) - (labelOffset*2))
        
        speedButton1 = SKSpriteNode(imageNamed: "speedbar1")
        speedButton1?.size = CGSize(width: 20, height: 20)
        speedButton1!.anchorPoint = CGPointMake(0, 0)
        speedButton1!.position = CGPoint(x: 200, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButton1!.zPosition = 1.0
        speedButton1!.name = "speedButton1"
        
        speedButton2 = SKSpriteNode(imageNamed: "speedbar2")
        speedButton2?.size = CGSize(width: 20, height: 35)
        speedButton2!.anchorPoint = CGPointMake(0, 0)
        speedButton2!.position = CGPoint(x: 230, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButton2!.zPosition = 1.0
        speedButton2!.name = "speedButton2"
        
        speedButton3 = SKSpriteNode(imageNamed: "speedbar3")
        speedButton3?.size = CGSize(width: 20, height: 50)
        speedButton3!.anchorPoint = CGPointMake(0, 0)
        speedButton3!.position = CGPoint(x: 260, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButton3!.zPosition = 1.0
        speedButton3!.name = "speedButton3"
        
        speedButton4 = SKSpriteNode(imageNamed: "speedbar4")
        speedButton4?.size = CGSize(width: 20, height: 65)
        speedButton4!.anchorPoint = CGPointMake(0, 0)
        speedButton4!.position = CGPoint(x: 290, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButton4!.zPosition = 1.0
        speedButton4!.name = "speedButton4"
        
        speedButton5 = SKSpriteNode(imageNamed: "speedbar5")
        speedButton5?.size = CGSize(width: 20, height: 80)
        speedButton5!.anchorPoint = CGPointMake(0, 0)
        speedButton5!.position = CGPoint(x: 320, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButton5!.zPosition = 1.0
        speedButton5!.name = "speedButton5"
        
        speedButtonClicked1 = SKSpriteNode(imageNamed: "speedbarclicked1")
        speedButtonClicked1?.size = CGSize(width: 20, height: 20)
        speedButtonClicked1!.anchorPoint = CGPointMake(0, 0)
        speedButtonClicked1!.position = CGPoint(x: 200, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButtonClicked1!.zPosition = 2.0
        speedButtonClicked1!.name = "speedButtonClicked1"
        
        speedButtonClicked2 = SKSpriteNode(imageNamed: "speedbarclicked2")
        speedButtonClicked2?.size = CGSize(width: 20, height: 35)
        speedButtonClicked2!.anchorPoint = CGPointMake(0, 0)
        speedButtonClicked2!.position = CGPoint(x: 230, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButtonClicked2!.zPosition = 2.0
        speedButtonClicked2!.name = "speedButtonClicked2"
        
        speedButtonClicked3 = SKSpriteNode(imageNamed: "speedbarclicked3")
        speedButtonClicked3?.size = CGSize(width: 20, height: 50)
        speedButtonClicked3!.anchorPoint = CGPointMake(0, 0)
        speedButtonClicked3!.position = CGPoint(x: 260, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButtonClicked3!.zPosition = 2.0
        speedButtonClicked3!.name = "speedButtonClicked3"
        
        speedButtonClicked4 = SKSpriteNode(imageNamed: "speedbarclicked4")
        speedButtonClicked4?.size = CGSize(width: 20, height: 65)
        speedButtonClicked4!.anchorPoint = CGPointMake(0, 0)
        speedButtonClicked4!.position = CGPoint(x: 290, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButtonClicked4!.zPosition = 2.0
        speedButtonClicked4!.name = "speedButtonClicked4"
        
        speedButtonClicked5 = SKSpriteNode(imageNamed: "speedbarclicked5")
        speedButtonClicked5?.size = CGSize(width: 20, height: 80)
        speedButtonClicked5!.anchorPoint = CGPointMake(0, 0)
        speedButtonClicked5!.position = CGPoint(x: 320, y: (CGRectGetMidY(self.frame)) - labelOffset*2)
        speedButtonClicked5!.zPosition = 2.0
        speedButtonClicked5!.name = "speedButtonClicked5"
        
        addChild(exitButton)
        addChild(background)
        addChild(singlePicLabel)
        addChild(soundLabel)
        addChild(speedLabel)
        addChild(picButton1!)
        addChild(picButton2!)
        addChild(picButtonClicked1!)
        addChild(picButtonClicked2!)
        addChild(soundButton1!)
        addChild(soundButton2!)
        addChild(soundButtonClicked1!)
        addChild(soundButtonClicked2!)
        addChild(speedButton1!)
        addChild(speedButton2!)
        addChild(speedButton3!)
        addChild(speedButton4!)
        addChild(speedButton5!)
        addChild(speedButtonClicked1!)
        addChild(speedButtonClicked2!)
        addChild(speedButtonClicked3!)
        addChild(speedButtonClicked4!)
        addChild(speedButtonClicked5!)
        
        let hide = SKAction.hide()
        let show = SKAction.unhide()
        
        if singlePicture == false{
            picButtonClicked2!.runAction(hide)
            picButtonClicked1!.runAction(show)
        }
        else{
            picButtonClicked2!.runAction(show)
            picButtonClicked1!.runAction(hide)
        }
        
        if sound == false{
            soundButtonClicked2!.runAction(hide)
            soundButtonClicked1!.runAction(show)
        }
        else{
            soundButtonClicked2!.runAction(show)
            soundButtonClicked2!.runAction(hide)
        }
        
        if picSpeed == 1{
            speedButtonClicked1?.runAction(show)
            speedButtonClicked2?.runAction(hide)
            speedButtonClicked3?.runAction(hide)
            speedButtonClicked4?.runAction(hide)
            speedButtonClicked5?.runAction(hide)
        }
        else if picSpeed == 2{
            speedButtonClicked1?.runAction(show)
            speedButtonClicked2?.runAction(show)
            speedButtonClicked3?.runAction(hide)
            speedButtonClicked4?.runAction(hide)
            speedButtonClicked5?.runAction(hide)
        }
        else if picSpeed == 3{
            speedButtonClicked1?.runAction(show)
            speedButtonClicked2?.runAction(show)
            speedButtonClicked3?.runAction(show)
            speedButtonClicked4?.runAction(hide)
            speedButtonClicked5?.runAction(hide)
        }
        else if picSpeed == 4{
            speedButtonClicked1?.runAction(show)
            speedButtonClicked2?.runAction(show)
            speedButtonClicked3?.runAction(show)
            speedButtonClicked4?.runAction(show)
            speedButtonClicked5?.runAction(hide)
        }
        else{
            speedButtonClicked1?.runAction(show)
            speedButtonClicked2?.runAction(show)
            speedButtonClicked3?.runAction(show)
            speedButtonClicked4?.runAction(show)
            speedButtonClicked5?.runAction(show)
        }
       
        
        
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        let hide = SKAction.hide()
        let show = SKAction.unhide()
        
        super.touchesBegan(touches, withEvent: event)
        
        if let location = touches.first?.locationInNode(self) {
            let touchedNode = nodeAtPoint(location)
            
            if touchedNode.name == "exit" {
                let transition = SKTransition.doorsCloseHorizontalWithDuration(0.0)
                
                let nextScene = WelcomeScene(size: scene!.size)
                nextScene.scaleMode = .AspectFill
                
                scene?.view?.presentScene(nextScene, transition: transition)
                
            }
            else if touchedNode.name == "picButton1" {
                picButtonClicked1?.runAction(show)
                picButtonClicked2?.runAction(hide)
                singlePicture = false
            }
            else if touchedNode.name == "picButton2" {
                picButtonClicked2?.runAction(show)
                picButtonClicked1?.runAction(hide)
                singlePicture = true
            }
            else if touchedNode.name == "soundButton1" {
                soundButtonClicked1?.runAction(show)
                soundButtonClicked2?.runAction(hide)
                sound = false
            }
            else if touchedNode.name == "soundButton2" {
                soundButtonClicked1?.runAction(hide)
                soundButtonClicked2?.runAction(show)
                sound = true
            }
            else if touchedNode.name == "speedButton1" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(hide)
                speedButtonClicked3?.runAction(hide)
                speedButtonClicked4?.runAction(hide)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 1
            }
            else if touchedNode.name == "speedButton2" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(hide)
                speedButtonClicked4?.runAction(hide)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 2
            }
            else if touchedNode.name == "speedButton3" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(show)
                speedButtonClicked4?.runAction(hide)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 3
            }
            else if touchedNode.name == "speedButton4" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(show)
                speedButtonClicked4?.runAction(show)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 4
            }
            else if touchedNode.name == "speedButton5" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(show)
                speedButtonClicked4?.runAction(show)
                speedButtonClicked5?.runAction(show)
                
                picSpeed = 5
            }
            else if touchedNode.name == "speedButtonClicked1" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(hide)
                speedButtonClicked3?.runAction(hide)
                speedButtonClicked4?.runAction(hide)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 1
            }
            else if touchedNode.name == "speedButtonClicked2" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(hide)
                speedButtonClicked4?.runAction(hide)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 2
            }
            else if touchedNode.name == "speedButtonClicked3" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(show)
                speedButtonClicked4?.runAction(hide)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 3
            }
            else if touchedNode.name == "speedButtonClicked4" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(show)
                speedButtonClicked4?.runAction(show)
                speedButtonClicked5?.runAction(hide)
                
                picSpeed = 4
            }
            else if touchedNode.name == "speedButtonClicked5" {
                speedButtonClicked1?.runAction(show)
                speedButtonClicked2?.runAction(show)
                speedButtonClicked3?.runAction(show)
                speedButtonClicked4?.runAction(show)
                speedButtonClicked5?.runAction(show)
                
                picSpeed = 5
            }
        }
    }
}

