//
//  LawyerModel.swift
//  Law
//
//  Created by Adilet on 18/6/23.
//

import UIKit

struct Lawyer {
    let name: String
    let image: UIImage?
    let direction: String
    let experience: String
    
    static func fetch() -> [Lawyer] {
        
        let _1 = Lawyer(name: "Манас Акниетович", image: UIImage(named: "fPhoto"), direction: "Гражданское право", experience: "2 года")
        let _2 = Lawyer(name: "Тилек Азизбекович", image: UIImage(named: "fPhoto"), direction: "Налоговые", experience: "5 лет")
        let _3 = Lawyer(name: "Актан Калысович", image: UIImage(named: "fPhoto"), direction: "Наследства", experience: "3 года")
        let _4 = Lawyer(name: "Арстан Маматбекович", image: UIImage(named: "fPhoto"), direction: "Браки, разводы", experience: "2 года")
        let _5 = Lawyer(name: "Арсен Азимбекович", image: UIImage(named: "fPhoto"), direction: "Арбитраж", experience: "10 лет")
        
        return [_1,_2,_3,_4,_5]
    }
    
}
