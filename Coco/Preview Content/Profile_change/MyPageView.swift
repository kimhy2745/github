//
//  Untitled.swift
//  Coco
//
//  Created by 김하연 on 11/20/24.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack {
            Text("My Page 화면")
                .font(.largeTitle)
                .padding()
            
            // 마이 페이지의 내용 추가
        }
        .navigationTitle("마이 페이지")
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
