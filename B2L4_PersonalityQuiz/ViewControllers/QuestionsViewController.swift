//
//  QuestionsViewController.swift
//  B2L4_PersonalityQuiz
//
//  Created by Андрей Барсук on 01.04.2022.
//

import UIKit

class QuestionsViewController: UIViewController {
  
  @IBOutlet var questionLabel: UILabel!
  @IBOutlet var questionProgressView: UIProgressView!
  
  @IBOutlet var singleStackView: UIStackView!
  @IBOutlet var singleButtons: [UIButton]!
  
  @IBOutlet var multipleStackView: UIStackView!
  @IBOutlet var multipleLabels: [UILabel]!
  @IBOutlet var multipleSwitches: [UISwitch]!
  
  @IBOutlet var rangedStackView: UIStackView!
  @IBOutlet var rangedLabels: [UILabel]!
  @IBOutlet var rangedSlider: UISlider! {
    didSet {
      let answerCount = Float(currentAnswers.count - 1)
      rangedSlider.maximumValue = answerCount
      rangedSlider.value = answerCount / 2
    }
  }
  
  private let questions = Question.getQuestions()
  private var userAnswers: [Answer] = []
  private var currentAnswers: [Answer] {
    questions[questionIndex].answers
  }
  private var questionIndex = 0

  override func viewDidLoad() {
    super.viewDidLoad()
    
    updateUI()
    
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let resultVC = segue.destination as? ResultViewController else { return }
    
    resultVC.userAnswers = userAnswers
  }

  @IBAction func singleButtonPressed(_ sender: UIButton) {
    guard let buttonIndex = singleButtons.firstIndex(of: sender) else { return }
    let currentAnswer = currentAnswers[buttonIndex]
    userAnswers.append(currentAnswer)
    
    nextQuestion()
  }
  @IBAction func multipleButtonPressed() {
    for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
      if multipleSwitch.isOn {
        userAnswers.append(answer)
      }
    }
    
    nextQuestion()
  }
  @IBAction func rangedButtonPressed() {
    let index = lrintf(rangedSlider.value) // Округляет Float до целого числа
    userAnswers.append(currentAnswers[index])
    
    nextQuestion()
  }
}

// MARK: - Private methods

extension QuestionsViewController {
  private func updateUI() {
    for stackView in [singleStackView, multipleStackView, rangedStackView] {
      stackView?.isHidden = true
    }
    
    let currentQuestion = questions[questionIndex]
    let totalProgress = Float(questionIndex) / Float(questions.count)
    
    questionLabel.text = currentQuestion.title
    questionProgressView.setProgress(totalProgress, animated: true)
    title = "Вопрос №\(questionIndex + 1) из \(questions.count)"
    
    showCurrentAnswers(for: currentQuestion.type)
  }
  
  private func showCurrentAnswers(for type: ResponseType) {
    switch type {
    case .single: showSingleStackView(with: currentAnswers)
    case .multiple: showMultipleStackView(with: currentAnswers)
    case .ranged: showRangedStackView(with: currentAnswers)
    }
  }
  
  private func showSingleStackView(with answers: [Answer]) {
    singleStackView.isHidden.toggle()
    
    for (button, answer) in zip(singleButtons, answers) {
      button.setTitle(answer.title, for: .normal)
    }
  }
  
  private func showMultipleStackView(with answers: [Answer]) {
    multipleStackView.isHidden.toggle()
    
    for (label, answer) in zip(multipleLabels, answers) {
      label.text = answer.title
    }
  }
  
  private func showRangedStackView(with answers: [Answer]) {
    rangedStackView.isHidden.toggle()
    
    rangedLabels.first?.text = answers.first?.title
    rangedLabels.last?.text = answers.last?.title
  }
  
  private func nextQuestion() {
    questionIndex += 1
    
    if questionIndex < questions.count {
      updateUI()
      return
    }
    
    performSegue(withIdentifier: "showResult", sender: nil)
  }
}



