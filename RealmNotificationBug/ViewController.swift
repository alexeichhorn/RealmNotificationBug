//
//  ViewController.swift
//  RealmNotificationBug
//
//  Created by Alexander Eichhorn on 21.12.20.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    private var notificationToken: NotificationToken?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // - observe
        
        let realm = try! Realm()
        
        notificationToken = realm.objects(TestModel.self).observe { changes in
            switch changes {
            case .update(let items, _, let insertions, _):
                print("added items: \(insertions.map { items[$0].number })")
                
            default: break
            }
        }
        
        
        // - insert
        
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

