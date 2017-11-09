//
//  DetailedViewController.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Luis Calle on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import UIKit

class DetailedViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var theQuestion: Question?
    var questionModel: QuestionModel?

    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var detailedPickerView: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.detailedPickerView.delegate = self
        self.detailedPickerView.dataSource = self
        guard let theQuestion = theQuestion else {
            return
        }
        detailLabel.text = theQuestion.question
        questionModel = QuestionModel()
        guard let questionModel = questionModel else {
            return
        }
        questionModel.question = theQuestion
        questionModel.combinedAnswers = questionModel.makeAllAnswers()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        guard let questionModel = questionModel else {
            return 0
        }
        return questionModel.combinedAnswers!.0.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        guard let questionModel = questionModel else {
            return ""
        }
        guard let questionModelAnswers = questionModel.combinedAnswers else {
            return ""
        }
        return "\(questionModelAnswers.0[row])"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        guard let questionModel = questionModel else {
            return
        }
        guard let questionModelAnswers = questionModel.combinedAnswers else {
            return
        }
        if(row == questionModelAnswers.1) {
            self.view.backgroundColor = UIColor.green
        }
        else {
            self.view.backgroundColor = UIColor.red
        }
 
    }
    
    

}
