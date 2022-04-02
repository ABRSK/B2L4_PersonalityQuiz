//
//  ResultViewController.swift
//  B2L4_PersonalityQuiz
//
//  Created by Андрей Барсук on 01.04.2022.
//

import UIKit

class ResultViewController: UIViewController {
  
  @IBOutlet var animalNameLabel: UILabel!
  @IBOutlet var animalDescriptionLabel: UILabel!
  
  var userAnswers: [Answer]!
  
  private var dogCount = 0
  private var catCount = 0
  private var rabbitCount = 0
  private var turtleCount = 0
  private var resultAnimal: Animal!

  override func viewDidLoad() {
    super.viewDidLoad()
    
    countAnswers()
    getResult()
    
    self.navigationItem.setHidesBackButton(true, animated: false)
    animalNameLabel.text = "Вы – \(resultAnimal.rawValue)"
    animalDescriptionLabel.text = resultAnimal.description
    
  }
  
}

// MARK - Private methods

extension ResultViewController {
  private func countAnswers() {
    for answer in userAnswers {
      let animal = answer.animal
      
      switch animal {
      case .dog:
        dogCount += 1
      case .cat:
        catCount += 1
      case .rabbit:
        rabbitCount += 1
      case .turtle:
        turtleCount += 1
      }
    }
  }
  
  private func getResult() {
    if dogCount >= catCount && dogCount >= rabbitCount && dogCount >= turtleCount {
      resultAnimal = Animal.dog
    } else if catCount >= dogCount && catCount >= rabbitCount && catCount >= turtleCount {
      resultAnimal = Animal.cat
    } else if rabbitCount >= dogCount && rabbitCount >= catCount && rabbitCount >= turtleCount {
      resultAnimal = Animal.rabbit
    } else if turtleCount >= dogCount && turtleCount >= catCount && turtleCount >= rabbitCount {
      resultAnimal = Animal.turtle
    }
  }
}
