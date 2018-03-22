//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    let model = QuestionBank()
    var currentQuestionIndex = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerPressed(_ sender: AnyObject) {
        let userAnswer = sender.tag == 1
        if checkAnswer(answer: userAnswer) {
            ProgressHUD.showSuccess("Correct")
            score += 1
            nextQuestion()
            updateUI()
        } else {
            ProgressHUD.showError("Wrong")
        }
    }

    func updateUI() {
        let currentQuestion = model.list[currentQuestionIndex]
        questionLabel.text = currentQuestion.questionText
        progressLabel.text = "\(currentQuestionIndex + 1)/\(model.list.count)"
        scoreLabel.text = "Score: \(score)"
        
        //Change progress bar width dinamically
        progressBar.frame.size.width = (UIScreen.main.bounds.width / CGFloat(model.list.count)) * CGFloat(currentQuestionIndex + 1)
        
    }

    func nextQuestion() {
        if currentQuestionIndex + 1 >= model.list.count {
            showEndAlert()
        } else {
            currentQuestionIndex = currentQuestionIndex + 1
            updateUI()
        }
    }
    
    func checkAnswer(answer : Bool) -> Bool {
        let currentQuestion = model.list[currentQuestionIndex]
        return currentQuestion.answer == answer
    }
    
    func startOver() {
        currentQuestionIndex = 0
        score = 0
        updateUI()
    }
    
    func showEndAlert() {
        let alert =  UIAlertController(title: "Finished", message: "You're game has reached the end. A new Game will start", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Start", style: .default, handler: { _ in self.startOver()}))
        self.present(alert, animated: true, completion: nil)
    }
}
