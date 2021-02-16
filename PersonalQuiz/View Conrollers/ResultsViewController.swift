//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Филипп Слабодецкий on 15.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    // MARK:- IB Outlet
    @IBOutlet weak var resultEmojiLabel: UILabel!
    @IBOutlet weak var resultTextLabel: UILabel!
    
    // MARK:- Privat Properties
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Hide the back button
        navigationItem.hidesBackButton = true
        updateResult()
    }
}
    
    
    //MARK:- Private Methods
extension ResultsViewController {
    
    private func updateResult() {
        
        var frequencyOfAnimals: [AnimalType: Int] = [:]
        let animals = answers.map { $0.type }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimals[animal] {
                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimals[animal] = 1
            }
        }
        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted {$0.value > $1.value}
        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else {return}
        
        updateIU(with: mostFrequencyAnimal)
    }
    
    private func updateIU(with animal:AnimalType?) {
        resultEmojiLabel.text = "Вы - \(animal?.rawValue ?? "🐶")"
        resultTextLabel.text = animal?.definition ?? ""
    }
    
    
    
}



