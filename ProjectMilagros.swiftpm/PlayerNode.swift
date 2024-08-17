import SpriteKit

public enum PlayerAnimationState {

    case idle, walk, hookin

}

class PlayerNode : SKNode {

    let sprite : SKSpriteNode

    override init() {

        self.sprite = SKSpriteNode(imageNamed: "fisherman_idle1")

        super.init()

        self.addChild(sprite)

        changeAnimation(to: .idle)

    }

    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }

    public func changeAnimation(to state: PlayerAnimationState){

        switch state {

            case .idle:

                sprite.run(.repeatForever(.animate(with: .init(withFormat: "fisherman_idle%@", range: 1 ... 4), timePerFrame: 0.2)))

            break

            case .hookin:
            
                sprite.run(.repeatForever(.animate(with: .init(withFormat: "fisherman_hookin%@", range: 1 ... 3), timePerFrame: 0.2)))
            
            break
            
            case .walk:
            
                sprite.run(.repeatForever(.animate(with: .init(withFormat: "fisherman_walk%@", range: 1 ... 6), timePerFrame: 0.1)))
            
            break

        }


    }

}
