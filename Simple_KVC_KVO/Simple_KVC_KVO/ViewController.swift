//
//  ViewController.swift
//  Simple_KVC_KVO
//
//  Created by MOBILE HUTT on 10/12/25.
//

import UIKit

//KVC lets you to access or modify the objects value using strings rather than usual dot annotation
//KVC-KVO wont works with simple swift classes but it has to be exposed/visible to objective c runtime

class Person: NSObject {
    
    @objc var name: String
    @objc var age: Int
    
    @objc private var secretCode = "XYZ1234"
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class ScoreModel: NSObject {
    @objc dynamic var score: Int = 0
}

class ViewController: UIViewController {
    
    let scoreModel = ScoreModel()
    var observation: NSKeyValueObservation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("!!KVC example!!!")
        
        let person = Person(name: "Dheeraj", age: 30)
        
        print("Person name is \(person.name) and age is \(person.age)")
        
        print("Modifying the values using string")
        
        person.setValue("John", forKey: "name")
        person.setValue(34, forKey: "age")
        
        print("Person name using dot annotation is \(person.name) and age is \(person.age)")
        
        print("!!!Accessing the values using string!!!")
        
        let personName = person.value(forKey: "name") as? String
        let personAge = person.value(forKey: "age") as? Int
        
        print("Name and age using string \(personName ?? "") \(personAge ?? 0)")
        
        //accessing private property using KVC
        let secretCode = person.value(forKey: "secretCode")
        print("Secret code using KVC is \(secretCode ?? "")")
        
        observation = scoreModel.observe(\.score, options: [.old, .new], changeHandler: { object, change in
            print("KVO Triggered: Score changed from \(change.oldValue!) to \(change.newValue!)")
        })
        
        // Trigger KVO
        scoreModel.score = 10
        scoreModel.score = 20
    }
    
    deinit {
        observation?.invalidate()
    }
    
    
}

