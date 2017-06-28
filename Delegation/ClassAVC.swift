//
//  ClassAVC.swift
//  Delegation
//
//  Created by Russ Perlow on 6/22/17.
//  Copyright © 2017 Russ Perlow. All rights reserved.
//

import UIKit

// Mark 4: Adopt the protocol here
class ClassAVC: UIViewController, ClassBVCDelegate{
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        // Mark 5: Create a reference of Class B and bind them through the perpareforsegue method
        if let nav = segue.destination as? UINavigationController, let classBVC = nav.topViewController as? ClassBVC{
            classBVC.delegate = self
        }
    }
    
    @IBOutlet weak var resetButton: UIButton!
     
    @IBAction func resetButton(_ sender: Any) {
        self.view.backgroundColor = .white
    }
    
    // Mark 6: Use the method of the contract here
    func changeBackgroundColor(_ color: UIColor?) {
        view.backgroundColor = color
    }
}
