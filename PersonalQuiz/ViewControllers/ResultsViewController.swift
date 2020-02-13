//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Denis on 12.02.2020.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    //MARK: - Properties
    var choosenAnswers:[Answer]?
    
    //MARK: - Private Properties
    private var answer:Answer?
    private var animalType:AnimalType?

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var resultDescriptionLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        determineTheType()
    }

    private func determineTheType() {
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        if let arrayAnswers = choosenAnswers {
        for answer in arrayAnswers {
            switch answer.type {
                case .cat: cat += 1
                case .dog: dog += 1
                case .rabbit: rabbit += 1
                case .turtle: turtle += 1
            }
            }
        }
        if dog > cat && dog > rabbit && dog > turtle {
            animalType = .dog
        } else if cat > dog && cat > rabbit && cat > turtle {
            animalType = .cat
        } else if rabbit > dog && rabbit > cat && rabbit > turtle {
            animalType = .rabbit
        } else if turtle > dog && turtle > cat && turtle > rabbit {
            animalType = .turtle
        }
        
        resultLabel.text = "вы - \(animalType ?? .dog))!"
        resultDescriptionLabel.text = animalType?.difinition
    }

}
