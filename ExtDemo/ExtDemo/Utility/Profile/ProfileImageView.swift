//  Converted with Swiftify v1.0.6472 - https://objectivec2swift.com/
//
//  ProfileImageView.swift
//  Bound
//
//  Created by Avikant Saini on 2/16/17.
//  Copyright © 2017 avikantz. All rights reserved.
//

import FBSDKCoreKit
import SDWebImage
import UIKit

class ProfileImageView: UIView {
    private var _imageURL: URL?
    var imageURL: URL? {
        get {
            return _imageURL
        }
        set(imageURL) {
            _imageURL = imageURL
            let fileName: String? = imageURL?.lastPathComponent
            let manager = DADataManager.shared() as? DADataManager
            if (manager?.fileExists(inDocuments: fileName))! {
                image = UIImage(contentsOfFile: (manager?.documentsPath(forFileName: fileName))!)
            }
            //TODO:- Add by Jitesh
            SDWebImageManager.shared().imageDownloader?.downloadImage(with: imageURL, options: .continueInBackground, progress: nil, completed: {(image:UIImage?, data:Data?, error:Error?, finished:Bool) in
                DispatchQueue.main.async(execute: {() -> Void in
                     manager?.save(data, toDocumentsFile: fileName)
                    self.image = image
                })
            })
            //TODO:- Commented by Jitesh
//            SDWebImageDownloader.shared().downloadImage(with: imageURL, options: .highPriority, progress: nil, completed: {(_ image: UIImage, _ data: Data, _ error: Error?, _ finished: Bool) -> Void in
//                DispatchQueue.main.async(execute: {() -> Void in
//                    manager?.save(data, toDocumentsFile: fileName)
//                    self.image = image
//                })
//            } as? SDWebImageDownloaderCompletedBlock)
        }
    }
    var _image: UIImage?
    var image: UIImage? {
        get {
            return _image
        }
        set(image) {
            guard let img = image else {
                return
            }
            _image = maskImage(image!, to: UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: (image?.size.width)!, height: (image?.size.height)!)))
            setNeedsDisplay()
        }
    }
    @IBInspectable private var _percentFill: CGFloat = 0.0
    @IBInspectable var percentFill: CGFloat {
        get {
            return _percentFill
        }
        set(percentFill) {
            _percentFill = percentFill
            if percentFill == 0 {
                _percentFill = 1.0
            }
            setNeedsDisplay()
        }
    }

    func fetchImageFromFacebook() {
        
        let fbID = UserDefaults.standard.value(forKey: "userFBID")
        print(fbID)
        var facebookProfileUrl = "http://graph.facebook.com/\(fbID!)/picture?type=large"
        print(facebookProfileUrl)
        let url = URL(string: facebookProfileUrl)
        self.imageURL = url
        
//        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id,picture.width(320).height(320)"]).start(completionHandler: {(_ connection: FBSDKGraphRequestConnection, _ result: Any, _ error: Error?) -> Void in
//            if error == nil {
//                print((result as AnyObject).value(forKey: "id"))
//                var facebookProfileUrl = "http://graph.facebook.com/\((result as AnyObject).value(forKey: "id"))/picture?type=large"
//                let imageStringOfLoginUser = (((result as AnyObject).value(forKey: "picture") as AnyObject).value(forKey: "data") as AnyObject).value(forKey: "url") as? String
//                let url = URL(string: imageStringOfLoginUser!)
//                self.imageURL = url
//            }
//            } as? FBSDKGraphRequestHandler)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let radius: CGFloat = width / 2 - 10
        let startAngle: CGFloat = CGFloat(-M_PI_2)
        let endAngle: CGFloat = 2 * .pi * percentFill - CGFloat(M_PI_2)
        let centerPoint = CGPoint(x: width / 2, y: height / 2)
            //	CGImageRef imageRef = self.image.CGImage;
        let arc: CGMutablePath = CGMutablePath()
        arc.addArc(center: CGPoint(x: centerPoint.x, y: centerPoint.y), radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: false, transform: .identity)
        let arctwo: CGMutablePath = CGMutablePath()
        arctwo.addArc(center: CGPoint(x: centerPoint.x, y: centerPoint.y), radius: radius, startAngle: endAngle, endAngle: startAngle, clockwise: false, transform: .identity)
        let lineWidth: CGFloat = 8.0
        let strokedArc: CGPath = arc.copy(strokingWithWidth: lineWidth, lineCap: .butt, lineJoin: .miter, miterLimit: 16, transform: .identity)
        let strokedArctwo: CGPath = arctwo.copy(strokingWithWidth: lineWidth, lineCap: .butt, lineJoin: .miter, miterLimit: 16, transform: .identity)
        let c: CGContext? = UIGraphicsGetCurrentContext()
        image?.draw(in: bounds.insetBy(dx: 14, dy: 14))
        c?.addPath(strokedArctwo)
        c?.setFillColor(UIColor.white.cgColor)
        c?.setStrokeColor(UIColor.white.cgColor)
        c?.drawPath(using: .fillStroke)
        c?.addPath(strokedArc)
        c?.setFillColor((MyConstants.COLOR_PRIMARY_RED?.cgColor)!)
        c?.setStrokeColor((MyConstants.COLOR_PRIMARY_RED?.cgColor)!)
        c?.drawPath(using: .fillStroke)
        let shadowColor: CGColor = UIColor(white: 0.0, alpha: 0.75).cgColor
        c?.saveGState()
        c?.setShadow(offset: CGSize(width: 0, height: 2), blur: 3.0, color: shadowColor)
        c?.fillPath()
        c?.restoreGState()
        c?.addPath(strokedArc)
        c?.strokePath()
    }

    func maskImage(_ originalImage: UIImage, to path: UIBezierPath) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(originalImage.size, false, 0)
        path.addClip()
        originalImage.draw(at: CGPoint.zero)
        let maskedImage = UIGraphicsGetImageFromCurrentImageContext() as? UIImage
        UIGraphicsEndImageContext()
        return maskedImage ?? UIImage()
    }
}
