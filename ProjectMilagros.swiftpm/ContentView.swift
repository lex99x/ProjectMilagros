import SwiftUI
import SpriteKit
import UIKit
import GameplayKit

struct ContentView: View {
    
    var scene: SKScene {
        
        let scene = GameScene()
        scene.size = UIScreen.main.bounds.size
        scene.size = CGSize(width: 240, height: 160)
        scene.scaleMode = .fill
        
        return scene
        
    }
    
    var body: some View {
        
        SpriteView(scene: scene).ignoresSafeArea()
        
    }

}
