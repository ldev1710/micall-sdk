//
//  CallStateEnum.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

public enum CallStateEnum {
    case INCOMING,
         STREAMING,
         END,
         HOLD,
         UN_HOLD,
         MUTE,
         UN_MUTE,
         ACCEPTED,
         CONNECTING,
         EARLY
}
