//
//  ViewController.swift
//  RealmNotificationBug
//
//  Created by Alexander Eichhorn on 21.12.20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            
            let newObjects: [TestModel] = (0..<10).map {
                let item = TestModel()
                item.number = $0
                return item
            }
            
            let realm = try! Realm()
            
            try! realm.write {
                realm.add(newObjects)
            }
            
        }
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6.0) {
            
            let newObjects: [TestModel] = (10..<20).map {
                let item = TestModel()
                item.number = $0
                return item
            }
            
            let realm = try! Realm()
            
            try! realm.write {
                realm.add(newObjects)
            }
            
        }
    }


}

