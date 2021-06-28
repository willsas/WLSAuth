//
//  Error+extension.swift
//  WLSAuth
//
//  Created by Willa on 29/06/21.
//

import Foundation

enum WLSAuthError: Error{
    case decodingError(Error?)
    case noNetwork(Error?)
    case noDataReceived(Error?)
    case phoneNumberIsNotVerified(Error?)
    case other(String)
    case err(Error?)
}

extension WLSAuthError: LocalizedError{
    public var errorDescription: String? {
        switch self {
        case .decodingError(let err):
            return NSLocalizedString("Error: Failed to get data", comment: "\(err?.localizedDescription ?? "")")
        case .noNetwork(let err):
            return NSLocalizedString("Error: No Network", comment: "\(err?.localizedDescription ?? "")")
        case .noDataReceived(let err):
            return NSLocalizedString("Error: No Data Received", comment: "\(err?.localizedDescription ?? "")")
        case .phoneNumberIsNotVerified(_):
            return NSLocalizedString("Your phone number is not verified.", comment: "")
        case .other(let msg):
            return NSLocalizedString("\(msg)", comment: "")
        case .err(let err):
            return NSLocalizedString("\(err?.localizedDescription ?? "Failed to get data")", comment: "")
        }
    }
}
