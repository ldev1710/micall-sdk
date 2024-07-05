//
//  MiCallSDK.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation
import AVFoundation
public class MiCallCore {
    private static var isRegistered : Bool = false
    private static var isAvailable : Bool = false
    private static var currentAccount: MiCallAccount?
    private static var apiKey: String?
    private static var observes: [MiCallListener]?
    public static var currCall: Call?
    
    public static func answer(){
        CPPWrapper().answerCall();
    }
    
    public static func transfer(phone: String){
        if(!isMicrophoneGranted()) {return;}
        let uri = "sip:\(phone)@\(currentAccount!.domain)";
        CPPWrapper().transfer(uri);
    }
    
    public static func toggleMute(isMute: Bool){
        let ok = UnsafeMutablePointer<Bool>.allocate(capacity: 1)
        ok[0] = isMute
        CPPWrapper().toggleMute(ok);
    }
    
    public static func toggleSpeaker(isEnable: Bool){
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playAndRecord, mode: .voiceChat, options: [])
            
            if isEnable { // Enable speaker
                try session.overrideOutputAudioPort(.speaker)
            } else { // Disable speaker
                try session.overrideOutputAudioPort(.none)
            }
            
            try session.setActive(true)
        } catch {
            MiCallLog.logE(message: "Failed to set audio session category: \(error.localizedDescription)")
        }

    }
    
    public static func hold(){
        CPPWrapper().holdCall();
    }
    
    public static func unHold(){
        CPPWrapper().unholdCall();
    }
    
    public static func hangup(){
        CPPWrapper().hangupCall();
    }
    
    private static func interValidate() -> Bool{
        if(!isAvailable || !isRegistered){
            MiCallLog.logE(message: "The library is not ready");
            return false
        }
        return true
    }

    private static func isMicrophoneGranted() -> Bool{
        let isGranted = AVAudioSession.sharedInstance().recordPermission == AVAudioSession.RecordPermission.granted;
        if(!isGranted){
            MiCallLog.logI(message: "The microphone permission required!")
        }
        
        return isGranted;
    }
    
    public static func makeCall(phone: String){
        if(!isMicrophoneGranted()) {return;}
        let uri = "sip:\(phone)@\(currentAccount!.domain)";
        currCall = Call(id: 0, remoteExtension: phone)
        CPPWrapper().outgoingCall(uri)
    }
    
    public static func addMiCallListener(listener: MiCallListener){
        if(observes == nil) {
            observes = []
        }
        observes?.append(listener);
    }
    
    public static func observingRegState(state: RegistrationStateEnum,message: String){
        if(observes==nil) {return;}
        MiCallLog.logI(message: "\(state) \(message)")
        for observe in observes! {
            observe.onRegistrationStateChanged(state: state, message: message);
        }
    }
    
    public static func observingCallState(state: CallStateEnum,call: Call){
        currCall = call
        if(observes==nil) {return;}
        MiCallLog.logI(message: "\(state) \(call.remoteExtension)")
        for observe in observes! {
            observe.onCallStateChanged(state:state, call: call);
        }
    }
    
    public static func initialize(apiKey: String){
        self.apiKey = apiKey
        CPPWrapper().createLibWrapper()
        observes = []
        CPPWrapper().incoming_call_wrapper(onIncomingCall)
        CPPWrapper().acc_listener_wrapper(onRegistrationChanged)
        CPPWrapper().call_listener_wrapper(onCallStateChanged)
        isAvailable = true
        currentAccount = MiCallAccount(
            domain: "pbx57.mipbx.vn",
            proxy: "sipproxy01-2020.mipbx.vn",
            port: "5969",
            username: "1995",
            password: "f4935275fe3f745c7daff955f0097075"
        )
    }
    
    public static func register(){
        if(!isAvailable) {return;}
        observingRegState(state: RegistrationStateEnum.REGISTERING, message: "Registering")
        let username = currentAccount!.username
        let password = currentAccount!.password
        let domain = currentAccount!.domain
        let port = currentAccount!.port
        let proxy = "sip:\(currentAccount!.proxy):\(port)"
        CPPWrapper()
            .createAccountWrapper(
                username,
                password,
                domain,
                port,
                proxy
            )
    }
    public static func unRegister(){
        CPPWrapper().unregisterAccountWrapper()
    }
}
