//
//  ViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Tom Seymour on 11/7/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var questionsTableView: UITableView!
    
    var allQuestions = [Question]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.questionsTableView.delegate = self
        self.questionsTableView.dataSource = self
        self.allQuestions = Question.questions
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allQuestions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let questionCell = tableView.dequeueReusableCell(withIdentifier: "Question Cell", for: indexPath)
        let questionRow = allQuestions[indexPath.row]
        questionCell.textLabel?.text = questionRow.question
        let category = questionRow.category
        let difficulty = questionRow.difficulty
        let type = questionRow.type
        questionCell.detailTextLabel?.text = "\(category) \(difficulty) \(type)"
        return questionCell
    }

}

