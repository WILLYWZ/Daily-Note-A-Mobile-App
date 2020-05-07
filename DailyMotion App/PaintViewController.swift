//
//  PaintViewController.swift
//  DailyMotion App
//
//  Created by Yiwei Zhu on 5/2/20.
//  Copyright © 2020 C323 / Spring 2020. All rights reserved.
//
import UIKit
import Foundation

class PaintViewController: UIViewController {
    
    @IBAction func backTo(_ sender: Any) {
        //method that brought user back to last scene
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        //make sure setPainting is working
        setPainting()
    }
    
    func setPainting() {
        //setUp the pencilKit for the view to paint
    }
    
}
