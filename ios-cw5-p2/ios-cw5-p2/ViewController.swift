//
//  ViewController.swift
//  ios-cw5-p2
//
//  Created by Fatimah Alhashem on 6/27/20.
//  Copyright © 2020 Haider. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!
    @IBOutlet weak var b5: UIButton!
    @IBOutlet weak var b6: UIButton!
    @IBOutlet weak var b7: UIButton!
    @IBOutlet weak var b8: UIButton!
    @IBOutlet weak var b9: UIButton!
    
    var counter = 0
    
    var kahootBackroundMusic: AVAudioPlayer?
    var bruhSoundEffect: AVAudioPlayer?
    var bruvSoundEffect: AVAudioPlayer?
    
    func playMusic() {
        let path = Bundle.main.path(forResource: "kahootLobby.mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            kahootBackroundMusic = try AVAudioPlayer(contentsOf: url)
            kahootBackroundMusic?.play()
        } catch {
        }
    }
    
    func playBruh() {
        let path = Bundle.main.path(forResource: "bruhSoundEffect.m4a", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            bruhSoundEffect = try AVAudioPlayer(contentsOf: url)
            bruhSoundEffect?.play()
        } catch {
        }
    }
    
    func playBruv() {
        let path = Bundle.main.path(forResource: "BruvSoundEffect.m4a", ofType:nil)!
        let url = URL(fileURLWithPath: path)

        do {
            bruvSoundEffect = try AVAudioPlayer(contentsOf: url)
            bruvSoundEffect?.play()
        } catch {
            // couldn't load file :(
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        playMusic()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapButton(_ sender: UIButton) {
        if counter % 2 == 0 {
            playBruh()
            sender.setTitle("X", for: .normal)
            turnLabel.text = "O Turn"
        }
        else {
            playBruv()
        sender.setTitle("O", for: .normal)
            turnLabel.text = "X Turn"

        }
        sender.isUserInteractionEnabled = false
        counter += 1
        
        if checkWinner(p: "X") {
            okAlert(title: "YEAH X WINS!😍", message: "Congrats player X, Whaley is now happy, you may play again :)")
        }
       else if checkWinner(p: "O") {
            okAlert(title: "YEAH O WINS!😍", message: "Congrats player O, Whaley is now happy, you may play again :)")
        }
        else if counter == 9{
            okAlert(title: "Nobody Won🙁", message: "Maybe next time you can make Whaley happy. Click Reset to play again.")
        }

    }
    
    func checkWinner(p: String)-> Bool {
        let f1 = b1.titleLabel?.text
        let f2 = b2.titleLabel?.text
        let f3 = b3.titleLabel?.text
        let f4 = b4.titleLabel?.text
        let f5 = b5.titleLabel?.text
        let f6 = b6.titleLabel?.text
        let f7 = b7.titleLabel?.text
        let f8 = b8.titleLabel?.text
        let f9 = b9.titleLabel?.text
        
        let r1 = (f1, f2, f3) == (p, p, p)
        let r2 = (f4, f5, f6) == (p, p, p)
        let r3 = (f7, f8, f9) == (p, p, p)
        let c1 = (f1, f4, f7) == (p, p, p)
        let c2 = (f2, f5, f8) == (p, p, p)
        let c3 = (f3, f6, f9) == (p, p, p)
        let d1 = (f1, f5, f9) == (p, p, p)
        let d2 = (f3, f5, f7) == (p, p, p)
        
        if r1 || r2 || r3 || c1 || c2 || c3 || d1 || d2 {
            return true
        }
        else {
            return false
        }
    }
    
    @IBAction func reset(_ sender: Any) {
        b1.titleLabel?.text = ""
        b2.titleLabel?.text = ""
        b3.titleLabel?.text = ""
        b4.titleLabel?.text = ""
        b5.titleLabel?.text = ""
        b6.titleLabel?.text = ""
        b7.titleLabel?.text = ""
        b8.titleLabel?.text = ""
        b9.titleLabel?.text = ""
        
        b1.setTitle("", for: .normal)
        b2.setTitle("", for: .normal)
        b3.setTitle("", for: .normal)
        b4.setTitle("", for: .normal)
        b5.setTitle("", for: .normal)
        b6.setTitle("", for: .normal)
        b7.setTitle("", for: .normal)
        b8.setTitle("", for: .normal)
        b9.setTitle("", for: .normal)
        
        b1.isUserInteractionEnabled = true
        b2.isUserInteractionEnabled = true
        b3.isUserInteractionEnabled = true
        b4.isUserInteractionEnabled = true
        b5.isUserInteractionEnabled = true
        b6.isUserInteractionEnabled = true
        b7.isUserInteractionEnabled = true
        b8.isUserInteractionEnabled = true
        b9.isUserInteractionEnabled = true
        
        counter = 0
        turnLabel.text = "X Turn"
    }
    
    func okAlert(title: String, message: String)
    {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }
    
}

