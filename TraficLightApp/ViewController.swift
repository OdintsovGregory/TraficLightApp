//
//  ViewController.swift
//  TraficLightApp
//
//  Created by Gregory Odintsov on 31.08.2022.
//

import UIKit

enum CurrentLight {
    case red, yellow, green
}

class ViewController: UIViewController {

    @IBOutlet var redColorLabel: UIView!
    @IBOutlet var yellowColorLabel: UIView!
    @IBOutlet var greenColorLabel: UIView!
    
    @IBOutlet var startButtonLabel: UIButton!
    
    private var currentLight = CurrentLight.red
    private let lightIsOn: CGFloat = 1
    private let lightIsOff: CGFloat = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startButtonLabel.layer.cornerRadius = 15
        
        redColorLabel.alpha = lightIsOff
        yellowColorLabel.alpha = lightIsOff
        greenColorLabel.alpha = lightIsOff
    }

    override func viewWillLayoutSubviews() {
        redColorLabel.layer.cornerRadius = redColorLabel.frame.width / 2
        yellowColorLabel.layer.cornerRadius = yellowColorLabel.frame.width / 2
        greenColorLabel.layer.cornerRadius = greenColorLabel.frame.width / 2
    }
    
    @IBAction func startButtonPressed() {
        if startButtonLabel.currentTitle == "Start" {
            startButtonLabel.setTitle("Next", for: .normal)
        }
        switch currentLight {
        case .red:
            greenColorLabel.alpha = lightIsOff
            redColorLabel.alpha = lightIsOn
            currentLight = .yellow
        case .yellow:
            redColorLabel.alpha = lightIsOff
            yellowColorLabel.alpha = lightIsOn
            currentLight = .green
        case .green:
            yellowColorLabel.alpha = lightIsOff
            greenColorLabel.alpha = lightIsOn
            currentLight = .red
        }
    }
    
}

