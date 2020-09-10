

import Foundation
import SwiftUI

struct  CircleProgress : View {
    
    //@State private var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0 ,to: 0.7)
            .stroke(Color.orange,lineWidth: 5)
            .frame(width:100,height: 100 )
            // .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
            .rotationEffect(Angle(degrees: 360))
            .animation(
                Animation.default.repeatForever(autoreverses: false)
            )
        //         .onAppear(){
        //          self.isLoading = true
        //   }
    }
    
    
}








