//
//  CustomError.swift
//  MBCommon
//
//  Created by Zhenis Mutan on 17.12.2020.
//

import Foundation

public enum CustomError: Error {
    case customError(String)
    case somethingWentWrong
}

extension CustomError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .customError(let errorString):
            return NSLocalizedString(errorString, comment: "Custom error")
        case .somethingWentWrong:
            return NSLocalizedString("Что-то пошло не так. Повторите попытку.", comment: "Custom error")
        }
    }
}
