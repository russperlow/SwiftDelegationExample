//
//  ClassBVC.swift
//  Delegation
//
//  Created by Russ Perlow on 6/22/17.
//  Copyright © 2017 Russ Perlow. All rights reserved.
//

import UIKit

// Mark 1: Added protocol
protocol ClassBVCDelegate: class{
    func changeBackgroundColor(_ color: UIColor?)
}

class ClassBVC: UIViewController{
    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    
    // Mark 2: Create a delegate property here & make weak to avoid memory leaks
    weak var delegate: ClassBVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        firstView.backgroundColor = .cyan
        firstView.layer.borderColor = UIColor.white.cgColor
        firstView.layer.borderWidth = 2.0
        firstView.layer.cornerRadius = firstView.frame.width / 2
        firstView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
        
        secondView.backgroundColor = .brown
        secondView.layer.borderColor = UIColor.white.cgColor
        secondView.layer.borderWidth = 2.0
        secondView.layer.cornerRadius = firstView.frame.width / 2
        secondView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap(_:))))
    }
    
    @IBAction func dismissView(_ sender: UIBarButtonItem){
        navigationController?.dismiss(animated: true)
    }
    
    func handleTap(_ tapGesture: UITapGestureRecognizer){
        view.backgroundColor = tapGesture.view?.backgroundColor
        
        // Mark 3: Add the delegate method call here
        delegate?.changeBackgroundColor(tapGesture.view?.backgroundColor)
    }
}
