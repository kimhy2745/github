import SwiftUI

struct ProfileSettingsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var isShowingLogoutModal = false // 로그아웃 모달 표시 상태
    
    var body: some View {
        VStack {
            
            ToplogoView()
                .offset(y:-30)
            
            Text("프로필 수정")
                .padding(.top,10)
            ZStack {
                Rectangle()
                    .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                    .frame(width: 350, height: 550)
                    .cornerRadius(30)
                    .padding(.top, 20)
                
                VStack {
                    Text("계정")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .offset(x:-130, y: -110)
                        .padding(.bottom,30)
                    NavigationLink(destination: PasswordView()) {
                        Text("비밀번호 변경하기")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 30)  // 버튼 왼쪽 여백
                    .padding(.vertical, 10) // 버튼 높이 (터치 영역 확보)
                    .background(Color.clear)  // 배경을 투명으로 설정
                    .contentShape(Rectangle()) // 터치 가능한 영역을 확실하게 설정
                    .offset(x:-80, y: -130)
                    
                    NavigationLink(destination: EmailView()) {
                        Text("이메일 변경하기")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 30)  // 버튼 왼쪽 여백
                    .padding(.vertical, 10) // 버튼 높이 (터치 영역 확보)
                    .background(Color.clear)  // 배경을 투명으로 설정
                    .contentShape(Rectangle()) // 터치 가능한 영역을 확실하게 설정
                    .offset(x:-85, y: -130)
                    
                    Button(action: {
                        isShowingLogoutModal = true // 로그아웃 모달 표시
                    }) {
                        Text("로그아웃")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 30)  // 버튼 왼쪽 여백
                    .padding(.vertical, 10) // 버튼 높이 (터치 영역 확보)
                    .background(Color.clear)  // 배경을 투명으로 설정
                    .contentShape(Rectangle()) // 터치 가능한 영역을 확실하게 설정
                    .offset(x:-105, y: -130)
                    
                    NavigationLink(destination: WithdrawView()) {
                        Text("회원 탈퇴하기")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 30)  // 버튼 왼쪽 여백
                    .padding(.vertical, 10) // 버튼 높이 (터치 영역 확보)
                    .background(Color.clear)  // 배경을 투명으로 설정
                    .contentShape(Rectangle()) // 터치 가능한 영역을 확실하게 설정
                    .offset(x:-90, y: -130)
                }
                
                Divider()
                    .frame(width: 305)
                    .frame(height: 0.5)  // 선의 두께 조정
                    .background(Color.gray)  // 선 색상 설정
                    .offset(y:30)
                
                VStack {
                    Text("앱 이용")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.gray)
                        .offset(x:-110, y: 155)
                        .padding(.bottom,30)
                    
                    NavigationLink(destination: AlarmView()) {
                        Text("알림 & 앱 잠금 설정")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 30)  // 버튼 왼쪽 여백
                    .padding(.vertical, 10) // 버튼 높이 (터치 영역 확보)
                    .background(Color.clear)  // 배경을 투명으로 설정
                    .contentShape(Rectangle()) // 터치 가능한 영역을 확실하게 설정
                    .offset(x:-70, y: 135)
                    
                    NavigationLink(destination: TermsOfServiceView()) {
                        Text("서비스 이용약관")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 30)  // 버튼 왼쪽 여백
                    .padding(.vertical, 10) // 버튼 높이 (터치 영역 확보)
                    .background(Color.clear)  // 배경을 투명으로 설정
                    .contentShape(Rectangle()) // 터치 가능한 영역을 확실하게 설정
                    .offset(x:-80, y: 145)
                    
                    NavigationLink(destination: PrivacyPolicyView()) {
                        Text("개인정보 처리방침")
                            .font(.subheadline)
                            .foregroundColor(.black)
                    }
                    .padding(.leading, 30)  // 버튼 왼쪽 여백
                    .padding(.vertical, 10) // 버튼 높이 (터치 영역 확보)
                    .background(Color.clear)  // 배경을 투명으로 설정
                    .contentShape(Rectangle()) // 터치 가능한 영역을 확실하게 설정
                    .offset(x:-75, y: 155)
                    
                }
            }
            Spacer()
                .padding(.bottom,80)
                .overlay(
                    // 로그아웃 모달
                    LogoutModalView(isShowing: $isShowingLogoutModal)
                )
                .navigationBarTitle("")  // 제목 숨기기
                .navigationBarBackButtonHidden(false)
                .accentColor(.black) // 뒤로가기 버튼 색상 변경
        }
    }
    
    struct LogoutModalView: View {
        @Binding var isShowing: Bool
        @State private var navigateToFirstView = false // FirstView로 이동할 상태
        
        var body: some View {
            if isShowing {
                ZStack {
                    Color.black.opacity(0.5) // 반투명 배경
                        .frame(width: 420,height: 1500)
                        .ignoresSafeArea()
                    
                    VStack {
                        Text("로그아웃 하시겠습니까?")
                            .padding(.bottom,20)
                        
                        HStack {
                            Button(action: {
                                // 로그아웃 후 FirstView로 이동
                                navigateToFirstView = true
                            }) {
                                Text("예")
                                    .font(.footnote)
                                    .frame(width: 100, height: 40)
                                    .background(Color(red: 133/255, green: 234/255, blue: 236/255))
                                    .foregroundColor(.black)
                                    .cornerRadius(30)
                            }
                            .background(
                                NavigationLink(destination: FirstView(), isActive: $navigateToFirstView) {
                                    EmptyView() // 숨겨진 NavigationLink
                                }
                            )
                            
                            Button(action: {
                                isShowing = false // 모달 닫기
                            }) {
                                Text("아니오")
                                    .font(.footnote)
                                    .frame(width: 100, height: 40)
                                    .background(Color.gray.opacity(0.2))
                                    .foregroundColor(.black)
                                    .cornerRadius(30)
                            }
                        }
                    }
                    .frame(width: 280, height: 150)
                    .background(Color.white)
                    .cornerRadius(20)
                    .shadow(radius: 10)
                    .offset(y:-350)
                }
            }
        }
           
    }
}

struct ProfileSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSettingsView()
    }
}
