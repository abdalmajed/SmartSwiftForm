//
//  Validator.swift
//  KeplerWood
//
//  Created by Rimon koroni on 1/8/19.
//  Copyright © 2019 Clic Agency. All rights reserved.
//

import Foundation

public class Validator: NSObject {
    
    internal var message: String?
    
    public init(message: String? = nil) {
        self.message = message
    }
    
    func validate(text: String) -> Bool { return false }
    
    func errorMessage(for name: String? = nil) -> String {
        return ""
    }
}
