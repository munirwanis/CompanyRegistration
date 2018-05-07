//
//  ModelProtocol.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 07/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

protocol ModelProtocol {
    var validations: [(() -> ValidationState)] { get set }
    func validate() -> ValidationState
}

extension ModelProtocol {
    func validate() -> ValidationState {
        for validation in validations {
            let state = validation()
            switch state {
            case .invalid(_): return state
            default: continue
            }
        }
        return .valid
    }
}

enum ValidationState {
    case valid
    case invalid(String)
}
