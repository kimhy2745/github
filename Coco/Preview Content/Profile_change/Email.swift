//
//  Email.swift
//  Coco
//
//  Created by 김하연 on 11/21/24.
//

import SwiftUI

struct EmailView: View {
    
    @State private var password: String = ""
    @State private var newemail: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       // NavigationView {
            VStack {
                ToplogoView()
                
                Text("이메일 변경")
                    .padding(.top, 10)
                    .padding(.bottom,55)
                Spacer()
                
                VStack(alignment: .leading, spacing: 15) {
                    Text("현재 비밀번호")
                        .padding(.leading, 40)
                    TextField("현재 비밀번호 입력", text: $password)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(width: 350)
                        .padding(.horizontal, 30.0)
                        .padding(.bottom,20)
                       
                    
                    Text("새 이메일 주소")
                        .padding(.leading, 40)
                    TextField("새 이메일 주소 입력", text: $newemail)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                        .frame(width: 350)
                        .padding(.horizontal, 30.0)
                        
                    Spacer()
                }.offset(y:-25)
                
             
                
                Button(action: {
                    // 뒤로 가기 동작
                    presentationMode.wrappedValue.dismiss()
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                            .frame(width: 350, height: 60)
                            .cornerRadius(30)
                            
                        
                        Text("이메일 변경")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding(.bottom, 310)
                    .offset(y:15)
                }
               
            }
            .accentColor(.black)
        }
     
    }

struct EmailView_Previews: PreviewProvider {
    static var previews: some View {
        EmailView()
    }
}
