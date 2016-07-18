//
//  GameScene.swift
//  Load Levels
//
//  Created by mitchell hudson on 7/11/16.
//  Copyright (c) 2016 mitchell hudson. All rights reserved.
//


/*

	This examle loads "game levels" from individual sks files. 
	It then copies these and adds them to nodes which scroll by. 
	As each node is recycled we choose a random "game level" and
	remove the previous "game level"

*/


import SpriteKit

class GameScene: SKScene {
    
    var background_1: SKSpriteNode!
    var background_2: SKSpriteNode!
    var level_1: SKNode!
    var level_2: SKNode!
    var level_3: SKNode!
	var levels = [SKNode]()
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        background_1 = childNodeWithName("background_1") as! SKSpriteNode
        background_2 = childNodeWithName("background_2") as! SKSpriteNode
        
        let scene_1 = Level(fileNamed: "Level_1")!
        let scene_2 = Level(fileNamed: "Level_2")!
        let scene_3 = Level(fileNamed: "Level_3")!
		
        level_1 = scene_1.childNodeWithName("scene")!
        level_1.removeFromParent()
		level_2 = scene_2.childNodeWithName("scene")!
		level_2.removeFromParent()
		level_3 = scene_3.childNodeWithName("scene")!
		level_3.removeFromParent()
		
		level_1.name = "level"
		level_2.name = "level"
		level_3.name = "level"
		
		levels = [level_1, level_2, level_3]
		
        background_1.addChild(level_1)
		background_2.addChild(level_2)
    }
	
	
	
	func getRandomLevelForNode(node: SKNode) {
		node.childNodeWithName("level")?.removeFromParent()
		let levelNode = levels[Int(arc4random()) % levels.count].copy() as! SKNode
		node.addChild(levelNode)
	}
	
	
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        background_1.position.x -= 5
        if background_1.position.x < -667 {
            background_1.position.x += 667 * 2
			getRandomLevelForNode(background_1)
        }
        
        background_2.position.x -= 5
        if background_2.position.x < -667 {
            background_2.position.x += 667 * 2
			getRandomLevelForNode(background_2)
        }
    }
}


