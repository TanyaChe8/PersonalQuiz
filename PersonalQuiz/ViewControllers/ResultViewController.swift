//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 14.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
	
	@IBOutlet var animalLabel: UILabel!
	@IBOutlet var animalInfoLabel: UILabel!
	
	var answersChosen: [Answer]!
	private var resultAnimal: Animal?
	
	override func viewDidLoad() {
		super.viewDidLoad()
		navigationItem.setHidesBackButton(true, animated: false)
		
		resultAnimal = getResults()
		animalLabel.text = "ВЫ - \(resultAnimal?.rawValue ?? "?")!"
		animalInfoLabel.text = resultAnimal?.definition ?? "?"
		
	}

	private func getResults() -> Animal? {
		var result: [Animal: Int] = [:]
		
		let animals = answersChosen.map { $0.animal }
		for index in animals {
			result[index] = (result[index] ?? 0) + 1
		}
		return result.sorted { $0.value > $1.value }.first?.key
	}
}
