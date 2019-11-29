//
//  ViewController.swift
//  BGMProject
//
//  Created by yonekan on 2019/11/29.
//  Copyright © 2019 yonekan. All rights reserved.
//

import UIKit
// 音楽を操作するための部品を読み込む
import AVFoundation

class ViewController: UIViewController {

    // カセットデッキみたいなもの
    var player: AVAudioPlayer!
    
    // 再生・停止ボタン
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 再生するファイルのパスを取得
        // forResource：音楽ファイルの名前（bgm.mp3 の 場合「bgm」）
        // ofType：拡張子（〇〇.mp3, 〇〇.mp4）
        let audioPath =
            Bundle.main.path(forResource: "bgm", ofType: "mp3")
        
        // パスをURLに変換する
        let audioUrl = URL(fileURLWithPath: audioPath!)
        
        // カセットデッキにURLを入れて、音楽を再生できる状態にする
        player = try! AVAudioPlayer(contentsOf: audioUrl)
        
        // 設定を反映させるおまじない
        player.delegate = self
        
        // 再生準備
        player.prepareToPlay()
        
        // 再生
        player.play()
    }
    
    // 再生ボタンがクリックされたとき
    @IBAction func didClickPlayButton(_ sender: UIButton) {
        player.play()
    }
    
    // 停止ボタンがクリックされたとき
    @IBAction func didClickStopButton(_ sender: UIButton) {
        player.pause()
    }
    
    // 再生・停止ボタン
    @IBAction func DidClickPlayAndStopButton(_ sender: UIButton) {
        // 再生中なら、
            // 音楽を停止
            // ボタンを再生ボタンに変える
        // 再生中でない場合
            // 音楽を再生
            // ボタンを停止ボタンに変える
        
        if player.isPlaying {
            // 再生中の場合
            player.pause()
            button.setTitle("再生", for: .normal)
        } else {
            // 停止中の場合
            player.play()
            button.setTitle("停止", for: .normal)
        }
        
    }
    
    
}

// この画面で音楽を操作するための拡張
extension ViewController: AVAudioPlayerDelegate { }
