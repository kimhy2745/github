//
//  Alarm.swift
//  Coco
//
//  Created by 김하연 on 11/21/24.
//


/*
  알람은 토글로 껐다켰다 할 수 있고 만약 켰는데도 안오면 그건 아예 시뮬에서 환경설정 들어가서 알림 켜야해요!
  페이스아이디 사용법 -> 프로젝트 왼쪽 제일 위에 보면 모든 폴더 제일 위에 (앱스토어 로고)(프로젝트이름) 들어가서 오른쪽에
   info -> 그냥 아무거나 (+) -> Privacy Face ID ~~ 선택 -> value 아무거나 적기
    시뮬 실행 시 상단바 feature -> faceid -> enrolled 선택 후 앱 실행 -> 페이스아이디 뜸! -> 이 상태에서 매칭 페이스로 바꾸면 넘어가짐!!
 ==> 근데 이게 계속 됐다가 안됐다가 하드라고요... 좀 더 봐야할 것 같아요
 */
import SwiftUI
import UserNotifications

struct AlarmView: View {
    
    // 알림 상태를 추적하는 변수
    @State private var isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
    @State private var isFaceidfication = true
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @StateObject private var viewModel = LoginViewModel()  // LoginViewModel 사용
    
    var body: some View {
        VStack {
            
            ToplogoView()
            
            Text("알람 & 앱 잠금 설정")
                .padding(.top, 10)
                .padding(.bottom, 10)

            Spacer()
            
            // 알림 허용 설정
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 350, height: 120)
                    .cornerRadius(30)
                    .padding(.top, 30)
                
                VStack {
                    HStack {
                        Text(isNotificationEnabled ? "앱 알림 허용" : "앱 알림 차단")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        
                        Spacer()
                        
                        Toggle("", isOn: $isNotificationEnabled)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255)))
                            .padding(.trailing, 20)
                            .padding(.top, 20)
                    }
                    .frame(width: 330)
                    .padding()
                    
                    Text("⚠️앱 알림 허용이 활성화 되었음에도 알림이 오지 않을 시\n시스템 설정에서 앱의 알림 허용이 활성화 되었는지 확인하십시오.")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            .padding(.bottom, 0)
            
            // Face ID 설정
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 350, height: 130)
                    .cornerRadius(30)
                    .padding(.top, 30)
                
                VStack {
                    HStack {
                        Text(isFaceidfication ? "Face ID 활성화" : "Face ID 비활성화")
                            .foregroundColor(.black)
                            .padding(.leading, 20)
                            .padding(.top, 20)
                        
                        Spacer()
                        
                        Toggle("", isOn: $isFaceidfication)
                            .labelsHidden()
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255)))
                            .padding(.trailing, 20)
                            .padding(.top, 20)
                    }
                    .onChange(of: viewModel.isFaceIDEnabled) { newValue in
                        viewModel.toggleFaceID()
                    }
                    .frame(width: 330)
                    .padding()
                    
                    Text("⚠️Face_ID가 활성화 되었음에도 로그인 시 Face_ID가 활성화\n되지 않는다면, 시스템 설정에서 Face_ID 사용이 활성화 되었는지\n확인하십시오.")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
            .padding(.bottom, 220)
            
            // 적용 버튼
            Button(action: {
                presentationMode.wrappedValue.dismiss()
                
                // 알림 상태 저장
                UserDefaults.standard.set(isNotificationEnabled, forKey: "isNotificationEnabled")
                
                // 알림 상태에 따라 도전과제 알림 관리
                if isNotificationEnabled {
                    pushNotification(
                        title: "알림 설정",
                        body: "알림 기능을 활성화하였습니다!",
                        seconds: 1,
                        identifier: "testNotification"
                    )
                } else {
                    UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["startNotification"])
                }
                
                // Face ID 설정 저장
                viewModel.isFaceIDEnabled = isFaceidfication
                viewModel.faceIDService.saveFaceIDState(isEnabled: isFaceidfication)
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .frame(width: 350, height: 50)
                        .cornerRadius(30)
                    
                    Text("적용하기")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 20)
            }
            .padding()
        }
       
        .onAppear {
            // 앱 실행 시 저장된 알림 설정 불러오기
            if let savedNotificationState = UserDefaults.standard.value(forKey: "isNotificationEnabled") as? Bool {
                isNotificationEnabled = savedNotificationState
            }
            
            // Face ID 상태 불러오기
            isFaceidfication = viewModel.faceIDService.getFaceIDState()
        }
    }
}

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
