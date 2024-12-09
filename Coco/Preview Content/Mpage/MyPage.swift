import SwiftUI

struct MyPageView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var appState: AppState
    
    @State private var navigateToNote = false
    @State private var navigateToRank = false
    @State private var navigateToLevel = false


    var body: some View {
        ZStack {
            // 사각형 배경
            Rectangle()
                .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255).opacity(0.5))
                .frame(width: UIScreen.main.bounds.width, height: 400)
                .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight]))
                .offset(y: -270)
            
            VStack {
                ToplogoView()
                Text("마이 페이지")
                    .foregroundColor(.black)
                    .padding(.top, 30)
                    .padding(.bottom, 10)
                    .offset(y: -660)
            }
            
            // 프로필 정보 (사각형 위에 겹치게 배치)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image("ProfileImage") // 프로필 이미지
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading) {
                        Text("아이디명")
                            .font(.headline)
                            .padding(.bottom, 20)
                        Text("Lv. 15")
                            .font(.subheadline)
                    }
                    .offset(x: -55)
                    Spacer()
                }
                
                // 프로그래스 바
                ProgressView(value: 0.75, total: 1)
                    .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                    .frame(height: 10)
                    .cornerRadius(5)
                    .frame(width: 200)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10)
            .frame(width: 200)
            .padding(.top, 30)
            .offset(x: -60, y: -210)
            
            // 프로필 수정 버튼
            NavigationLink(destination: ProfileSettingsView()) {
                HStack {
                    Text("프로필 수정하기")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                }
            }
            .padding(.leading, 30)
            .padding(.vertical, 10)
            .background(Color.clear)
            .contentShape(Rectangle())
            .offset(x: 95, y: -100)
            
            // 이미지
            Image("PImage")
                .resizable()
                .scaledToFit()
                .frame(height: 90)
                .padding(.leading, -45)
                .offset(x: 150, y: -195)
               
            // 버튼들
            VStack(spacing: 20) {
                Spacer()
                
                // 오답노트
                                NavigationLink(destination: NoteView(), isActive: $navigateToNote) {
                                    EmptyView()
                                }
                Button(action: {
                    if !appState.conditionMet.contains(5) { // 중복 방지
                        appState.conditionMet.append(5) // 조건 추가
                    }
                    if !appState.hasSentNoteNotification {
                        pushNotification(
                            title: "도전과제5 :",
                            body: "오답노트로 열심히 복습해보자!",
                            seconds: 1,
                            identifier: "noteNotification"
                        )
                        appState.hasSentNoteNotification = true
                    }
                    navigateToNote = true
                                }) {
                                    VStack {
                                        Image("Note")
                                            .resizable()
                                            .frame(width: 100, height: 100)
                                            .padding(.bottom, -5)
                                            .padding(.top, 10)
                                        Text("오답노트")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                }
                                
                                // 나의 랭크
                                NavigationLink(destination: LankView(), isActive: $navigateToRank) {
                                    EmptyView()
                                }
                Button(action: {
                    if !appState.conditionMet.contains(4) { // 중복 방지
                        appState.conditionMet.append(4) // 조건 추가
                    }
                    if !appState.hasSentRankNotification {
                        pushNotification(
                            title: "도전과제4 :",
                            body: "나의 랭크를 처음으로 확인했다!",
                            seconds: 1,
                            identifier: "rankNotification"
                        )
                        appState.hasSentRankNotification = true
                    }
                    navigateToRank = true
                                }) {
                                    VStack {
                                        Image("Lank")
                                            .resizable()
                                            .frame(width: 70, height: 75)
                                        Text("나의 랭크")
                                            .font(.subheadline)
                                            .foregroundColor(.black)
                                    }
                                }
                                
                                // 난이도 변경
                NavigationLink(destination: LevelView(), isActive: $navigateToLevel) {
                    EmptyView()
                                }
                Button(action: {
                    if !appState.conditionMet.contains(3) { // 중복 방지
                        appState.conditionMet.append(3) // 조건 추가
                    }
                    if !appState.hasSentLevelNotification {
                        pushNotification(
                            title: "도전과제3 :",
                            body: "난이도를 바꾸는건 정말 멋진 일이죠!",
                            seconds: 1,
                            identifier: "levelNotification"
                        )
                        appState.hasSentLevelNotification = true
                    }
                    navigateToLevel = true})
                {
                    VStack {
                        Image("Level")
                                .resizable()
                                .frame(width: 80, height: 80)
                                Text("난이도 변경")
                                    .font(.subheadline)
                                    .foregroundColor(.black)
                                    }
                                }
                            }
                            .padding(.bottom, 10)
                        }
                        .accentColor(.black)
                    }
                }


struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
