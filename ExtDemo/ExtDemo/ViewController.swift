//
//  ViewController.swift
//  ExtDemo
//
//  Created by JITESH on 02/08/18.
//  Copyright © 2018 JITESH. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{
    @IBOutlet var searchBar: UISearchBar!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        searchBar.delegate = self
        self.searchBar.tintColor = API.blackColor()
        self.searchBar.barTintColor = API.lightGrayNavigationBarColor()
        self.searchBar.backgroundColor = API.lightGrayNavigationBarColor()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        
    }
    override func viewWillAppear(_ animated: Bool)
    {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        cvProductList.addObserver(self, forKeyPath: "contentSize", options: .new, context: nil)
    }
    override func viewWillDisappear(_ animated: Bool)
    {
        super.viewWillDisappear(true)
        
        if(cvProductList != nil)
        {
            cvProductList.removeObserver(self, forKeyPath: "contentSize")
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if(keyPath == "contentSize"){
            if let newvalue = change?[.newKey]
            {
                self.setFrames()
            }
        }
    }
    func setFrames()
    {
        cvProductList.frame = CGRect.init(x: cvProductList.frame.origin.x, y: currentY, width: cvProductList.frame.size.width, height: cvProductList.contentSize.height)scrMain.contentSize = CGSize.init(width: 0, height: currentY)
        
    }
    @IBAction func btnSearchAction(_ sender: Any)
    {
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.searchView.frame = CGRect(x: 0, y: 0, width: self.searchView.frame.size.width, height: self.searchView.frame.size.height)
                        self.tblFolders.frame = CGRect(x: self.tblFolders.frame.origin.x, y: self.searchView.frame.origin.y + self.searchView.frame.size.height, width: self.tblFolders.frame.size.width, height: self.tblFolders.frame.size.height)
                        
        }, completion: { (finished) -> Void in
            // ....
            self.searchBar.showsCancelButton = false
            self.searchBar.becomeFirstResponder()
        })
    }
    //MARK:- Searchbar delegate
    public func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool
    {
        searchBar.showsCancelButton = true
        return true
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        //        UIView.animate(withDuration: 0.5,
        //                       delay: 0.5,
        //                       options: UIViewAnimationOptions.curveEaseIn,
        //                       animations: { () -> Void in
        //                        self.searchView.frame = CGRect(x: 0, y: 0, width: self.searchView.frame.size.width, height: self.searchView.frame.size.height)
        //                        self.searchBar.becomeFirstResponder()
        //        }, completion: { (finished) -> Void in
        //            // ....
        //            self.view.endEditing(true)
        //            searchBar.showsCancelButton = false
        //        })
        self.view.endEditing(true)
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.text = ""
        UIView.animate(withDuration: 0.5,
                       delay: 0.5,
                       options: UIViewAnimationOptions.curveEaseIn,
                       animations: { () -> Void in
                        self.searchView.frame = CGRect(x: 0, y: -200, width: self.searchView.frame.size.width, height: self.searchView.frame.size.height)
                        self.tblFolders.frame = CGRect(x: self.tblFolders.frame.origin.x, y: 0, width: self.tblFolders.frame.size.width, height: self.tblFolders.frame.size.height)
                        self.searchBar.resignFirstResponder()
        }, completion: { (finished) -> Void in
            // ....
            
        })
        self.view.endEditing(true)
        searchBar.showsCancelButton = false
        self.arrOfTBLData = self.arrOfTBLDataAll
        self.tblFolders.reloadData()
        self.contentMsg.isHidden = API.isShowContentMessage(arr: self.arrOfTBLDataAll)
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String)
    {
        self.arrOfTBLData = NSMutableArray()
        
        if(searchText == "")
        {
            self.arrOfTBLData = NSMutableArray.init(array: self.arrOfTBLDataAll)
        }
        else
        {
            for item in self.arrOfTBLDataAll
            {
                let dict : NSDictionary = item as! NSDictionary
                
                
                let strToBeSearch:NSString! = (dict.object(forKey: "title") as! String) as NSString
                
                if(((strToBeSearch.uppercased).contains(searchText.uppercased())))
                {
                    self.arrOfTBLData.add(dict)
                }
            }
            
        }
        self.tblFolders.reloadData()
        self.contentMsg.isHidden = API.isShowContentMessage(arr: self.arrOfTBLDataAll)
    }
}

