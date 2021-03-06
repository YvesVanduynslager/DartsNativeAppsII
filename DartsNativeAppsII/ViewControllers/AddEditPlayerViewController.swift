//
//  AddEditPlayerViewController.swift
//  DartsNativeAppsII
//
//  Created by Yves on 21/12/2018.
//  Copyright © 2018 Yves. All rights reserved.
//

import UIKit
import os.log

class AddEditPlayerViewController: UITableViewController
{
    //MARK: - Properties
    var player: Player?
    
    //MARK: - Outlets
    @IBOutlet weak var txt_firstname: UITextField!
    @IBOutlet weak var txt_lastname: UITextField!
    @IBOutlet weak var btn_add: UIBarButtonItem!
    @IBOutlet weak var btn_delete: UIBarButtonItem!
    @IBOutlet weak var txt_notes: UITextView!
    
    //MARK: - Lifecycle functions
    override func viewWillAppear(_ animated: Bool)
    {
        //Check if player has a reference
        if let player = player
        {
            //Set the textfields to player properties
            txt_firstname.text = player.firstName
            txt_lastname.text = player.lastName
            txt_notes.text = player.notes
        }
        
        //Check if the save button should be enabled
        updateSaveButtonState()
        
        //Set estimated row height for tableView
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 60.0
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //MARK: - Actions
    /**
     Connected to textfields "Editing Changed" event
     */
    @IBAction func textEditingChanged(_ sender: UITextField)
    {
        updateSaveButtonState()
    }
    
    /**
     txt_firstname and txt_lastname are connected to this through Primary Action Triggered.
     When return is pressed in these fields the keyboard hides
     */
    @IBAction func returnPressed(_ sender: UITextField)
    {
        txt_firstname.resignFirstResponder()
    }
    
    //MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        super.prepare(for: segue, sender: sender)
        
        //Check if unwind was triggered by save button
        guard segue.identifier == "saveUnwind" else
        {
            os_log("Unknown segue", log: OSLog.default, type: .error)
            return
        }
        
        let firstName = txt_firstname.text ?? ""
        let lastName = txt_lastname.text ?? ""
        let notes = txt_notes.text ?? ""
        
        //player?.score ?? 0 -> use score if it has a value, otherwise use 0
        player = Player(firstName: firstName, lastName: lastName, (player?.score ?? 0), notes )
    }
    
    //MARK: - Static table view setup
    /**
     Change the color of headers to black, this can't be done in Storyboard
     */
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int)
    {
        if let header = view as? UITableViewHeaderFooterView
        {
            header.textLabel?.textColor = .black
        }
    }
    
    //MARK: - Other
    /**
     Check if save button should be enabled.
     Based on txt_firstname and txt_lastname empty values
     */
    func updateSaveButtonState()
    {
        //Assign content of textfield when it has a value, otherwise assign default value
        let firstname = txt_firstname.text ?? ""
        let lastname = txt_lastname.text ?? ""
        
        btn_add.isEnabled = !firstname.isEmpty && !lastname.isEmpty
    }
}
