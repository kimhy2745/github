//
//  Medal.swift
//  Coco
//
//  Created by 김하연 on 11/20/24.
//

import SwiftUI

struct Medal: View {
    var body: some View {
        VStack {
            Text("나의 메달화면")
                .font(.largeTitle)
                .padding()
            
            // 마이 페이지의 내용 추가
        }
        .navigationTitle("나의 메달")
    }
}

struct Medal_Previews: PreviewProvider {
    static var previews: some View {
        Medal()
    }
}
