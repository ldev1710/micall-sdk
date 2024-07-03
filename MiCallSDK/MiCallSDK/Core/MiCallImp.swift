//
//  MiCallImp.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

func onIncomingCall(){
    let ext = MiCallNormalize.normalizeRemoteUri(raw: String(CPPWrapper().incomingCallInfoWrapper()))
    let call = Call(id: 1, remoteExtension: ext)
    MiCallSDK.observingCallState(state: CallStateEnum.INCOMING, call: call)
}

class CallAnswerCode {
    public static var end:Int32 = 0;
    public static var accept:Int32 = 1;
    public static var early:Int32 = 2;
    public static var connecting:Int32 = 3;
    public static var streaming:Int32 = 4;
    public static var mute:Int32 = 5;
    public static var unMute:Int32 = 6;
    public static var hold: Int32 = 7;
    public static var unHold: Int32 = 8;
}

func onCallStateChanged(call_answer_code: Int32){
    if (call_answer_code == CallAnswerCode.end) {
        let call: Call = Call(id: -1, remoteExtension: "")
        MiCallSDK.observingCallState(state: CallStateEnum.END, call: call)
    } else if (call_answer_code == CallAnswerCode.accept) {
        MiCallSDK.observingCallState(state: CallStateEnum.ACCEPTED, call: MiCallSDK.currCall!)
    } else if (call_answer_code == CallAnswerCode.streaming){
        MiCallSDK.observingCallState(state: CallStateEnum.STREAMING, call: MiCallSDK.currCall!)
    } else if(call_answer_code == CallAnswerCode.connecting){
        MiCallSDK.observingCallState(state: CallStateEnum.CONNECTING, call: MiCallSDK.currCall!)
    } else if(call_answer_code == CallAnswerCode.early){
        MiCallSDK.observingCallState(state: CallStateEnum.EARLY, call: MiCallSDK.currCall!)
    } else if([CallAnswerCode.unMute,CallAnswerCode.mute].contains(call_answer_code)){
        MiCallSDK.observingCallState(state: call_answer_code == CallAnswerCode.mute ? CallStateEnum.MUTE : CallStateEnum.UN_MUTE, call: MiCallSDK.currCall!)
    } else if([CallAnswerCode.unHold,CallAnswerCode.hold].contains(call_answer_code)){
        MiCallSDK.observingCallState(state: call_answer_code == CallAnswerCode.hold ? CallStateEnum.HOLD : CallStateEnum.UN_HOLD, call: MiCallSDK.currCall!)
    }
}

func onRegistrationChanged(isRegister: Bool,code: Int32){
    var state = isRegister ? RegistrationStateEnum.REGISTERED : RegistrationStateEnum.UNREGISTERED
    if(isRegister){
        if(code == 200){
            state = RegistrationStateEnum.REGISTERED;
        } else {
            state = RegistrationStateEnum.REGISTER_FAILED
        }
    } else {
        if(code == 200){
            state = RegistrationStateEnum.UNREGISTERED;
        } else {
            state = RegistrationStateEnum.UNREGISTERED_FAILED
        }
    }
    let message = code == 200 ? "Successfull" : "Failed"
    MiCallSDK.observingRegState(state: state, message: message)
}
