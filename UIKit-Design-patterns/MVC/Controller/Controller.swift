//
//  Controller.swift
//  UIKit-Design-patterns
//
//  Created by Kritchanaxt_. on 1/5/2567 BE.
//

import UIKit

// MARK: Controller
class Controller: UIViewController {
    
    let person = Person(fristName: "John", lastName: "Smith", gender: "male", age: 25, weight: 72.0, height: 1752.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let myView = ExampleView(frame: CGRect(x: 0, y: 0, width: 250, height: 250))
        myView.center = view.center
        myView.configure(with: "\(person.fristName) \(person.lastName)")
        view.addSubview(myView)
    }


}

