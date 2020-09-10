
import Foundation
import SwiftUI
// grid
struct GridImageView : View {
    var backgroundView: AnyView = AnyView(Color.white)
    var width : CGFloat
    var height : CGFloat = 125
    var GridImage: UIImage
    
    var body: some View {
        Image(uiImage: GridImage)
            .frame(width: width,height:height)
            //.aspectRatio(contentMode: ContentMode.fit)
            .clipped()
            .background(Color.green)
    }
    
}
