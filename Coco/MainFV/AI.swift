//
//  AI.swift
//  Coco
//
//  Created by 김하연 on 12/4/24.
//

import SwiftUI

struct AIView: View {
    var body: some View {
        VStack {
            Text("AI 화면")
                .font(.largeTitle)
                .fontWeight(.bold)
           
        }
        .navigationBarTitle("AI 화면", displayMode: .inline)
    }
}

struct AIView_Previews: PreviewProvider{
static var previews: some View {
        AIView()
    }
}
