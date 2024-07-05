//
//  MiCallNormalize.swift
//  micall-sdk
//
//  Created by Dev App Mitek on 01/07/2024.
//

import Foundation

public class MiCallNormalize {
    public static func normalizeRemoteUri(raw: String) -> String{
        guard let sipRange = raw.range(of: "sip:") else { return "Unknow" }
        let start = raw.index(sipRange.lowerBound, offsetBy: 4)
        guard let atRange = raw[start...].range(of: "@") else { return "Unknow" }
        return String(raw[start..<atRange.lowerBound])
    }
}

extension StringProtocol {
    func index<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.lowerBound
    }
    func endIndex<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> Index? {
        range(of: string, options: options)?.upperBound
    }
    func indices<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Index] {
        ranges(of: string, options: options).map(\.lowerBound)
    }
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
