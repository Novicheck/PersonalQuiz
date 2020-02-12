//
//  QuestionsViewController.swift
//  PersonalQuiz
//
//  Created by Denis on 12.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class QuestionsViewController: UIViewController {
    
    //MARK: - Private Properties
    private let questions = Question.getQuestions()
    private var questionIndex = 0
    private var choosenAnswer: [Answer] = []
    private var currentAnswers: [Answer] {
        questions[questionIndex].answers
    }
    
    //MARK: - IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var multipleSwitches: [UISwitch]!
    @IBOutlet var rangedLabels: [UILabel]!
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    //MARK: - IBActions
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        guard let answerIndex = singleButtons.firstIndex(of: sender) else {return}
        let curentAnswer = currentAnswers[answerIndex]
        choosenAnswer.append(curentAnswer)
        nextQuestion()
    }
    @IBAction func multipleAnswerPressed(_ sender: UIButton) {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                choosenAnswer.append(answer)
            }
        }
        nextQuestion()
    }
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        let index = Int(round(rangedSlider.value * Float(currentAnswers.count - 1)))
        let currentAnswer = currentAnswers[index]
        choosenAnswer.append(currentAnswer)
        nextQuestion()
    }
}

//MARK: - Private Methods
extension QuestionsViewController {
    private func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        questionLabel.text = currentQuestion.text
        
        let totalProgress = Float(questionIndex) / Float(questions.count)
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex + 1) из \(questions.count)"
        
        showCurrentAnswers(for: currentQuestion)
    }
    
    private func showCurrentAnswers(for question: Question) {
        switch question.type {
            case .single:
            showSingleStackView(with: currentAnswers)
            case .multiple:
            showMultipleStackView(with: currentAnswers)
            case .ranged:
            showRangedStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers){
            button.setTitle(answer.text, for: .normal)
        }
    }
    
    private func showMultipleStackView(with answers: [Answer]) {
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    
    private func showRangedStackView(with answers: [Answer]) {
        rangedStackView.isHidden = false
        
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
}

//MARK: - Navigation
extension QuestionsViewController {
    private func nextQuestion () {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
}
