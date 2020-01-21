//
//  CustomAttributedStringCreator.swift
//  Mei
//
//  Created by Jeffrey Chang on 9/3/19.
//  Copyright © 2019 Jeffrey Chang. All rights reserved.
//

import UIKit

enum HelveticaStyle {
    case HelveticaNeue
    case HelveticaNeueBold
    case HelveticaNeueLight
    case HelveticaNeueItalic
}

struct AStringCreator {
    
    private init() {}
    
    static func HelveticaAString(style: HelveticaStyle, text: String, size: CGFloat, foregroundColor: UIColor, backgroundColor: UIColor) -> NSAttributedString {
        let fontNameString: String
        switch style {
        case .HelveticaNeue:
            fontNameString = "HelveticaNeue"
        case .HelveticaNeueBold:
            fontNameString = "HelveticaNeue-Bold"
        case .HelveticaNeueItalic:
            fontNameString = "HelveticaNeue-Italic"
        case .HelveticaNeueLight:
            fontNameString = "HelveticaNeue-Light"
        }
        
        let attribute: [NSAttributedString.Key : Any]
        if let font = UIFont(name: fontNameString, size: size) {
            attribute = [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: foregroundColor, NSAttributedString.Key.backgroundColor: backgroundColor]
        } else {
            attribute = [NSAttributedString.Key.foregroundColor: foregroundColor, NSAttributedString.Key.backgroundColor: backgroundColor]
        }
        return NSAttributedString(string: text, attributes: attribute)
    }
    
    static func HelveticaAString(style: HelveticaStyle, text: String, size: CGFloat, foregroundColor: UIColor, backgroundColor: UIColor, alignment: NSTextAlignment) -> NSAttributedString {
        let fontNameString: String
        switch style {
        case .HelveticaNeue:
            fontNameString = "HelveticaNeue"
        case .HelveticaNeueBold:
            fontNameString = "HelveticaNeue-Bold"
        case .HelveticaNeueItalic:
            fontNameString = "HelveticaNeue-Italic"
        case .HelveticaNeueLight:
            fontNameString = "HelveticaNeue-Light"
        }
        let paragraph = NSMutableParagraphStyle()
        paragraph.alignment = .center
        
        
        let attribute: [NSAttributedString.Key : Any]
        if let font = UIFont(name: fontNameString, size: size) {
            attribute = [
                NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: foregroundColor,
                NSAttributedString.Key.backgroundColor: backgroundColor,
                NSAttributedString.Key.paragraphStyle: paragraph]
        } else {
            attribute = [
                NSAttributedString.Key.foregroundColor: foregroundColor,
                NSAttributedString.Key.backgroundColor: backgroundColor,
                NSAttributedString.Key.paragraphStyle: paragraph]
        }
        return NSAttributedString(string: text, attributes: attribute)
    }
}
