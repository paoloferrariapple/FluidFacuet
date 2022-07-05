import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var backGround: SKSpriteNode!
    var faucet: SKSpriteNode!
    var openFaucet: Bool = false
    var droplet: SKSpriteNode!
    
    
    override func didMove(to view: SKView) {
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: UIEdgeInsets(top: 167, left: 235, bottom: 50, right: 235)))
        
        //Background
        let backGround = SKSpriteNode(imageNamed: "Background")
        backGround.position = CGPoint(x: 0, y: 0)
        backGround.scale(to: CGSize(width: 750, height: 1334))
        backGround.zPosition = -1
        addChild(backGround)
        
        //faucet button
        faucet = SKSpriteNode (imageNamed: "Arrow")
        faucet.position = CGPoint(x:80, y:50)
        faucet.size = CGSize (width: 55, height: 55)
        faucet.name = "Left"
        faucet.zRotation = .pi / 2
        faucet.zPosition = 10
        addChild(faucet)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "Left") {
                openFaucet = true
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.location(in: self)
            let node = self.atPoint(location)
            
            if (node.name == "Left") {
                openFaucet = false
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        
        if openFaucet {
            droplet = SKSpriteNode(imageNamed: "Droplet")
            droplet.position = CGPoint(x: 70, y: 100)
            droplet.scale(to: CGSize(width: 10, height: 10))
            droplet.physicsBody = SKPhysicsBody(rectangleOf: droplet.size)
            droplet.physicsBody?.restitution = 0.6
            droplet.physicsBody?.friction = 0
            addChild(droplet)
        }
    }
}


// 375*2 = 750
// 667*2 = 1334
