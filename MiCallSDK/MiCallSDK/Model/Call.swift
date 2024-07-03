//
//  Call.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

class Call{
    public var id: Int32
    public var remoteExtension: String
    
    init(id: Int32, remoteExtension: String) {
        self.id = id
        self.remoteExtension = remoteExtension
    }
}
