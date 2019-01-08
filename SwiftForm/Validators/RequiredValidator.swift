//
//  RequiredValidator.swift
//  KeplerWood
//
//  Created by Rimon koroni on 1/8/19.
//  Copyright © 2019 Clic Agency. All rights reserved.
//

import Foundation

public class RequiredValidator: Validator {
    
    public override init(message: String? = nil) {
        super.init(message: message)
    }
    
    override func errorMessage(for name: String?) -> String {
        if self.message != nil { return self.message! }
        
        if name != nil {
            return name! + ": is required"
        } else {
            return "please fill all required fields"
        }
    }
    
    override func validate(text: String) -> Bool {
        return text.trimmingCharacters(in: CharacterSet(charactersIn: " ")) != ""
    }
}
