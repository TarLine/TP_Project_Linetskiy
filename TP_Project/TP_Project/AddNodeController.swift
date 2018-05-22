//
//  AddNodeController.swift
//  TP_Project
//
//  Created by Uzver on 11/05/2018.
//  Copyright © 2018 Artem Linetskyi. All rights reserved.
//

import Cocoa

class AddNodeController: NSViewController {
    //Initialize Outlets
    @IBOutlet weak var NodeSelector: NSPopUpButton!
    @IBOutlet weak var OsSelector: NSPopUpButton!
    @IBOutlet weak var nodeNum: NSTextField!
    @IBOutlet weak var protectedItemsNum: NSTextField!
    @IBOutlet weak var protectionToolsNum: NSTextField!
    
    
    
    var delegate: AnyObject?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Set Selector buttons
        NodeSelector.removeAllItems()
        OsSelector.removeAllItems()
        NodeSelector.addItems(withTitles: ["Server","Client"])
        OsSelector.addItems(withTitles: ["Microsoft Windows XP","Microsoft Windows 7","Microsoft Windows 10","Microsoft Windows 8","Linux Mint","Ubuntu","Mac OS Sierra"])
        NodeSelector.synchronizeTitleAndSelectedItem()
        OsSelector.synchronizeTitleAndSelectedItem()

        // Do view setup here.
    }
    
    @IBAction func AddANode(_ sender: Any) {
        //Add a node Button handler
        (delegate as! ViewController).addNew(nodeType1: NodeSelector.title,operationSystem1: OsSelector.title,numberOfNodes1: Int(nodeNum.intValue),numberOfProtectedResources1:Int(protectedItemsNum.intValue), numberOfProtectionTools1:Int(protectionToolsNum.intValue))
        dismiss(self)
    }
    
    @IBAction func Cancel(_ sender: Any) {
        //Cancel button handler 
        dismiss(self)
    }
    
}
