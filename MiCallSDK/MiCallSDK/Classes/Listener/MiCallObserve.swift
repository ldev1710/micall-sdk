//
//  MiCallObserve.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

protocol MiCallObserve {
    func onCallStateChanged(state: CallStateEnum, call: Call) -> Void
    func onRegistrationStateChanged(state: RegistrationStateEnum, message: String) -> Void
}
