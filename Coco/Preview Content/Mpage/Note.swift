//
//  NoteView.swift
//  Coco
//
//  Created by 김하연 on 11/20/24.
//
/*
        오답노트도 파이어베이스때문에 일단 틀린 문제 흰색 사각형으로 출력될 정도 범위만큼 배경 깔아두고 스크롤뷰로
    해둬서 문제 개수 늘어나면 스크롤 해서 계속 볼 수 있게 해뒀어요! 스크롤뷰 안에 오빠가 만드신 오답 출력 코드 넣기만
     하면 아마 문제 없이 될거에요! 아래 챗봇 버튼도 넣어뒀어요 피그마에서는 오른쪽 하단으로 되어있어서 전부 오른쪽 하단으로 해두긴 하는데 가운데가 맘에 드시면 가운데에 그냥 둬도 좋을 것 같아요!
 
 */


import SwiftUI

struct NoteView: View {
    
    @State private var isShowingSheet = false // ChatBotView를 표시할지 여부
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var appState: AppState
    
    var body: some View {
        NavigationView {
            VStack {
                ToplogoView()
                    .offset(y:-30)
                
                Text("오답노트")
                    .padding(.top, 10)
                    .padding(.bottom,20)
                
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                        .frame(width: 350, height: 520)
                        .cornerRadius(30)
                        .padding(.top, 10)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("""
                            여기에 틀린문제 네모박스로 뜨는거 넣으면 되는데, 텍스트 지우고
                            틀린문제 네모로 띄우는거 VStack 안에 넣음 됩니당~ 문제 많아지면 알아서 스크롤     범위 따라서 스크롤하면 보이고 그럴거에여!! 대신 범위가 width: 330이라
                            틀린문제 네모 가로길이는 330보다 짧아야 예쁘게 나올 것 같아염!!
                            """)
                            .font(.body)
                            .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    }
                    .frame(width: 330, height: 500)
                    
                }
                
                // 아래쪽에 NavigationLink 배치
                NavigationLink(destination: ChatBotView(isPresented: $isShowingSheet)) {
                    VStack {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                    }
                    .frame(width: 80, height: 80)
                    .background(Color.white)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 1)
                    )
                    .padding(.top, 20) // 위치를 위로 띄우기 위한 패딩
                    .padding(.leading,250)
                }
                .simultaneousGesture(TapGesture().onEnded {
                    // UserDefaults에서 알림 허용 상태 확인
                    let isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
                    
                    // 알림 허용 상태일 경우에만 알림 전송
                    if isNotificationEnabled {
                        if !appState.hasSentAINotification {
                            pushNotification(
                                title: "도전과제2 :",
                                body: "코다리에게 처음으로 질문했다!",
                                seconds: 1,
                                identifier: "aiNotification"
                            )
                            appState.hasSentAINotification = true
                        }
                    }
                    
                    // 도전과제 조건 충족 여부 업데이트
                    if !appState.conditionMet.contains(2) {
                        appState.conditionMet.append(2)
                    }
                })
                .buttonStyle(PlainButtonStyle())
            }
            .navigationBarBackButtonHidden(false)
            .accentColor(.black)
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
