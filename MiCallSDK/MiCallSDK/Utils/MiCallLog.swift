//
//  MiCallLog.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

public class MiCallLog {
    
    private static var prefix: String = "MiCall-SDK-Log"
    
    public static func logI(message: String){
        print("\(prefix): \(message)")
    }
    public static func logE(message: String){
        print("\(prefix): \(message)")
    }
}
