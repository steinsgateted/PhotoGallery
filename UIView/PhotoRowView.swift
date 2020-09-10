

import Foundation
import SwiftUI


// one row
struct PhotoRowView: View{
    var itemsPerRow: CGFloat
    var contents:[GridImageView]
    
    var body: some View {
        HStack(spacing:0){
            ForEach(0..<contents.count){ i in
                self.contents[i]
            }
            
        }
    }
}
