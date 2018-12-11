//
//  PlayerFormViewController.swift
//  DartsNativeAppsII
//
//  Created by Yves on 27/11/2018.
//  Copyright © 2018 Yves. All rights reserved.
//

import UIKit
import os.log

class PlayerFormViewController: UIViewController {

    @IBOutlet weak var txt_lastName: UITextField!
    @IBOutlet weak var txt_firstName: UITextField!
    @IBOutlet weak var btn_save: UIBarButtonItem!
    
    var player: Player?
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - Navigation
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //Save button is set to unwind to PlayerList.
    //PlayerTable has access to this Player through sender.source
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)

        guard let button = sender as? UIBarButtonItem, button === btn_save else {
            os_log("Save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        
        guard let firstName = txt_firstName.text, let lastName = txt_lastName.text
            else { return }
        
        player = Player(firstName: firstName, lastName: lastName, 0)
    }
}
