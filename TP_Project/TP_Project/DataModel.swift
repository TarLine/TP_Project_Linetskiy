//
//  File.swift
//  TP_Project
//
//  Created by Uzver on 11/05/2018.
//  Copyright © 2018 Artem Linetskyi. All rights reserved.
//


import Cocoa

class DataModel {
    
    static let sharedInstance = DataModel()
    fileprivate var DataChanged = false
    fileprivate var strPath: String = ""
    var dataArray:NSMutableArray = []
    
    
    func addNewRecord (nodeType: String, operationSystem: String, numberOfNodes: Int, numberOfProtectedResources: Int,numberOfProtectionTools:Int) {
        let dict = ["Node Type": nodeType, "Operation System": operationSystem, "Number of Nodes": numberOfNodes,"Resources": numberOfProtectedResources
            ,"Protections":numberOfProtectionTools] as [String : Any]
        dataArray.add(dict)
        DataChanged = true
    }
    
    func deleteRecord (_ row: Int){
        dataArray.removeObject(at: row)
        DataChanged = true;
    }
    
    func updateRecord(_ row: Int, withData data: AnyObject) {
        dataArray[row] = data
        DataChanged = true;
    }
    
    
}
