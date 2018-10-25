//
//  ViewController.swift
//  MKPieProgressView
//
//  Created by Himal Madhushan on 10/25/18.
//  Copyright © 2018 Himal Madhushan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mkView: MKPieProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mkView.lineCap = .square
        mkView.animationDuration = 5
    }


}

