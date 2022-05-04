import Foundation
import SpriteKit

public enum FishAnimationState {
    
    case idle, swim, dead
    
}

class FishNode : SKNode {
    
    let sprite: SKSpriteNode
    
    override init() {
    
        self.sprite = SKSpriteNode(imageNamed: "fish_idle1")

        super.init()

        self.addChild(sprite)

        changeAnimation(to: .idle)

    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }

    public func changeAnimation(to state: FishAnimationState){

        switch state {

            case .idle, .swim:

                sprite.run(.repeatForever(.animate(with: .init(withFormat: "fish_idle%@", range: 1 ... 2), timePerFrame: 0.1)))

            break
            
            case .dead:
            
                sprite.run(.repeatForever(.animate(with: .init(withFormat: "fish_dead%@", range: 1 ... 2), timePerFrame: 0.1)))

            break

        }

    }
    
}
