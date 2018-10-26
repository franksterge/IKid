//
//  SwitchingViewController.swift
//  iKid
//
//  Created by GeFrank on 10/24/18.
//  Copyright © 2018 GeFrank. All rights reserved.
//

import UIKit

class SwitchingViewController: UIViewController {
    
    
    @IBOutlet weak var backBtn: UIButton!
    @IBOutlet weak var nextbtn: UIButton!
    
    var setup: setupViewController!
    var punchline: punchlineViewController!
    var setups: [String]! = []
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeData.currentJoke = self.restorationIdentifier!
        getSetupLine()
        jokeSetupViewBuilder()
        switchViewController(nil, to: setup!)
    }
    
    func getSetupLine() {
        setups.append(jokeData.currentJoke!)
        if jokeData.currentJoke == "Knock Knock" {
            for i in 0...jokeData.jokes["Knock Knock"]!.count - 2 {
                setups.append(jokeData.jokes["Knock Knock"]![i])
            }
        }
    }
    
    func jokeSetupViewBuilder() {
        if jokeData.currentJoke == "Knock Knock" {
            setup = (storyboard?
                .instantiateViewController(withIdentifier: "\(jokeData.currentJoke!)Setup\(currentIndex)") as! setupViewController)
        } else {
            setup = (storyboard?
                .instantiateViewController(withIdentifier: "\(jokeData.currentJoke!)Setup0") as! setupViewController)
        }
        backBtn.isHidden = true
    }
    
    func jokePunchlineViewBuilder() {
        punchline = (storyboard?
            .instantiateViewController(withIdentifier: "\(jokeData.currentJoke!)Punchline") as! punchlineViewController)
        backBtn.isHidden = false
        nextbtn.isHidden = true
    }

    @IBAction func switchView(_ sender: UIButton) {
        var first: UIViewController
        var second: UIViewController
        first = setup as setupViewController
        if sender.tag == 0{
            if currentIndex < setups.count - 1 {
                currentIndex += 1
                jokeSetupViewBuilder()
                second = setup as setupViewController
            } else {
                jokePunchlineViewBuilder()
                second = punchline as punchlineViewController
            }
        } else {
            currentIndex = 0
            first = punchline
            jokeSetupViewBuilder()
            second = setup
        }
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(0.4)
        UIView.setAnimationCurve(.easeInOut)
        
        if sender.tag == 0 {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            second.view.frame = view.frame
            switchViewController(first, to: second)
        } else {
            UIView.setAnimationTransition(.flipFromLeft, for: view, cache: true)
            second.view.frame = view.frame
            switchViewController(first, to: second)
            nextbtn.isHidden = false
        }
        
        UIView.commitAnimations()
    }

    
    func switchViewController(_ from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParent: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParent()
        }
        if to != nil {
            self.addChild(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParent: self)
        }
    }
    
}
