//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var Choise1: UIButton!
    @IBOutlet weak var Choise2: UIButton!
    @IBOutlet weak var Choise3: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    @objc func updateUI () {
        questionLabel.text = quizBrain.getQuestionText()
        let answerChoice = quizBrain.getAnswers()
        Choise1.setTitle(answerChoice[0], for: .normal)
        Choise2.setTitle(answerChoice[1], for: .normal)
        Choise3.setTitle(answerChoice[2], for: .normal)
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        Choise1.backgroundColor = UIColor.clear
        Choise2.backgroundColor = UIColor.clear
        Choise3.backgroundColor = UIColor.clear
    }
}

