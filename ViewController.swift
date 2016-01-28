//
//  ViewController.swift
//  HeartAnimation
//
//  Created by Arjun Kodur on 1/28/16.
//  Copyright © 2016 Arjun Kodur. All rights reserved.
//


import UIKit
import SpriteKit

let heartHeight: CGFloat = 18.0
let heartsFile = "heart-bubbles.sks"

class HeartBubblesScene : SKScene {
    var emitter: SKEmitterNode?
    
    override func didMoveToView(view: SKView) {
        scaleMode = .ResizeFill // make scene's size == view's size
        backgroundColor = UIColor.whiteColor()
    }
    
    func beginBubbling() {
        
        emitter = SKEmitterNode(fileNamed: heartsFile)
        
        let x = floor(size.width / 2.0)
        let y = heartHeight
        
        emitter!.position = CGPointMake(x, y)
        
        emitter!.name = "heart-bubbles"
        emitter!.targetNode = self
        
        emitter?.numParticlesToEmit = 1
        
        addChild(emitter!)
        
        emitter?.resetSimulation()
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var heartBubblesView: SKView!
    
    @IBOutlet weak var label: UILabel!
    
    let heartBubblesScene = HeartBubblesScene()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        heartBubblesView.presentScene(heartBubblesScene)
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        heartBubblesScene.beginBubbling()
        
        label.text = ""
        
    }
    
}


