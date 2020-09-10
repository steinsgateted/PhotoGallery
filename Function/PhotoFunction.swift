

import Foundation
import Photos
import SwiftUI


struct PhotoFunction{
    
    //MARK: grab photos
    func grabPhotos() -> [UIImage]{
        var imageArray = [UIImage]()
        
        //  DispatchQueue.global(qos: .background).async {
        let imgManager=PHImageManager.default()
        
        let requestOptions=PHImageRequestOptions()
        requestOptions.isSynchronous=true
        requestOptions.deliveryMode = .highQualityFormat
        
        //sort
        let fetchOptions=PHFetchOptions()
        fetchOptions.sortDescriptors=[NSSortDescriptor(key:"creationDate", ascending: false)]
        
        let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
        print("fetchResult? \(fetchResult)") //<PHFetchResult: 0x600002bb4a00> count=6
        print("fetchResult.count?\(fetchResult.count)") //6

        if fetchResult.count > 0 {
            for i in 0..<fetchResult.count{
                // photo name
                let photoName = fetchResult.object(at: i).value(forKey: "filename")
                
                print("photoName is? \(photoName)")
                
                // let photoCreationData = fetchResult.object(at: i).value(forKey: "creationDate")
                
                // print("photoCreationData is???? \(photoCreationData)")
                
                
                let photoModificationDate = fetchResult.object(at: i).value(forKey: "modificationDate")
                
                print("photoModificationDate is? \(photoModificationDate)")
                
                
                imgManager.requestImage(for: fetchResult.object(at: i) as PHAsset, targetSize: CGSize(width:300, height: 300),contentMode: .aspectFill, options: requestOptions, resultHandler: { (image, error) in
                    imageArray.append(image!)
                })

            }
        } else {
            print("You got no photos.")
        }
        print("imageArray count: \(imageArray.count)") //6
        
        return imageArray
    }
    
    func resizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage {
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        print("newWidth\(newWidth)")
        print("newHeight\(newHeight)")
        
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        let imageData = image.jpegData(compressionQuality: 0.5)! as Data
        UIGraphicsEndImageContext()
        return UIImage(data:imageData)!
    }
    
    
    
    
    
}
