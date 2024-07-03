//
//  MiCallFactory.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

public class MiCallFactory {
    static func initialize(apiKey: String){
        MiCallSDK.initialize(apiKey: apiKey);
    }
    static func register(){
        MiCallSDK.register();
    }
    
    static func addMiCallListener(listener: MiCallListener){
        MiCallSDK.addMiCallListener(listener: listener);
    }
    
    static func toggleSpeaker(isEnable: Bool){
        //        MiCallSDK.toggleSpeaker(context,isEnable);
    }
    
    static func hold(){
        //        MiCallSDK.hold();
    }
    static func setAutoAnswer(isEnable: Bool ){
        //        MiCallSDK.destroy();
    }
    static func unHold(){
        //        MiCallSDK.unHold();
    }
    
    static func toggleMute(isMute: Bool){
        MiCallSDK.toggleMute(isMute: isMute);
    }
    
    static func delete(){
        //MiCallSDK.destroy();
    }
    
    static func transfer(phone: String ){
        //MiCallSDK.transfer(phone,context);
    }
    
    static func unRegister(){
        //MiCallSDK.unRegister();
    }
    
    static func makeCall(phone: String){
        //MiCallSDK.makeCall(phone, context);
    }
    
    static func getCurrentCall(){
        //        return MiCallSDK.getCurrentCall();
    }
    
    static func hangup(){
        MiCallSDK.hangup();
    }
    static func answer(){
        MiCallSDK.answer();
    }
}
