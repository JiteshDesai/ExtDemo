//
//  Utility.swift
//  AlamofireAPIDemoCode
//
//  Created by Brainstorm Jitesh on 21/07/18.
//  Copyright © 2018 Brainstorm Jitesh. All rights reserved.
//
//WSTabBarController
// ESTabBarController
//FlexTabBar
//ExpandableCell
//Picker selection    https://github.com/rushisangani/RSSelectionMenu
//Collapsable Tableview    https://github.com/KiranJasvanee/InfinityExpandableTableTree
//Visual Activity ViewController    https://github.com/naturaln0va/VisualActivityViewController
//Message Input View multiline    https://github.com/KeiroMidori/SBMessageInputView
//Toast Message    https://github.com/scalessec/Toast-Swift
//PaasCode  view    https://www.cocoacontrols.com/controls/bdpasscodeview

import UIKit
//import SVProgressHUD

class Utility: NSObject
{
    static let objUtility = Utility()
    override init() {

    }
    class func showLoader()
    {
        //SVProgressHUD.show()
    }
    class func hideLoader()
    {
       // SVProgressHUD.dismiss()
    }
    class func dicToJSON(dic: NSDictionary) -> String
    {
        var jsonString: String = ""
        do
        {
            let jsonData = try JSONSerialization.data(withJSONObject: dic, options: .prettyPrinted)
            jsonString = String.init(data: jsonData, encoding: .utf8)!
        }
        catch
        {
            print(error.localizedDescription)
            jsonString = ""
        }
        return jsonString
    }
    
    class func generateBoundaryString() -> String
    {
        return "Boundary-\(NSUUID().uuidString)"
    }
    
   class func alertWith(_ title: String = "Demo", message: String, doneTitle:String? = "OK", cancelTitle:String? = "Cancel", doneAction:(()->())? = nil, cancelAction:(()->())? = nil) {
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: doneTitle, style: .default, handler: { (action) in
            if doneAction != nil {
                doneAction!()
            }
        }))
        
        if cancelAction != nil {
            alert.addAction(UIAlertAction(title: cancelTitle, style: .cancel, handler: { (action) in
                cancelAction!()
            }))
        }
        
        DispatchQueue.main.async {
            AppDelegate.sharedDelegate().window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
   class func errorAlert(_ title: String = "Demo", message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
        }))
        
        DispatchQueue.main.async {
            AppDelegate.sharedDelegate().window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    
   class func successAlert(_ title: String = "Demo", message: String, doneAction:(()->())? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            if doneAction != nil {
                doneAction!()
            }
        }))
        DispatchQueue.main.async {
            AppDelegate.sharedDelegate().window?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }
    //MARK:- Random generate String
    class func randomString(withLength len: Int) -> String? {
        let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        var randomString = String(repeating: "\0", count: len)
        for i in 0..<len {
            randomString += "\(letters[letters.index(letters.startIndex, offsetBy: String.IndexDistance(arc4random_uniform(UInt32(letters.count))))])"
        }
        return randomString
    }
    //MARK:- Logout
    class func logoutFromApp()
    {
        UserDefaults.standard.synchronize()
        let storyboard : UIStoryboard = UIStoryboard.init(name: "Main", bundle: nil)
        let login: ViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let loginNavigation = UINavigationController(rootViewController: login)
        let deleObj: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        deleObj.window?.rootViewController = loginNavigation
        deleObj.window?.makeKeyAndVisible()
    }
    
    //MARK:- Email Validation
    class func validateEmail(enteredEmail:String) -> Bool
    {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
    }

}
