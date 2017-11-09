//
//  QuestionModel.swift
//  AC-iOS-GeneralKnowledgeQuiz
//
//  Created by Luis Calle on 11/9/17.
//  Copyright © 2017 AC-iOS. All rights reserved.
//

import Foundation

class QuestionModel {
    
    var question: Question?
    var combinedAnswers: ([String], Int)?

    func makeAllAnswers () -> ([String], Int) {
        guard let question = question else {
            return ([],0)
        }
        let rand = Int(arc4random_uniform(UInt32(question.incorrectAnswers.count)))
        print(rand)
        var copy = question.incorrectAnswers
        copy.insert(question.correctAnswer, at: rand)
        return (copy, rand)
    }
}
