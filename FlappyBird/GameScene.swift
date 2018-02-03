//
//  GameScene.swift
//  FlappyBird
//
//  Created by Fumitaka Hijino on 2018/02/03.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var scrollNode:SKNode!
    
    // SKView上にシーンが表示されたときに呼ばれるメソッド
    override func didMove(to view: SKView) {
        // 背景色を設定
        backgroundColor = UIColor(red:0.15, green:0.75, blue:0.90, alpha:1)
        
        // スクロールするスプライトの親ノード
        scrollNode = SKNode()
        addChild(scrollNode)
        
        // 各種スプライトを生成する処理をメソッドに分割
        setupGround()
        setupCloud()
        
        
    }
    
    func setupGround() {
        // 地面の画像を読み込む
        let groundTexture = SKTexture(imageNamed: "ground")
        groundTexture.filteringMode = .nearest
        
        // 必要な枚数を計算
        let needNumber = Int(self.frame.size.width / groundTexture.size().width) + 2
        
        // スクロールするアクションを作成
        // 左方向に画像一枚分スクロールさせるアクション
        let moveGround = SKAction.moveBy(x: -groundTexture.size().width, y: 0, duration: 5.0)
        
        // 元の位置に戻すアクション
        let resetGround = SKAction.moveBy(x: groundTexture.size().width, y: 0, duration: 0.0)
        
        // 左にスクロール->元の位置->左にスクロールと無限に繰り替えるアクション
        let repeatScrollGround = SKAction.repeatForever(SKAction.sequence([moveGround, resetGround]))
        
        
        // groundのスプライトを配置する
        for i in 0..<needNumber {
            let sprite = SKSpriteNode(texture: groundTexture)
            
            // スプライトの表示する位置を指定する
            sprite.position = CGPoint(
                x: groundTexture.size().width * (CGFloat(i) + 0.5),
                y: groundTexture.size().height * 0.5
            )
            
            // スプライトにアクションを設定する
            sprite.run(repeatScrollGround)
            
            // スプライトを追加する
            scrollNode.addChild(sprite)
        }
    }
    
    
    func setupCloud() {
        // 雲の画像を読み込む
        let cloudTexture = SKTexture(imageNamed: "cloud")
        cloudTexture.filteringMode = .nearest
        
        // 必要な枚数を計算
        let needCloudNumber = Int(self.frame.size.width / cloudTexture.size().width) + 2
        
        // スクロールするアクションを作成
        // 左方向に画像一枚分スクロールさせるアクション
        let moveCloud = SKAction.moveBy(x: -cloudTexture.size().width, y: 0, duration: 20.0)
        
        // 元の位置に戻すアクション
        let resetCloud = SKAction.moveBy(x: cloudTexture.size().width, y: 0, duration: 0.0)
        
        // 左にスクロール->元の位置->左にスクロールと無限に繰り替えるアクション
        let repeatScrollCloud = SKAction.repeatForever(SKAction.sequence([moveCloud, resetCloud]))
        
        
        // スプライトを配置する
        for i in 0..<needCloudNumber {
            let sprite = SKSpriteNode(texture: cloudTexture)
            sprite.zPosition = -100 // 一番後ろになるようにする
            
            // スプライトの表示する位置を指定する
            sprite.position = CGPoint(
                x: cloudTexture.size().width * (CGFloat(i) + 0.5),
                y: self.size.height - cloudTexture.size().height * 0.5
            )
            
            // スプライトにアクションを設定する
            sprite.run(repeatScrollCloud)
            
            // スプライトを追加する
            scrollNode.addChild(sprite)
        }
    }
    
    
    
    
    
}
