//
//  PsychologistViewController.swift
//  Psychologist
//
//  Created by Raju on 16/06/2015.
//  Copyright (c) 2015 Damodar Gundu. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navCon = destination as? UINavigationController {
            destination = navCon.visibleViewController
        }
        if let hvc = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "sad": hvc.happiness = 25
                    case "Happy": hvc.happiness = 47
                    case "meh": hvc.happiness = 35
                default: hvc.happiness = 50
                }
            }
        }
    } 
}
