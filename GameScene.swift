import SpriteKit
import GameplayKit

public let Y_GROUND: CGFloat = 39
public let ZPOSITION_BASE: CGFloat = 0

public let GROUND_MIN_X: CGFloat = 15
public let GROUND_MAX_X: CGFloat = 140

public let RIVER_MIN_X: CGFloat = GROUND_MAX_X + 30
public let RIVER_MAX_X: CGFloat = 225

public let HOOK_COUNT = Int.random(in: 15 ... 35)

class GameScene: SKScene {
    
//    private var backgroundSound: SKAudioNode?
    
    private var player: PlayerNode?
    private var playerDirection: CGFloat = 0
    private var playerVelocity: CGFloat = 1
    
    private var fish: FishNode?
    private var fishDirection: CGFloat = 1
    private var fishVelocity: CGFloat = 0.5
    
    private var hookBtn: SKButtonNode?
    private var fishingState: Int = 0 // 0 = off | 1 = ongoing | 2 = success | 3 = failure
    private var hookBtnCount: Int = 0
    
    private var textbox: SKSpriteNode?
    private var introText: SKSpriteNode?
    private var tutorialText: SKSpriteNode?
    private var endingText: SKSpriteNode?
    
    private var leftBtn: SKButtonNode?
    private var rightBtn: SKButtonNode?
    private var startBtn: SKButtonNode?
    
    override func didMove(to view: SKView) {
        
        setupScene()

    }
    
    public func setupScene() {
        
        createBackgroundSound()
        createBackground()
        createTextboxes()
        createPlayer()
        createButtons()
        createFish()
        
    }
    
    public func createBackgroundSound(){
        
        let backgroundSound = SKAudioNode(fileNamed: "bg_sound.mp3")
        
//        self.backgroundSound = backgroundSound
        
        self.addChild(backgroundSound)
        
    }
    
    public func createBackground(){
        
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
    
    public func createTextboxes() {
        
        self.textbox = SKSpriteNode(imageNamed: "textbox")
        self.textbox?.texture?.filteringMode = .nearest
        self.textbox?.size = CGSize(width: 150, height: 50)
        self.textbox?.position = CGPoint(x: frame.width / 2, y: frame.height - 35)
        self.textbox?.zPosition = ZPOSITION_BASE
        
        self.addChild(textbox!)
        self.textbox?.isHidden = true
        
        endingText = SKSpriteNode(imageNamed: "ending_text")
        self.endingText?.texture?.filteringMode = .nearest
        self.endingText?.size = CGSize(width: 125, height: 30)
        self.endingText?.position = CGPoint(x: frame.width / 2, y: frame.height - 35)
        self.endingText?.zPosition = ZPOSITION_BASE + 10
        
        self.addChild(endingText!)
        self.endingText?.isHidden = true
        
        self.tutorialText = SKSpriteNode(imageNamed: "tutorial_text")
        self.tutorialText?.texture?.filteringMode = .nearest
        self.tutorialText?.size = CGSize(width: 125, height: 30)
        self.tutorialText?.position = CGPoint(x: frame.width / 2, y: frame.height - 35)
        self.tutorialText?.zPosition = ZPOSITION_BASE + 10
        
        self.addChild(tutorialText!)
        self.tutorialText?.isHidden = true
        
        introText = SKSpriteNode(imageNamed: "intro_text")
        self.introText?.texture?.filteringMode = .nearest
        self.introText?.size = CGSize(width: 125, height: 30)
        self.introText?.position = CGPoint(x: frame.width / 2, y: frame.height - 35)
        self.introText?.zPosition = ZPOSITION_BASE + 10
        
        self.addChild(introText!)
        self.introText?.isHidden = true
        
    }
    
    public func createPlayer() {
        
        self.player = PlayerNode()
        
        self.player?.position.x = frame.width / 9
        self.player?.position.y = Y_GROUND
        self.player?.zPosition = ZPOSITION_BASE
        
        self.addChild(self.player!)
        
    }
    
    public func createFish() {
        
        self.fish = FishNode()
        
        self.fish?.position.x = frame.maxX - 67
        self.fish?.position.y = Y_GROUND - 27
        self.fish?.zPosition = ZPOSITION_BASE + 10
        
        self.addChild(self.fish!)
        
    }
    
    public func createButtons() {
            
        leftBtn = SKButtonNode(imageNamed: "arrow_btn", clickAction: { [weak self] in
            
            self?.playerDirection = -1
            self?.player?.changeAnimation(to: .walk)
            
        }, unclickAction: { [weak self] in
            
            self?.playerDirection = 0
            self?.player?.changeAnimation(to: .idle)
            
        })
        
        self.leftBtn?.position = .init(x: frame.minX + 20, y: frame.maxY - 20)
        
        self.addChild(self.leftBtn!)
        self.leftBtn?.isHidden = true
        
        rightBtn = SKButtonNode(imageNamed: "arrow_btn", clickAction: { [weak self] in
            
            self?.playerDirection = 1
            self?.player?.changeAnimation(to: .walk)
            
        }, unclickAction: { [weak self] in
            
            self?.playerDirection = 0
            self?.player?.changeAnimation(to: .idle)
            
        })
        
        self.rightBtn?.position = .init(x: frame.maxX - 20, y: frame.maxY - 20)
        self.rightBtn?.xScale = -1
        
        self.addChild(self.rightBtn!)
        self.rightBtn?.isHidden = true
        
        self.hookBtn = SKButtonNode(imageNamed: "hook_btn", clickAction: { [weak self] in
            
            if(self?.fishingState == 0){
                
                self?.introText?.removeFromParent()
                
                self?.player?.changeAnimation(to: .hookin)
                
                if(((self?.fish?.position.x)! <= (RIVER_MIN_X + 5)) &&
                   (self?.fishDirection == -1)){
                    
                    print("Fisgou!")
                    self?.player?.changeAnimation(to: .hookin)
                    self?.fishingState = 1
                    
                    self?.fishVelocity = 0
                    
                }
                
            }
            
        }, unclickAction: { [weak self] in
            
            if(self?.fishingState == 1){
            
                self?.hookBtnCount += 1
                
            }else{
                
                self?.player?.changeAnimation(to: .idle)
                
            }
            
        })
        
        self.hookBtn?.image.size = CGSize(width: 15, height: 15)
        self.hookBtn?.position = .init(x: GROUND_MAX_X, y: frame.height / 2 - 10)
        
        self.addChild(self.hookBtn!)
        self.hookBtn?.isHidden = true
        
        startBtn = SKButtonNode(imageNamed: "start_btn", clickAction: { [weak self] in
            
            self?.leftBtn?.isHidden = false
            self?.rightBtn?.isHidden = false
            self?.textbox?.isHidden = false
            self?.introText?.isHidden = false
            
            self?.startBtn?.isHidden = true
            
        })
        
        self.startBtn?.position = .init(x: frame.width / 2, y: frame.height / 3)
        self.addChild(startBtn!)
    
    }
    
    public override func update(_ currentTime: TimeInterval) {
        
        // Player
        
        let playerPosition = (self.player?.position.x)!
        
        if(Int(playerPosition) < Int(GROUND_MAX_X)){
            
            self.hookBtn?.isHidden = true
            
        }else{
            
            self.introText?.isHidden = true
            self.tutorialText?.isHidden = false
            self.hookBtn?.isHidden = false
            
        }
            
        if((playerDirection == 1 && playerPosition < GROUND_MAX_X) ||
           (playerDirection == -1 && playerPosition > GROUND_MIN_X)){
            
            self.player?.xScale = playerDirection
            self.player?.position.x += self.playerDirection * playerVelocity

        }
        
        // Fish
        
        let fishPosition = (self.fish?.position.x)!
        
        if(fishPosition < RIVER_MAX_X || fishPosition > RIVER_MIN_X){
            
            self.fish?.xScale = fishDirection * (-1)
            self.fish?.position.x += self.fishDirection * fishVelocity
            
        }
        
        if(fishPosition == RIVER_MIN_X){

            self.fishDirection = 1

        }else if(fishPosition == RIVER_MAX_X){

            self.fishDirection = -1

        }
        
        // Fishing
        
        if(self.hookBtnCount == HOOK_COUNT){

            self.fishingState = 2

        }
        
        if(self.fishingState == 2){
            
            print("Pegou!")
            
            self.playerDirection = 0
            self.player?.changeAnimation(to: .idle)
            self.player?.xScale = -1
        
            
            self.fish?.position.x = GROUND_MAX_X - 30
            self.fish?.position.y = Y_GROUND - 14
            self.fish?.zPosition = ZPOSITION_BASE
            self.fish?.xScale = -1
            self.fish?.changeAnimation(to: .dead)
            
            self.introText?.removeFromParent()
            self.tutorialText?.removeFromParent()
            self.hookBtn?.removeFromParent()
            self.leftBtn?.removeFromParent()
            self.rightBtn?.removeFromParent()
            
            self.endingText?.isHidden = false
            
//            self.backgroundSound?.run(.stop())
            
        }
        
    }

}
