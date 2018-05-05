//
//  ViewController.swift
//  20q
//
//  Created by Andrés Gamboa on 5/5/18.
//  Copyright © 2018 Andrés Gamboa. All rights reserved.
//

import UIKit

class Question {
    var text: String
    var answer: Bool
    var seen: Bool
    
    init(text:String, answer:Bool) {
        self.text = text
        self.answer = answer
        self.seen = false
    }
    
}

class ViewController: UIViewController {
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet weak var nextAndResultButton: UIButton!
    @IBOutlet weak var currentQuestionLabel: UILabel!
    
    var currentAnswer = Bool()
    var currentQuestionShowing = Question(text: "", answer: false)
    var questions = Array<Question>()
    var results = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        questions.append(Question(text: "Es el año 1988?", answer: false))
        questions.append(Question(text: "La liga tiene 29 campeonatos?", answer: true))
        questions.append(Question(text: "Es Navas el mejor portero?", answer: true))
        questions.append(Question(text: "Es Luis Guillermo un mechudo?", answer: false))
        questions.append(Question(text: "Es Oscar Arias un cantante de los hicsos?", answer: false))
        questions.append(Question(text: "Amanece al oeste?", answer: false))
        questions.append(Question(text: "Es CR más grande que Nicaragua?", answer: false))
        questions.append(Question(text: "Es CR potencia mundial?", answer: true))
        questions.append(Question(text: "Es Patricia Mora comunista?", answer: true))
        questions.append(Question(text: "Me Comprendes Mendes?", answer: true))
        questions.append(Question(text: "Es la ballena azul el animal más grande?", answer: true))
        questions.append(Question(text: "Quiere Mireya que le baje una estrella?", answer: true))
        questions.append(Question(text: "La independencia de CR fue en 1722?", answer: false))
        questions.append(Question(text: "Vivio el quijote en la mancha?", answer: true))
        questions.append(Question(text: "De la caña se hace el guaro?", answer: true))
        questions.append(Question(text: "Es un ladrón que me ha robado todo?", answer: false))
        questions.append(Question(text: "2 + 2 = 5?", answer: false))
        questions.append(Question(text: "Es Ivy Queen la diva, la perra, la potra?", answer: true))
        questions.append(Question(text: "Fue Abel Pacheco el mejor gobierno de CR?", answer: false))
        questions.append(Question(text: "LA gallina cruzó la calle para llegar al otro lado?", answer: true))
        
        setQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setQuestion() {
        let unseenQuestions = questions.filter { $0.seen == false }
        if (unseenQuestions.count > 0) {
            currentQuestionShowing = unseenQuestions[Int(arc4random_uniform(20))]
            currentQuestionLabel.text = currentQuestionShowing.text
            currentQuestionShowing.seen = true
            if(unseenQuestions.count == 1) {
                nextAndResultButton.setTitle("Resultados", for: .normal)
            }
        }
    }
    
    @IBAction func answerNo(_ sender: UIButton) {
        currentAnswer = false
        sender.alpha = 0.5
        yesButton.alpha = 1
    }
    
    @IBAction func answerYes(_ sender: UIButton) {
        currentAnswer = true
        sender.alpha = 0.5
        noButton.alpha = 1
    }

    @IBAction func nextOrResult(_ sender: UIButton) {
        if(currentAnswer == currentQuestionShowing.answer) {
            results = results + 1
        }
        yesButton.alpha = 1
        noButton.alpha = 1
        setQuestion()
    }
    
}

