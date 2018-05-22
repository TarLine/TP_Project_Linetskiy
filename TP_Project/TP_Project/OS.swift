//
//  OS.swift
//  TP_Project
//
//  Created by Uzver on 20/05/2018.
//  Copyright © 2018 Artem Linetskyi. All rights reserved.
//

import Cocoa


class OS {
    //Set variables
    var type:String
    var name:String
    var Conf:Double
    var Integr:Double
    var Access:Double
    
    
    //Initialize the class
    init(Name:String,Type:String) {
        name = Name
        type = Type
        //ConfigureCoefficients
        
        if(type == "Server"){
            switch name {
            case "Microsoft Windows XP":
                Conf = 0.0231
                Integr = 0.0236
                Access = 0.0239
            case "Microsoft Windows 7":
                Conf = 0.0138
                Integr = 0.0135
                Access = 0.0139
            case "Microsoft Windows 10":
                Conf = 0.0130
                Integr = 0.0125
                Access = 0.0129
            case "Microsoft Windows 8":
                Conf = 0.0153
                Integr = 0.0161
                Access = 0.0165
            case "Linux Mint":
                Conf = 0.0103
                Integr = 0.0107
                Access = 0.0102
            case "Ubuntu":
                Conf = 0.0105
                Integr = 0.0112
                Access = 0.0110
            case "Mac OS Sierra":
                Conf = 0.091
                Integr = 0.086
                Access = 0.089
            default:
                Conf = 0.0138
                Integr = 0.0135
                Access = 0.0139
            }
        }
        else    {
            switch name {
            case "Microsoft Windows XP":
                Conf = 0.0239
                Integr = 0.0240
                Access = 0.0239
            case "Microsoft Windows 7":
                Conf = 0.0140
                Integr = 0.0138
                Access = 0.0139
            case "Microsoft Windows 10":
                Conf = 0.0133
                Integr = 0.0129
                Access = 0.0121
            case "Microsoft Windows 8":
                Conf = 0.0159
                Integr = 0.0162
                Access = 0.0167
            case "Linux Mint":
                Conf = 0.0106
                Integr = 0.0107
                Access = 0.0110
            case "Ubuntu":
                Conf = 0.0108
                Integr = 0.0110
                Access = 0.0105
            case "Mac OS Sierra":
                Conf = 0.093
                Integr = 0.090
                Access = 0.091
            default:
                Conf = 0.0138
                Integr = 0.0135
                Access = 0.0139
            }
            
            
        }
        
    }
    func CaculateCoeffitions(Node:OS,NumberOfNodes:Int32,ThingsToProtect:Int32,ProtectionTools:Int32,CoeffType:String) -> Double {
        
        var ConfCoeff:Double
        var IntegrCoeff:Double
        var AccessCoeff:Double
        
        switch CoeffType {
        case "Conf":
            ConfCoeff = (Node.Conf/0.333+Node.Conf)
            return ConfCoeff
        case "Integr":
            IntegrCoeff = (Node.Conf/0.333+Node.Integr)
            return IntegrCoeff
        case "Access":
            AccessCoeff = pow(1-pow(1-(Node.Conf/0.333+Node.Access), Double(ProtectionTools + NumberOfNodes)), Double(ThingsToProtect))
            return AccessCoeff
        default:
            print("there is an error")
            return 1
        }
    }
    
   
}

