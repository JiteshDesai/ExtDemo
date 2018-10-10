//
//  StringLocalizationClass.swift
//  EVOT
//
//  Created by JITESH on 10/10/18.
//  Copyright © 2018 Brainstorm Jitesh. All rights reserved.
//

import UIKit

class StringLocalizationClass: NSObject
{
    var dictLocalization: [AnyHashable : Any] = [:]
    var dictStringMappings: [AnyHashable : Any] = [:]
    
    static let shareInstance : StringLocalizationClass = StringLocalizationClass()
    
    init() {
        if super.init() != nil
        {
            var stringsPath = URL(fileURLWithPath: Bundle.main.resourcePath ?? "").appendingPathComponent("StringMapping.plist").absoluteString
            dictLocalization = [AnyHashable : Any](contentsOfFile: stringsPath)
            
            var defaults = UserDefaults.standard
            if defaults.object(forKey: LANGUAGE_KEY) == nil {
                defaults.setValue("en", forKey: LANGUAGE_KEY)
                defaults.setValue("1", forKey: LANGUAGE_TYPE)
                defaults.setValue("msg", forKey: "msgKey")
                defaults.synchronize()
            }
            if let aKEY = defaults.object(forKey: LANGUAGE_KEY) {
                dictStringMappings = dictLocalization[aKEY]
            }
        }
    }
    func setLanguage() {
        
        let defaults = UserDefaults.standard
        if let aKEY = defaults.object(forKey: LANGUAGE_KEY) {
            dictStringMappings = dictLocalization[aKEY]
        }
    }
    func string(forKey strKey: String) -> String?
    {
        let strMapping = dictStringMappings[strKey] as? String
        if (strMapping?.count ?? 0) == 0 {
            return strKey
        }
        return strMapping
    }
    
    func alertMsg(forKey strKey: String?) -> String? {
        
        let dictAlertgMappings = dictStringMappings["AlertMessages"] as? [AnyHashable : Any]
        let strMapping = dictAlertgMappings?[strKey] as? String
        return strMapping
    }

}
