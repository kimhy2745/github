//
//  Withdraw.swift
//  Coco
//
//  Created by 김하연 on 11/21/24.
//

import SwiftUI

struct WithdrawView: View {
    
    @State private var password: String = ""
    @State private var email: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            ToplogoView()
           
            Text("회원 탈퇴")
                .padding(.bottom, 0)
                .offset(y:-130)
            
            
            VStack(alignment: .leading) {
                Text("회원 000에 대한 탈퇴를")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .offset(y:-105)
                 
                Text("진행하시겠습니까?")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal, 20)
                    .offset(y:-105)
                
                Text("회원 탈퇴 시 :")
                    .padding(.horizontal, 20)
                    .foregroundColor(.gray)
                    .offset(y:-95)
                
                Group {
                        Text("탈퇴 시 학습 기록 및 개인 정보가 영구적으로 삭제되며,\n복구가 불가능합니다.")
                        .offset(y:-80)
                        Text("법적 요구가 없는 한 탈퇴 시 모든 개인정보는 삭제되며, 익명화된 통계 데이터는 보관될 수 있습니다.")
                        .offset(y:-60)
                        Text("탈퇴 후 일정 기간 내 동일 계정으로 재가입이 제한될 수 있습니다.")
                        .offset(y:-30)
                        Text("탈퇴 시 계정 삭제와 관련한 책임은 사용자 본인에게 있으며, 이후 데이터 복구가 불가능함을 안내합니다.")
                                       .foregroundColor(.red)
                               }
                               .font(.subheadline)
                               .padding(.horizontal, 40)
                               .lineLimit(nil) // 줄바꿈 제한 제거
                               .multilineTextAlignment(.leading) // 텍스트 정렬
                               .fixedSize(horizontal: false, vertical: true) // 가로는 화면에 맞추고, 세로는 확장
                           }
                           .padding(.bottom, 10)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("이메일 주소")
                    .font(.subheadline)
                    .padding(.leading, 20)
                
                TextField("이메일 주소", text: $email)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    .frame(height: 50)
                
                Text("비밀번호 확인")
                    .font(.subheadline)
                    .padding(.leading, 20)
                
                SecureField("비밀번호 확인", text: $password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    .frame(height: 50)
            }
            
            Spacer()
            
            Button(action: {
                // 뒤로 가기 동작
                presentationMode.wrappedValue.dismiss()
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .frame(width: 350, height: 60)
                        .cornerRadius(30)
                    
                    Text("회원 탈퇴하기")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom, 30)
            .offset(y:20)
        }
        .accentColor(.black)
    }
}

struct WithdrawView_Previews: PreviewProvider {
    static var previews: some View {
        WithdrawView()
    }
}
