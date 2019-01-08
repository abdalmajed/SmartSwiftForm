//
//  InputView.swift
//  KeplerWood
//
//  Created by Rimon koroni on 1/7/19.
//  Copyright © 2019 Clic Agency. All rights reserved.
//

import UIKit

@objc public protocol InputViewDelegate: NSObjectProtocol {
    func inputViewValidators(for inputView: InputView) -> [Validator]
}

public class InputView: UIView {
    
    @IBOutlet public weak var delegate: InputViewDelegate?
    
    @IBInspectable public var name: String?
    
    @IBInspectable public var id: String? {
        didSet {
            formItem.id = id
        }
    }
    
    var nibName = "InputView"
    
    public var formItem = FormItem()
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        self.configureDesign()
    }
    
    func validate() {}
    
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: self.classForCoder)
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    
    func configureDesign() {}
}
