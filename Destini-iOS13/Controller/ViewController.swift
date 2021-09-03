//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var btnBack: UIButton!
    //    let story = "You see a fork in the road."
//    let choice1 = "Take a left."
//    let choice2 = "Take a right."
    
    var storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnBack.isHidden = true
        self.updateUI()

    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        storyBrain.questionNumber = 0
        self.updateUI()
        
    }
    @objc func updateUI() {
        storyLabel.text = storyBrain.getQuestion()
        choice1Button.setTitle(storyBrain.getChoice1(), for: .normal)
        choice2Button.setTitle(storyBrain.getChoice2(), for: .normal)
        
    }

    @IBAction func btnChoiceClicked(_ sender: Any) {
        
        let userAnswer = (sender as AnyObject).currentTitle!
        
         print(userAnswer)

        storyBrain.nextQuestion(userAnswer: userAnswer!)
        btnBack.isHidden = false
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
}

