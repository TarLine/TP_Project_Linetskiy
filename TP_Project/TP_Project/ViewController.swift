//
//  ViewController.swift
//  TP_Project
//
//  Created by Uzver on 10/05/2018.
//  Copyright © 2018 Artem Linetskyi. All rights reserved.
//

import Cocoa

class ViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate{
    //Initialize coefficients 
    var ConfCoeff:Double = 1.0
    var IntegrCoeff:Double = 1.0
    var AccessCoeff:Double = 1.0
   
    @IBOutlet weak var NodesTableView: NSTableView!
    let DM = DataModel.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NodesTableView.delegate = self
        NodesTableView.dataSource = self
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return DM.dataArray.count
    }
    
    func tableView(_ tableView: NSTableView, objectValueFor tableColumn: NSTableColumn?, row: Int) -> Any? {
        //Initialize tableView
        let dict:NSDictionary = DM.dataArray[row] as! NSDictionary
        let strKey = (tableColumn?.identifier)!
        let instance = dict.value(forKey: strKey.rawValue)
        if instance is String
        {
        return instance as! String
        }
        else
        {
            return instance as! Int32
        }
        
    }
    override func prepare(for segue: NSStoryboardSegue, sender: Any?) {
        //Segue to add new node
        if segue.identifier!.rawValue == "NewNodeSegue" {
            
            let AddNodeView = segue.destinationController as! AddNodeController
            AddNodeView.delegate = self
            
        }
    }
    
    @IBAction func btnDeleteNodes(_ sender: Any) {
        //Delete instance
        DM.deleteRecord(NodesTableView.selectedRow)
        NodesTableView.reloadData()
    }
    
    func addNew(nodeType1:String,operationSystem1:String,numberOfNodes1:Int,numberOfProtectedResources1:Int,numberOfProtectionTools1:Int){
        var Node:OS
        
        //Add data to the dictionary
        DM.addNewRecord(nodeType: nodeType1, operationSystem: operationSystem1, numberOfNodes: numberOfNodes1, numberOfProtectedResources: numberOfProtectedResources1, numberOfProtectionTools: numberOfProtectionTools1)
        
        //Calculate coeffitions
        Node = OS(Name: nodeType1,Type: operationSystem1)
        Node.Conf = Node.CaculateCoeffitions(Node: Node, NumberOfNodes: Int32(numberOfNodes1), ThingsToProtect: Int32(numberOfProtectedResources1), ProtectionTools: Int32(numberOfProtectionTools1), CoeffType: "Conf")
        Node.Integr = Node.CaculateCoeffitions(Node: Node, NumberOfNodes: Int32(numberOfNodes1), ThingsToProtect: Int32(numberOfProtectedResources1), ProtectionTools: Int32(numberOfProtectionTools1), CoeffType: "Integr")
        Node.Access = Node.CaculateCoeffitions(Node: Node, NumberOfNodes: Int32(numberOfNodes1), ThingsToProtect: Int32(numberOfProtectedResources1), ProtectionTools: Int32(numberOfProtectionTools1), CoeffType: "Access")
        
        ConfCoeff *= Node.Conf
        IntegrCoeff *= Node.Integr
        AccessCoeff *= Node.Access
        NodesTableView.reloadData()
    }
    
    @IBAction func Evaluate(_ sender: Any) {
        let alert = NSAlert()
        alert.informativeText = ("Confidentiality coeffitient is equal to: \(round(1000 * ConfCoeff) / 1000)\nIntegrall coeffitient is equal to: \(round(1000 * IntegrCoeff) / 1000)\nAccessibility coeffitient is equal to: \(round(1000 * AccessCoeff) / 1000)")
        
        if (ConfCoeff < 0.990 || IntegrCoeff < 0.990 || AccessCoeff < 0.990){
            alert.messageText = "Your system is insecure!"
        }
        else{
            alert.messageText = "Your system is secure!"
        }
        alert.runModal()
        print("Confidentiality coeffitient is equal to: \(ConfCoeff)")
        print("Integrall coeffitient is equal to: \(IntegrCoeff)")
        print("Accessibility coeffitient is equal to: \(AccessCoeff)")
        
    }
    
    
   
}


