//
//  TextInputView.swift
//  KeplerWood
//
//  Created by Rimon koroni on 1/7/19.
//  Copyright © 2019 Clic Agency. All rights reserved.
//

import UIKit

public class TextInputView: InputView {

    @IBOutlet weak var textField: UITextField!
    
    @IBInspectable public var font: UIFont? {
        didSet {
            self.textField.font = font
        }
    }
    
    @IBInspectable public var text: String? {
        didSet {
            self.textField.text = text
        }
    }
    
    @IBInspectable public var textColor: UIColor? {
        didSet {
            self.textField.textColor = textColor
        }
    }
    
    @IBInspectable public var placeHolderText: String? {
        didSet {
            self.textField.placeholder = placeHolderText
        }
    }
    
    @IBInspectable public var placeHolderColor: UIColor? {
        didSet {
            self.textField.attributedPlaceholder = NSAttributedString(string: self.placeHolderText ?? "", attributes: [NSAttributedString.Key.foregroundColor: placeHolderColor ?? UIColor.lightGray])
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibName = "TextInputView"
        guard let view = loadViewFromNib() else { return }
        view.frame = self.bounds
        self.addSubview(view)
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        validate()
    }
    
    override func validate() {
        let validators: [Validator] = self.delegate?.inputViewValidators(for: self) ?? []
        let text = self.textField.text
        for validator in validators {
            if !validator.validate(text: text ?? "") {
                formItem.isValid = false
                formItem.error = validator.errorMessage(for: self.name)
                return
            }
        }
        formItem.value = text
        formItem.isValid = true
    }
    
    override func configureDesign() {
        let validators: [Validator] = self.delegate?.inputViewValidators(for: self) ?? []
        if validators.contains(where: { (validator) -> Bool in return validator is RequiredValidator }) {
            self.placeHolderText = (self.placeHolderText ?? "") + "*"
        }
    }
    
    @IBAction func didEndEditingTextField(_ sender: Any) {
        self.validate()
    }
    
}
