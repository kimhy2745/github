//
//  NoteView.swift
//  Coco
//
//  Created by 김하연 on 11/20/24.
//

import SwiftUI

struct NoteView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                Text("오답노트 화면")
                    .font(.largeTitle)
                    .padding()
                
                // 마이 페이지의 내용 추가
            }
            .navigationTitle("오답노트")
        }
      //  .navigationBarBackButtonHidden(true)
    }
    
}
struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
