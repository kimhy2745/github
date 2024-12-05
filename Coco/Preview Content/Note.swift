//
//  NoteView.swift
//  Coco
//
//  Created by 김하연 on 11/20/24.
//

import SwiftUI

struct Note: View {
    var body: some View {
        VStack {
            Text("오답노트 화면")
                .font(.largeTitle)
                .padding()
            
            // 마이 페이지의 내용 추가
        }
        .navigationTitle("오답노트")
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
