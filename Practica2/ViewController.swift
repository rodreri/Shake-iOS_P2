//
//  ViewController.swift
//  Practica2
//
//  Created by Erick Rodrigo Minero Pineda on 19/11/22.
//

import UIKit
import Lottie
import AVKit

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    // 1. Create the AnimationView & audio
    private var animationView : LottieAnimationView?
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 2. Start AnimationView with animation name (without extension)
        animationView = .init(name: "playing")
        animationView!.frame = view.bounds
        
        // 3. Set animation content mode
        animationView!.contentMode = .scaleAspectFit
        
        // 4. Set animation loop mode
        animationView!.loopMode = .loop
        
        // 5. Adjust animation speed
        animationView!.animationSpeed = 0.5
        view.addSubview(animationView!)
        
        setAudio()
        
    }
    
    func setAudio() {
        guard let url = Bundle.main.url(forResource: "loud_bang", withExtension: "mp3")
        else {
            print("No se localizo audio")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        audioPlayer.play()
        animationView!.play()
    }
}
