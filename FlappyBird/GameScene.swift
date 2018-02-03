//
//  GameScene.swift
//  FlappyBird
//
//  Created by Fumitaka Hijino on 2018/02/03.
//  Copyright © 2018年 Fumitaka Hijino. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    // SKView上にシーンが表示されたときに呼ばれるメソッド
    override func didMove(to view: SKView) {
        // 背景色を設定
        backgroundColor = UIColor(red:0.15, green:0.75, blue:0.90, alpha:1)
    }
}
