
import SwiftUI
import Foundation
private let photoFunction: PhotoFunction = PhotoFunction()

class PhotoDatas: ObservableObject{
    
    @Published var hasLoaded : Bool = false
    
    @Published var itemsPerRow : CGFloat = 3
    
    @Published var uiPhotos:[GridImageView] = [
        //  AnyView(Image("1").resizable().scaledToFill()),
        //  AnyView(Image("1").resizable().scaledToFill()),
    ]
    
    //  all / row   =  rowCount
    func getRowCount(allCount: Int) -> Int{
        let itemsPerRow = Int(self.itemsPerRow)
        // print("allcount????\(allCount)")
        if allCount % itemsPerRow == 0{
            return (allCount / itemsPerRow)
        }else{
            return (allCount / itemsPerRow)+1
        }
    }
    
    //  one row photos
    func getRowContent(rowNumber: Int) ->[GridImageView]{
        var returnItems:[GridImageView] = []
        let itemsPerRow = Int(self.itemsPerRow)
        for i in 0..<itemsPerRow{
            let itemIndex = (rowNumber * itemsPerRow) + i
            returnItems.append(uiPhotos[itemIndex])
        }
        return returnItems
    }
    
    
    // resize grid
    func initImage(imageArrays: [UIImage]) {
        let screenSize = UIScreen.main.bounds
        let gridWidth = screenSize.width / itemsPerRow
        for image in imageArrays {
            let thumbnailPhoto = photoFunction.resizeImage(image, newWidth: gridWidth)

            uiPhotos.append(GridImageView(width: gridWidth, GridImage: thumbnailPhoto))
            print("\(image)")
        }
    }
    
    
    
    
}
