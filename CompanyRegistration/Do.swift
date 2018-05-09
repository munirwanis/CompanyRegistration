//
//  Do.swift
//  CompanyRegistration
//
//  Created by Munir Wanis on 09/05/18.
//  Copyright © 2018 Wanis Corporation. All rights reserved.
//

import Foundation

struct Do {
    
    static func wait(seconds: Double, completion: @escaping () -> Void) {
        let time = DispatchTime.now() + seconds
        
        DispatchQueue.main.asyncAfter(deadline: time) {
            completion()
        }
    }
    
    static func now(completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            completion()
        }
    }
}
