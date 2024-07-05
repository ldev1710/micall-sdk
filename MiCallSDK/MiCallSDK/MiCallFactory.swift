//
//  MiCallFactory.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

public class MiCallFactory {
    static func initialize(apiKey: String){
        MiCallCore.initialize(apiKey: apiKey);
    }
    static func register(){
        MiCallCore.register();
    }
    
    static func addMiCallListener(listener: MiCallListener){
        MiCallCore.addMiCallListener(listener: listener);
    }
    
    static func toggleSpeaker(isEnable: Bool){
        MiCallCore.toggleSpeaker(isEnable: isEnable);
    }
    
    static func hold(){
        MiCallCore.hold();
    }
    static func setAutoAnswer(isEnable: Bool ){
        //        MiCallCore.destroy();
    }
    static func unHold(){
        MiCallCore.unHold();
    }
    
    static func toggleMute(isMute: Bool){
        MiCallCore.toggleMute(isMute: isMute);
    }
    
    static func delete(){
//        MiCallCore.destroy();
    }
    
    static func transfer(phone: String ){
        MiCallCore.transfer(phone: phone);
    }
    
    static func unRegister(){
        MiCallCore.unRegister();
    }
    
    static func makeCall(phone: String){
        MiCallCore.makeCall(phone: phone);
    }
    
    static func getCurrentCall() {
//        return MiCallCore.getCurrentCall();
    }
    
    static func hangup(){
        MiCallCore.hangup();
    }
    static func answer(){
        MiCallCore.answer();
    }
}
