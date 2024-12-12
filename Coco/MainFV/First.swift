import SwiftUI

struct FirstView: View {
    
    @EnvironmentObject var appState: AppState
    @State private var LoginModal = false // 로그인 모달 표시 상태
    @StateObject private var viewModel = LoginViewModel() // ViewModel 추가
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                // 텍스트를 왼쪽 정렬
                Text("코드에 다리를 잇다.")
                    .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                    .padding(.leading, 10) // 왼쪽 여백 추가
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                HStack(spacing: 0) {
                    Text("코")
                        .font(.system(size: 60, weight: .bold))
                        .foregroundColor(Color.black)
                    Text("다리")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(Color.black)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.bottom, 20)
                
                // 로고 이미지
                Image("Logo") // 실제 로고 이미지 이름을 사용하세요.
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 70)
                
                // 시작하기 버튼
                Button(action: {
                    if !appState.conditionMet.contains(10) { // 중복 방지
                        appState.conditionMet.append(10) // 조건 추가
                    }
                    
                    // UserDefaults에서 알림 허용 상태 확인
                        let isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
                        
                    
                    if !appState.hasStartNotification {
                        pushNotification(
                            title: "도전과제10 :",
                            body: "코다리에 오신걸 환영해요!",
                            seconds: 1,
                            identifier: "startNotification"
                        )
                        appState.hasStartNotification = true
                    }
                    LoginModal = true
                }) {
                    ZStack {
                        Rectangle()
                            .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                            .frame(width: 350, height: 60)
                            .cornerRadius(30)
                        
                        Text("시작하기")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                }
                Spacer()
            }
            .padding()
            .overlay(
                // 로그아웃 모달
                LoginView(isShowing: $LoginModal, viewModel: viewModel)
            )
            }.navigationBarBackButtonHidden(true)
        }
    }


//########################################################//

struct LoginView: View {
    @Binding var isShowing: Bool
    @ObservedObject var viewModel: LoginViewModel // ViewModel 추가

    @State private var Membership = false // 회원가입 속성
    @State private var password: String = ""
    @State private var id: String = ""

    var body: some View {
        if isShowing {
            ZStack {
                Color.black.opacity(0.5) // 반투명 배경
                    .frame(width: 420, height: 1500)
                    .ignoresSafeArea()
                

                VStack {
                    Text("로그인")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.black)
                        .padding(.bottom, 20)
                        .padding(.top, 10)
                        .offset(y: 20)

                    VStack(alignment: .leading, spacing: 15) {
                        Text("아이디")
                            .padding(.leading, 40)
                            .padding(.top, 30)
                        TextField("아이디 입력", text: $id)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .frame(width: 330)
                            .padding(.horizontal, 30.0)
                            .padding(.bottom, 10)

                        Text("비밀번호")
                            .padding(.leading, 40)
                        SecureField("비밀번호 입력", text: $password)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 17)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                            .frame(width: 330)
                            .padding(.horizontal, 30.0)
                            .padding(.bottom, 40)
                    }

                    // 로그인 버튼
                    NavigationLink(destination: ContentView()) {
                        ZStack {
                            Rectangle()
                                .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                                .frame(width: 350, height: 60)
                                .cornerRadius(30)

                            Text("로그인")
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.bottom, 20)

                    Button(action: {
                        Membership = true
                    }) {
                        Text("회원가입")
                            .fontWeight(.semibold)
                            .foregroundColor(.green)
                    }
                    .padding(.bottom, 50)
                }
                .frame(width: UIScreen.main.bounds.width, height: 500)
                .background(Color.white)
                .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                .offset(y: 180)
                
                .sheet(isPresented: $Membership) {
                    MembershipView() // 비밀번호 변경 화면을 표시합니다.
                        .presentationDetents([.fraction(0.9), .fraction(0.9)]) // 가능한 크기 범위 설정
                        .presentationDragIndicator(.hidden) // 드래그 인디케이터 제거
                }
            }
        }
    }
}


//########################################################//

struct MembershipView: View {
    
    @State private var password: String = ""
    @State private var id: String = ""
    @State private var mail: String = ""
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            Text("회원가입")
                .font(.system(size: 25, weight: .semibold))
                .foregroundColor(.black)
                .padding(.bottom, 50)
                .padding(.top, 40)
            
            VStack(alignment: .leading, spacing: 15) {
                Text("아이디")
                    .padding(.leading, 40)
                TextField("아이디 입력", text: $id)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(width: 330)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,10)
                
                Text("비밀번호")
                    .padding(.leading, 40)
                SecureField("비밀번호 입력", text: $password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(width: 330)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,10)
                
                Text("비밀번호 확인")
                    .padding(.leading, 40)
                SecureField("비밀번호 재입력", text: $password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(width: 330)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,10)
                
                Text("이메일")
                    .padding(.leading, 40)
                TextField("이메일 입력", text: $mail)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(width: 330)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,10)
                
                Spacer()
            }
            
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .frame(width: 350, height: 50)
                        .cornerRadius(30)
                    
                    Text("회원가입")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                }
            }
            .padding(.bottom,20)
            
        }
        
    }
}

//########################################################//
struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
            .environmentObject(AppState()) // AppState를 미리보기에서 제공
    }
}
