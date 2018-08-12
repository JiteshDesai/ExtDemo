//
//  PlaceholderTextView.swift
//  CoreDataDemo
//
//  Created by Webcodegenie on 05/06/18.
//  Copyright © 2018 Webcodegenie. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable @objc
open class PlaceholderTextView: UITextView {
    
    override open var text: String! {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    @IBInspectable open var borderColor : UIColor? {
        didSet{
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable open var placeholder: String? {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable open var placeholderColor: UIColor = UIColor(white: 0.8, alpha: 1.0) {
        didSet { setNeedsDisplay() }
    }
    @IBInspectable open var attributedPlaceholder: NSAttributedString? {
        didSet { setNeedsDisplay() }
    }
    // Initialize
    override public init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        commonInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        contentMode = .redraw
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange), name: .UITextViewTextDidChange, object: self)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    
    // Show placeholder if needed
    override open func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if text.isEmpty {
            let xValue = textContainerInset.left + textContainer.lineFragmentPadding
            let yValue = textContainerInset.top
            let width = rect.size.width - xValue - textContainerInset.right
            let height = rect.size.height - yValue - textContainerInset.bottom
            let placeholderRect = CGRect(x: xValue, y: yValue, width: width, height: height)
            
            if let attributedPlaceholder = attributedPlaceholder {
                attributedPlaceholder.draw(in: placeholderRect)
            }
            else if placeholder != nil {
                let paragraphStyle = NSMutableParagraphStyle()
                paragraphStyle.alignment = textAlignment
                var attributes: [NSAttributedStringKey: Any] = [.foregroundColor: placeholderColor,
                                                                .paragraphStyle: paragraphStyle]
                if let font = font {
                    attributes[.font] = font
                }
                placeholder?.draw(in: placeholderRect, withAttributes: attributes)
            }
        }
    }
    @objc func textDidChange(notification: Notification) {
        if let sender = notification.object as? PlaceholderTextView, sender == self {
            setNeedsDisplay()
        }
    }
}
