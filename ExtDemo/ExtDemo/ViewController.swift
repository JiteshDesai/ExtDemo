//$(SRCROOT)/$(PROJECT_NAME)/Bridge/Chimbu-Bridge-Header.h
//Picker selection    https://github.com/rushisangani/RSSelectionMenu
//Collapsable Tableview    https://github.com/KiranJasvanee/InfinityExpandableTableTree
//Visual Activity ViewController    https://github.com/naturaln0va/VisualActivityViewController
//Message Input View multiline    https://github.com/KeiroMidori/SBMessageInputView
//Toast Message    https://github.com/scalessec/Toast-Swift
//PaasCode  view    https://www.cocoacontrols.com/controls/bdpasscodeview


let LANGUAGE_KEY  = "selected_language"
let LANGUAGE_TYPE = "selected_language_type"
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
        cvProductList.frame = CGRect.init(x: cvProductList.frame.origin.x, y: currentY, width: cvProductList.frame.size.width, height: cvProductList.contentSize.height)
        scrMain.contentSize = CGSize.init(width: 0, height: currentY)
        
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
    //LOCALIZE
    open static func setLocalize(strKey: String) -> String
    {
        let mapping: StringMapping = StringMapping()
        return mapping.string(forKey: strKey)
    }
    open static func setSelectedLanguage(type: String)
    {
        UserDefaults.standard.setValue(type, forKey: LANGUAGE_KEY)
        UserDefaults.standard.synchronize()
    }
    open static func getSelectedLanguage() -> String
    {
        return UserDefaults.standard.value(forKey:LANGUAGE_KEY) as! String
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
    
    
//    //MARK:- Set Method
//    func getPhotoLibrary()
//    {
//        self.arrOfTBLData = NSMutableArray()
//        self.arrOfTBLDataAll = NSMutableArray()
//        // Get PhotoLibrary
//        DispatchQueue.global().async {
//            let status = PHPhotoLibrary.authorizationStatus()
//            if (status == PHAuthorizationStatus.authorized){
//                self.getVideoFolderListFromGallery()
//            }else {
//
//                PHPhotoLibrary.requestAuthorization(({ (newStatus) in
//                    if (newStatus == PHAuthorizationStatus.authorized)
//                    {
//                        self.getVideoFolderListFromGallery()
//                    }else
//                    {
//                        self.getPhotoLibrary()
//                    }
//                }))
//
//            }
//        }
//    }
//    func getVideoFolderListFromGallery()
//    {
//        self.arrAssetCollection = NSMutableArray()
//        self.arrOfTBLDataAll = NSMutableArray()
//        self.arrOfTBLData = NSMutableArray()
//        DispatchQueue.global(qos: .background).async {
//            self.custObj.showSVHud("Loading")
//            let fetchFolder:PHFetchOptions? = PHFetchOptions()
//            fetchFolder?.sortDescriptors = [NSSortDescriptor(key:"localizedTitle", ascending: true)]
//            let fetchVideos: PHFetchOptions = PHFetchOptions()
//            fetchVideos.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
//            fetchVideos.predicate = NSPredicate(format: "mediaType = %d ", PHAssetMediaType.video.rawValue)
//            let assetCollections1 = PHAssetCollection.fetchAssetCollections(with: .smartAlbum, subtype: .any, options: nil)
//
//            for i in 0 ..< assetCollections1.count
//            {
//                if let assetCollection = assetCollections1[i] as? PHAssetCollection
//                {
//                    self.arrAssetCollection.add(assetCollection)
//                }
//            }
//            let assetCollections2 = PHAssetCollection.fetchAssetCollections(with: .album, subtype: .any, options: nil)
//            for j in 0 ..< assetCollections2.count
//            {
//                if let assetCollection = assetCollections2[j] as? PHAssetCollection
//                {
//                    self.arrAssetCollection.add(assetCollection)
//                }
//                if j == assetCollections2.count-1
//                {
//                    for i in 0 ..< self.arrAssetCollection.count
//                    {
//                        let assetCollectionItem : PHAssetCollection = self.arrAssetCollection.object(at: i) as! PHAssetCollection
//                        let dic: NSMutableDictionary = NSMutableDictionary()
//                        dic.setValue(assetCollectionItem.localizedTitle, forKey: "title")
//                        let  assets = PHAsset.fetchAssets(in: assetCollectionItem, options: fetchVideos)
//                        dic.setValue(assets.count, forKey: "videoCount")
//                        dic.setValue(assets, forKey: "assets")
//                        self.arrOfTBLDataAll.add(dic)
//
//                        //                        if i == self.arrAssetCollection.count - 1
//                        //                        {
//                        //                            print(self.arrOfTBLDataAll)
//                        //                            self.arrOfTBLData = self.arrOfTBLDataAll
//                        //                            self.contentMsg.isHidden = API.isShowContent(count: self.arrOfTBLDataAll.count)
//                        //                            self.tblFolders.reloadData()
//                        //                        }
//                    }
//
//                }
//            }
//            DispatchQueue.main.async {
//                self.arrOfTBLData = self.arrOfTBLDataAll
//                self.contentMsg.isHidden = API.isShowContent(count: self.arrOfTBLDataAll.count)
//                self.tblFolders.reloadData()
//                self.custObj.hideSVHud()
//            }
//        }
//    }
    
}

//extension AVURLAsset {
//    var fileSize: Float? {
//        let keys: Set<URLResourceKey> = [.fileSizeKey]
//        //let keys: Set<URLResourceKey> = [.totalFileSizeKey, .fileSizeKey]
//        let resourceValues = try? url.resourceValues(forKeys: keys)
//        let totalSize: Float = Float.init((resourceValues?.fileSize)!)
//        return (totalSize/(1024.0 * 1024.0))
//    }
//    func getTotalMediaTime() -> String
//    {
//        let totalSeconds = Int(CMTimeGetSeconds(self.duration))
//        let minutes = totalSeconds / 60
//        let seconds = totalSeconds % 60
//        let mediaDuration :String = String(format:"%02i:%02i",minutes, seconds)
//        return mediaDuration
//    }
//    func getThumbnailFrom(path: URL) -> UIImage? {
//        do {
//            let asset = AVURLAsset(url: path , options: nil)
//            let imgGenerator = AVAssetImageGenerator(asset: asset)
//            imgGenerator.appliesPreferredTrackTransform = true
//            let cgImage = try imgGenerator.copyCGImage(at: CMTimeMake(0, 1), actualTime: nil)
//            let thumbnail = UIImage(cgImage: cgImage)
//            return thumbnail
//        } catch let error {
//            print("*** Error generating thumbnail: \(error.localizedDescription)")
//            return UIImage(named:"placeholder")
//        }
//    }
//}
//extension AVAsset {
//    var screenSize: CGSize? {
//        if let track = tracks(withMediaType: .video).first {
//            let size = __CGSizeApplyAffineTransform(track.naturalSize, track.preferredTransform)
//            return CGSize(width: fabs(size.width), height: fabs(size.height))
//        }
//        return nil
//    }
//}
