import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var fisherman = SKSpriteNode()
    private var fishermanIdleFrames : [SKTexture] = []
    
    private var snake = SKSpriteNode()
    private var snakeIdleFrames : [SKTexture] = []
    
//    private var rock = SKSpriteNode()
//    private var paper = SKSpriteNode()
//    private var scissors = SKSpriteNode()
//
//    private var jokenpo = SKSpriteNode()
    
//    private var timerBackground = SKSpriteNode()
//    private var timer = SKSpriteNode()
//    private var counter = 0
    
    override func didMove(to view: SKView) {
        
        createBackground()
        
//        createFisherman()
//        animateFisherman()
//
//        createSnake()
//        animateSnake()

    }
    
//    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//
//        if(counter <= 9){
//
//            fishermanChoiceIndex = (fishermanChoiceIndex + 1) % choices.count
//
//            createPicker()
//
//        }
//
//    }
    
    func createBackground(){
        
        let plx1 = SKSpriteNode(imageNamed: "plx-1")
        plx1.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        plx1.size = frame.size
        plx1.zPosition = -50
        plx1.texture?.filteringMode = .nearest
        
        let plx2 = SKSpriteNode(imageNamed: "plx-2")
        plx2.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        plx2.size = frame.size
        plx2.zPosition = -40
        plx2.texture?.filteringMode = .nearest
        
        let plx3 = SKSpriteNode(imageNamed: "plx-3")
        plx3.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        plx3.size = frame.size
        plx3.zPosition = -30
        plx3.texture?.filteringMode = .nearest
        
        
        let plx4 = SKSpriteNode(imageNamed: "plx-4")
        plx4.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        plx4.size = frame.size
        plx4.zPosition = -20
        plx4.texture?.filteringMode = .nearest
        
        let plx5 = SKSpriteNode(imageNamed: "plx-5")
        plx5.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        plx5.size = frame.size
        plx5.zPosition = -10
        plx5.texture?.filteringMode = .nearest
        
        let plx6 = SKSpriteNode(imageNamed: "plx-6")
        plx6.position = CGPoint(x: frame.width / 2, y: frame.height / 2)
        plx6.size = frame.size
        plx6.zPosition = 0
        plx6.texture?.filteringMode = .nearest
    
        addChild(plx1)
        addChild(plx2)
        addChild(plx3)
        addChild(plx4)
        addChild(plx5)
        addChild(plx6)
        
    }

    
//    func createFisherman(){
//
//        let fishermanAnimatedAtlas = SKTextureAtlas(named: "Fisherman")
//        var idleFrames : [SKTexture] = []
//
//        let numImages = fishermanAnimatedAtlas.textureNames.count
//
//        print(numImages)
//
//        for i in 1 ... numImages {
//
//            let fishermanTextureName = "fisher\(i)"
//            idleFrames.append(fishermanAnimatedAtlas.textureNamed(fishermanTextureName))
//
//        }
//
//        fishermanIdleFrames = idleFrames
//
//        let firstFrameTexture = fishermanIdleFrames[0]
//
//        fisherman = SKSpriteNode(texture: firstFrameTexture)
//        fisherman.size = CGSize(width: 28 * 5, height: 34 * 5)
//        fisherman.position = CGPoint(x: frame.maxX * 0.25, y: 85)
//        fisherman.zPosition = 10
//
//        addChild(fisherman)
//
//    }
    
//    func animateFisherman(){
//
//        fisherman.run(SKAction.repeatForever(
//            SKAction.animate(
//                with: fishermanIdleFrames,
//                timePerFrame: 0.2,
//                resize: false,
//                restore: true)))
//
//    }
//
//    func createSnake(){
//
//        let snakeAnimatedAtlas = SKTextureAtlas(named: "Snake")
//        var idleFrames : [SKTexture] = []
//
//        let numImages = snakeAnimatedAtlas.textureNames.count
//
//        for i in 1 ... numImages {
//
//            let snakeTextureName = "snake\(i)"
//            idleFrames.append(snakeAnimatedAtlas.textureNamed(snakeTextureName))
//
//        }
//
//        snakeIdleFrames = idleFrames
//
//        let firstFrameTexture = snakeIdleFrames[0]
//
//        snake = SKSpriteNode(texture: firstFrameTexture)
//        snake.size = CGSize(width: 28 * 6, height: 15 * 6)
//        snake.position = CGPoint(x: frame.maxX * 0.75, y: 45)
//        snake.zPosition = 10
//
//        addChild(snake)
//
//    }
//
//    func animateSnake(){
//
//        snake.run(SKAction.repeatForever(
//            SKAction.animate(
//                with: snakeIdleFrames,
//                timePerFrame: 0.2,
//                resize: false,
//                restore: true)))
//
//    }

}
