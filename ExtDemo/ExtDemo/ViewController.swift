//$(SRCROOT)/$(PROJECT_NAME)/Bridge/Chimbu-Bridge-Header.h
//Picker selection    https://github.com/rushisangani/RSSelectionMenu
//Collapsable Tableview    https://github.com/KiranJasvanee/InfinityExpandableTableTree
//Visual Activity ViewController    https://github.com/naturaln0va/VisualActivityViewController
//Message Input View multiline    https://github.com/KeiroMidori/SBMessageInputView
//Toast Message    https://github.com/scalessec/Toast-Swift
//PaasCode  view    https://www.cocoacontrols.com/controls/bdpasscodeview
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
    //MARK:- Show image upload options
    func showActionSheet()
    {
        self.view.endEditing(true)
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Gallery", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.photoLibrary()
        }))
        actionSheet.addAction(UIAlertAction(title: "Camera", style: UIAlertActionStyle.default, handler: { (alert:UIAlertAction!) -> Void in
            self.camera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive, handler: nil))
        
        
        if ( UIDevice.current.model.range(of: "iPad") != nil)
        {
            actionSheet.popoverPresentationController?.sourceView = self.view
            actionSheet.popoverPresentationController?.sourceRect = self.view.bounds
            
            self.present(actionSheet, animated: true, completion: nil)
        }
        else
        {
            self.present(actionSheet, animated: true, completion: nil)
        }
    }
    
    func camera()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.allowsEditing = true
        myPickerController.sourceType = UIImagePickerControllerSourceType.camera
        
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    func photoLibrary()
    {
        let myPickerController = UIImagePickerController()
        myPickerController.delegate = self;
        myPickerController.allowsEditing = true
        myPickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        self.present(myPickerController, animated: true, completion: nil)
    }
    
    //MARK:- Image pickker delegate methods
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        let image: UIImage = (info[UIImagePickerControllerEditedImage] as? UIImage)!
        
        //imgUserImage.image = image
        DispatchQueue.main.async{
            if let referenceUrl = info[UIImagePickerControllerReferenceURL] as? NSURL
            {
                ALAssetsLibrary().asset(for: referenceUrl as URL!, resultBlock:
                    { asset in
                        let fileName = asset?.defaultRepresentation().filename()
                        //do whatever with your file name
                        let imageName = fileName?.components(separatedBy: ".")
                        print((imageName?[0])!)
                        
                        if self.strFromWhichBtn == "btnPanCardChooseFileAction"
                        {
                            self.imgPanCard = image
                            self.lblPanCardDocName.text = imageName?[0]
                            self.imgPanCardChooseFile.image = image
                        }
                        else if self.strFromWhichBtn == "btnBankChooseFileAction"
                        {
                            self.lblBankDocName.text = imageName?[0]
                            self.imgBank = image
                        }
                        else if self.strFromWhichBtn == "btnAddressProofChooseFrontAction"
                        {
                            self.lblAddressDocFront.text = imageName?[0]
                            self.imgAddFront = image
                        }
                        else if self.strFromWhichBtn == "btnAddressProofChooseBackAction"
                        {
                            self.lblAddressDocBack.text = imageName?[0]
                            self.imgAddBack = image
                        }
                        
                },
                                        failureBlock: nil)
            }
            else
            {
                
                if self.strFromWhichBtn == "btnPanCardChooseFileAction"
                {
                    self.imgPanCard = image
                    self.lblPanCardDocName.text = String(Date().ticks)+".jpg"
                    self.imgPanCardChooseFile.image = image
                }
                else if self.strFromWhichBtn == "btnBankChooseFileAction"
                {
                    self.lblBankDocName.text = String(Date().ticks)+".jpg"
                    self.imgBank = image
                }
                else if self.strFromWhichBtn == "btnAddressProofChooseFrontAction"
                {
                    self.lblAddressDocFront.text = String(Date().ticks)+".jpg"
                    self.imgAddFront = image
                }
                else if self.strFromWhichBtn == "btnAddressProofChooseBackAction"
                {
                    self.lblAddressDocBack.text = String(Date().ticks)+".jpg"
                    self.imgAddBack = image
                }
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController)
    {
        self.dismiss(animated: true, completion: nil)
    }
}

