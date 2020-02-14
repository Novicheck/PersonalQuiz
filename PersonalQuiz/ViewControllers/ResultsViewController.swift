//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Denis on 12.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!

    //MARK: - Properties
    var choosenAnswers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        determineTheType()
    }

    private func determineTheType() {
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = choosenAnswers.map {$0.type}
        
//        for animal in animals {
//            guard let animalTypeCount = frequencyOfAnimals[animal] else {
//                frequencyOfAnimals[animal] = 1
//                return
//            }
//            frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
//        }
        
         for animal in animals {
            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0) + 1
         }

        let sortedFrequencyOfAnimals = frequencyOfAnimals.max {$0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals?.key else {return}
        updateUI(with: mostFrequencyAnimal)
    }
    
    private func updateUI(with animal: AnimalType) {
        resultLabel.text = "ВЫ - \(animal.rawValue)"
        resultDescriptionLabel.text = animal.difinition
    }

}
