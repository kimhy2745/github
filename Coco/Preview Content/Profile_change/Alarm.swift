//
//  Alarm.swift
//  Coco
//
//  Created by 김하연 on 11/21/24.
//

import SwiftUI
import UserNotifications

struct AlarmView: View {
    
    // 알림 상태를 추적하는 변수
    @State private var isNotificationEnabled = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            
            ToplogoView()
            
            Text("알람 & 앱 잠금 설정")
                .padding(.top, 10)
                .padding(.bottom,45)

           Spacer()
            
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.15))
                    .frame(width: 350, height: 120)
                    .cornerRadius(30)
                    .padding(.top, 30)
                
                VStack{
                    HStack {
                        
                        Text(isNotificationEnabled ? "앱 알림 허용" : "앱 알림 차단")
                        //  .font(.headline) // 텍스트 크기
                            .foregroundColor(.black) // 텍스트 색상
                            .padding(.leading, 20) // 텍스트 여백
                            .padding(.top,20)
                        
                        Spacer() // 텍스트와 토글 사이 간격 추가
                        
                        Toggle("", isOn: $isNotificationEnabled) // 빈 문자열로 레이블 제거
                            .labelsHidden() // 토글의 기본 레이블 숨기기
                            .toggleStyle(SwitchToggleStyle(tint: Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))) // 토글 활성화 색상
                            .padding(.trailing, 20) // 토글 오른쪽 여백
                            .padding(.top,20)
                    }
                    .frame(width: 330) // HStack의 전체 너비 조정
                    .padding()
                    Text("앱 알림 허용이 활성화 되었음에도 알림이 오지 않을 시\n시스템 설정에서 앱의 알림 허용이 활성화 되었는지 확인하십시오")
                        .font(.caption)
                        .foregroundColor(.red)
                }
            }
                            .padding()
            
            // 버튼: 알림을 보내는 버튼
            Button("Send Notification") {
                if isNotificationEnabled {
                    // 알림이 켜져 있으면 로컬 알림을 트리거
                    pushNotification(title: "Hello!", body: "이 문자는 준서의 간절함입니다", seconds: 5, identifier: "testNotification")
                } else {
                    print("알림이 꺼져 있습니다. 알림을 켜주세요.")
                }
            }
            
            Button(action: {
                // 뒤로 가기 동작
                presentationMode.wrappedValue.dismiss()
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .frame(width: 350, height: 60)
                        .cornerRadius(30)
                    
                    Text("적용하기")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 210)
            }
            .padding()
        }
        .accentColor(.black)
    }
}
struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}

/*
import SwiftUI

struct AlarmView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
       // NavigationView {
            VStack {
                
                ToplogoView()
                    .offset(y:-15)
                
                Text("알림 & 앱 잠금 설정")
                    .padding(.bottom)
                
              //  Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 350, height: 120)
                        .cornerRadius(30)
                        .padding(.top, 30)
                    
                    VStack(alignment: .leading, spacing: 15) {
                        Text("앱 알림 허용")
                    }
                }
                
            }
          //  .navigationBarBackButtonHidden(true)
        }
    }

struct AlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmView()
    }
}
*/
