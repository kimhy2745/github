//
//  ContentView.swift
//  Coco
//
//  Created by 김하연 on 11/14/24.
//
import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // 사용자 프로필 이미지 및 레벨
                HStack {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    Text("아이디명  Lv. 15")
                        .font(.title2)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 40)
                
                // 메인 메뉴 버튼들
                VStack(spacing: 20) {
                    NavigationLink(destination: MyPageView()) {
                        Text("마이 페이지")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: ProfileSettingsView()) {
                        Text("회원 탈퇴")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: LoginView()) {
                        Text("로그아웃")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: TermsOfServiceView()) {
                        Text("서비스 이용약관")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Text("개인정보처리방침")
                            .font(.title3)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
            .navigationTitle("홈")
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
