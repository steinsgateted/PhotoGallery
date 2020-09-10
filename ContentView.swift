

import SwiftUI
private let photoFunction: PhotoFunction = PhotoFunction()

struct ContentView: View {
    @ObservedObject var PhotoDatas: PhotoDatas
    
    var body: some View {
        Group{
            if PhotoDatas.hasLoaded {
                ScrollView{
                    VStack(spacing:0){
                        ForEach(0..<self.PhotoDatas.getRowCount(allCount: self.PhotoDatas.uiPhotos.count)){ i in
                            PhotoRowView(itemsPerRow: self.PhotoDatas.itemsPerRow ,
                                    contents: self.PhotoDatas.getRowContent(rowNumber: i))
                        }
                    }
                }
            }else{
                // show progress bar
                CircleProgress()
            }
        }.onAppear(){
            DispatchQueue.main.async {
                self.PhotoDatas.initImage(imageArrays: photoFunction.grabPhotos())
                //self.PhotoDatas.initImage(imageArrays: photoFunction.grabPhotos())
               // self.PhotoDatas.initImage(imageArrays: photoFunction.grabPhotos())
               // self.PhotoDatas.initImage(imageArrays: photoFunction.grabPhotos())
                self.PhotoDatas.hasLoaded = true
            }
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(PhotoDatas: PhotoDatas())
    }
}



