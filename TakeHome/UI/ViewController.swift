//
//  ViewController.swift
//  TakeHome
//
//  Created by Jmorgaz on 17/3/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        let label = UILabel(frame: CGRect(x: 50, y: 50, width: 100, height: 50))
        label.text = "Hello World"
        self.view.addSubview(label)
    }
}

