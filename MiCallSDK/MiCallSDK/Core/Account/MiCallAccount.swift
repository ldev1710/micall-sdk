//
//  MiCallAccount.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

class MiCallAccount {
    public var domain: String
    public var proxy: String
    public var port: String
    public var username: String
    public var password: String
    
    init(domain: String, proxy: String, port: String, username: String, password: String) {
        self.domain = domain
        self.proxy = proxy
        self.port = port
        self.username = username
        self.password = password
    }
}
