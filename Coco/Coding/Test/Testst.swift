//
//  TLangChoice.swift
//  Coco
//
//  Created by 김하연 on 12/5/24.
//

import SwiftUI

struct TeststView: View {
    
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        VStack {
            ZStack {
                // 사각형 배경
                Rectangle()
                    .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight])) // 위쪽 모서리만 둥글게
                    .offset(y:-90)
                
                VStack {
                    ToplogoView()
                    
                    Image("Lco")
                        .resizable()
                        .frame(width: 150, height: 60)
                        .padding(.bottom, 10)
                        .offset(y:-90)
                
                    // 말풍선
                    SpeechBubble(text: "코다리에 오신걸 환영합니다!\n본격적으로 코딩 공부를 하기 전에\n간단한 레벨 테스트로 실력을 확인한 후,\n맞춤형 학습을 도와드릴게요!")
                        .frame(width: 300, height: 200)
                        .padding(.bottom)
                        .offset(y:-60)
                }
            }
            
            // 아래에 위치한 HStack
            HStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 5, height: 100)
                    .padding(.trailing, 10)
                
                VStack {
                    HStack{
                        Text("Level Test  :")
                            .font(.title)
                            .padding(.bottom, 10)
                            .padding(.trailing,10)
                        
                        Text("10개의 랜덤 문제 ")
                            .font(.title3)
                            .padding(.bottom, 10)
                    }
                    Text("풀이로 자신의 레벨 테스트하기")
                        .font(.title3)
                        .padding(.trailing, 60)
                }
                .padding(.trailing, 30)
            }
            //.padding(.bottom, 50)
            .offset(y: -75)
             
            VStack(alignment: .leading,spacing: 30){
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    
                    Text("10개의 문제")
                  
                }
                
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    
                    Text("C언어, Java, python 총 세 가지 언어\n중 랜덤으로 출제")
                  
                }
                
                HStack {
                    Image(systemName: "checkmark.circle.fill")
                    
                    Text("빈칸 채우기 유형")
                  
                }
                
            }
            .offset(y:-50)
            
            // Play 버튼
            Button(action: {
                if !appState.conditionMet.contains(1) { // 중복 방지
                    appState.conditionMet.append(1) // 조건 추가
                }
                // UserDefaults에서 알림 허용 상태 확인
                    let isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
                
                
                if isNotificationEnabled && !appState.hasSentNoteNotification { // 알림이 한 번만 울리도록 체크
                    pushNotification(
                        title: "도전과제1 :",
                        body: "과연 어떤 레벨을 받을까요?",
                        seconds: 1,
                        identifier: "testNotification"
                    )
                    appState.hasSentNoteNotification = true
                }
            }) {
                VStack {
                    Text("테스트 시작하기")
                        .font(.subheadline)
                        .foregroundColor(.black)
                }
            }
            .frame(width: 350, height: 50) // 버튼 크기 조정
            .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
            .cornerRadius(30)

            .offset(y:-20)
        }
    }
}

struct SpeechBubble: View {
    var text: String
    
    var body: some View {
        VStack {
            ZStack {
                // 말풍선 배경
                RoundedRectangle(cornerRadius: 15)
                    .fill(Color.white)
                    .shadow(radius: 5)  // 그림자 추가
                    .overlay(
                        // 말풍선의 꼬리 (삼각형)
                        Triangle()
                            .fill(Color.white)
                            .frame(width: 30, height: 40)
                            .rotationEffect(.degrees(0))
                            .offset(x: 0, y: -95) // 꼬리 위치 조정
                    )
                
                Text(text)  // 말풍선 안의 텍스트
                    .font(.body)
                    .padding()
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)  // 텍스트 가운데 정렬
                    .frame(maxWidth: .infinity, alignment: .center) // 가로로 중앙 정렬
            }
            .padding(.bottom, 40)
        }
    }
}

// 삼각형을 만들기 위한 Shape 구조체
struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY)) // 삼각형의 위 꼭지점
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY)) // 왼쪽 아래
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY)) // 오른쪽 아래
        path.closeSubpath() // 삼각형을 완성
        return path
    }
}

struct TeststView_Previews: PreviewProvider {
    static var previews: some View {
        TeststView()
    }
}
