//
//  MiCallFactory.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

public class MiCallFactory {
    public static func initialize(apiKey: String){
        MiCallCore.initialize(apiKey: apiKey);
    }
    public static func register(){
        MiCallCore.register();
    }
    
    public static func addMiCallListener(listener: MiCallListener){
        MiCallCore.addMiCallListener(listener: listener);
    }
    
    public static func toggleSpeaker(isEnable: Bool){
        MiCallCore.toggleSpeaker(isEnable: isEnable);
    }
    
    public static func hold(){
        MiCallCore.hold();
    }
    public static func setAutoAnswer(isEnable: Bool ){
        MiCallCore.setAutoAnswer(isEnable: isEnable);
    }
    public static func unHold(){
        MiCallCore.unHold();
    }
    
    public static func toggleMute(isMute: Bool){
        MiCallCore.toggleMute(isMute: isMute);
    }
    
    public static func delete(){
//        MiCallCore.destroy();
    }
    
    public static func transfer(phone: String ){
        MiCallCore.transfer(phone: phone);
    }
    
    public static func unRegister(){
        MiCallCore.unRegister();
    }
    
    public static func makeCall(phone: String){
        MiCallCore.makeCall(phone: phone);
    }
    
    public static func getCurrentCall() {
//        return MiCallCore.getCurrentCall();
    }
    
    public static func hangup(){
        MiCallCore.hangup();
    }
    public static func answer(){
        MiCallCore.answer();
    }
}
