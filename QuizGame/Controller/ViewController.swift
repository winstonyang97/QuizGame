//
//  ViewController.swift
//  QuizGame
//
//  Created by Winston Yang on 2023-08-30.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!

    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    var player: AVAudioPlayer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    
    @IBAction func anwserButtonPressed(_ sender: UIButton) {
        
        
        let userAnwser = sender.currentTitle! //True or False
        let userRight = quizBrain.checkAnswer(userAnwser)
        
        if userRight {
            let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            sender.backgroundColor = UIColor.green
            
        } else {
            let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
        
        
    }
    
    
    @objc func updateUI() {
        
        questionLabel.text = quizBrain.getQuestionText()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizBrain.getProgress()
        
    }
    


}

