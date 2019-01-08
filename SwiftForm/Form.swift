//
//  Validator.swift
//  KeplerWood
//
//  Created by Rimon koroni on 1/7/19.
//  Copyright © 2019 Clic Agency. All rights reserved.
//

import Foundation

public protocol FormDelegate: NSObjectProtocol {
    
    func formItems() -> [FormItem]
}

public class Form {
    
    private var items: [FormItem] = []
    
    public init() {}
    
    weak public var delegate: FormDelegate! {
        didSet {
            items = delegate.formItems()
        }
    }
    
    public func submit(success: @escaping (_ values: [String: Any]) -> Void, failer: @escaping(_ error: String) -> Void) {
        var result: [String: Any] = [:]
        for i in 0..<self.items.count {
            if !items[i].isValid {
                failer(items[i].error!)
                return
            } else {
                let key = items[i].id ?? "\(i)"
                result[key] = items[i].value
            }
        }
        success(result)
    }
}
