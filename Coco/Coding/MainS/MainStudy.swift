import SwiftUI

/*
        아래 게임 버튼이랑 텍스트는 아예 지워버리고 위에 학습 언어 3개 페이지 늘려버렸어요!!일단 언어 탭뷰마다 버튼은
 따로 뒀어요!! 제걸로 파이어베이스가 연동이 안되니까 이 다음 화면에서 언어를 선택하는지 여기서 바로 하게 됐는지 몰라서
 일단 따로 뒀습니당 아래 챗봇뷰도 연결해뒀어요!!근데 아직 프로그레스 바랑 챕터를 어떻게 연결해야할지 몰라서 일다나 그냥 텍스트랑 변수로 해뒀습니당
 
  ++ 각 언어별 학습하기 버튼 누르면 도전과제 달성하게 설정해뒀어요!!
*/


struct MainStudyView: View {
    
    @EnvironmentObject var appState: AppState
   
    @State private var selectedTab = 0 // 현재 선택된 페이지
    @State private var currentChapter = "03 변수와 데이터 타입" // 현재 진행중인 챕터
    @State private var isShowingSheet = false // ChatBotView를 표시할지 여부
    
    
    let total: Double = 100  // 최대 진행도
    let value: Double = 50   // 현재 진행도

    var body: some View {
        NavigationView {
            VStack {
                ToplogoView()
                    .offset(y: -60)
                
                Text("현재 학습중인 언어")
                    .foregroundColor(.black)
                    .padding(.top, 45)
                    .padding(.bottom,20)
                
                // TabView 슬라이딩 페이지
                TabView(selection: $selectedTab) {
                    // 첫 번째 탭
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.08))
                            .frame(width: 350, height: 450)
                            .cornerRadius(30)
                        
                        
                        VStack {
                            Image("C")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .padding(.bottom, 10)
                                .padding(.top, 10)
                            Text("C언어")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                                .padding(.bottom, 50)
                            
                            
                            let exp = total - value
                            
                            
                            HStack {
                                Text("학습률")
                                    .padding(.top, 5)
                                    .padding(.trailing, 50)
                                    .font(.subheadline)
                                Text("\(Int(exp))%")
                                    .padding(.top, 5)
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                            }
                           // .padding(.bottom,0)
                            
                            ProgressView(value: value, total: total)
                                .progressViewStyle(LinearProgressViewStyle())
                                .frame(width: 280)
                                .padding(.top, 10)
                                .padding(.bottom, 50)
                            
                            Text("현재 진행중인 챕터")
                                .font(.title3)
                                .padding(.bottom, 10)
                            
                            Text(currentChapter)
                                .font(.subheadline)
                                .padding(.bottom,30)
                            
                            
                            Button(action: {
                                  if !appState.conditionMet.contains(7) { // 중복 방지
                                    appState.conditionMet.append(7) // 조건 추가
                                }
                                
                                // UserDefaults에서 알림 허용 상태 확인
                                    let isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
                                    
                                if isNotificationEnabled && !appState.hasCNotification {
                                    pushNotification(
                                        title: "도전과제7 :",
                                        body: "C언어 공부를 시작해보자!",
                                        seconds: 1,
                                        identifier: "CNotification"
                                    )
                                    appState.hasCNotification  = true
                                }

                            }) {
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                    Text("학습하기")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                                .padding()
                                .frame(width: 300, height: 40)
                                .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                                .cornerRadius(30)
                            }
                           // .padding(.top, 340)
                        }
                    }
                    .tag(0)
                    
                    // 두 번째 탭
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.08))
                            .frame(width: 350, height: 450)
                            .cornerRadius(30)
    
                        VStack {
                            Image("Python")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .padding(.bottom, 10)
                                .padding(.top, 10)
                            Text("파이썬")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.bottom,50)
                            
                            let exp = total - value
                            
                            
                            HStack {
                                Text("학습률")
                                    .padding(.top, 5)
                                    .padding(.trailing, 50)
                                    .font(.subheadline)
                                Text("\(Int(exp))%")
                                    .padding(.top, 5)
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                            }
                            
                            ProgressView(value: value, total: total)
                                .progressViewStyle(LinearProgressViewStyle())
                                .frame(width: 280)
                                .padding(.top, 10)
                                .padding(.bottom, 50)
                            
                            Text("현재 진행중인 챕터")
                                .font(.title3)
                                .padding(.bottom, 10)
                            
                            Text(currentChapter)
                                .font(.subheadline)
                                .padding(.bottom, 30)
                            
                            
                            
                            Button(action: {
                                if !appState.conditionMet.contains(8) { // 중복 방지
                                  appState.conditionMet.append(8) // 조건 추가
                              }
                              
                              // UserDefaults에서 알림 허용 상태 확인
                                  let isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
                                  
                              if isNotificationEnabled && !appState.hasPythonNotification {
                                  pushNotification(
                                      title: "도전과제8 :",
                                      body: "Python 공부를 시작해보자!",
                                      seconds: 1,
                                      identifier: "CNotification"
                                  )
                                  appState.hasPythonNotification = true
                              }
                            }) {
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                    Text("학습하기")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                                .padding()
                                .frame(width: 300, height: 40)
                                .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                                .cornerRadius(30)
                            }
                        }
                    }
                    .tag(1)
                    
                    // 세 번째 탭
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.08))
                            .frame(width: 350, height: 450)
                            .cornerRadius(30)
                  
                        VStack {
                            Image("Java")
                                .resizable()
                                .frame(width: 70, height: 70)
                                .padding(.bottom, 10)
                                .padding(.top, 10)
                            Text("자바")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.bottom, 50)
                               
                            
                            let exp = total - value
                            
                            
                            HStack {
                                Text("학습률")
                                    .padding(.top, 5)
                                    .padding(.trailing, 50)
                                    .font(.subheadline)
                                Text("\(Int(exp))%")
                                    .padding(.top, 5)
                                    .font(.subheadline)
                                    .foregroundColor(.green)
                            }
                            
                            ProgressView(value: value, total: total)
                                .progressViewStyle(LinearProgressViewStyle())
                                .frame(width: 280)
                                .padding(.top, 10)
                                .padding(.bottom, 50)
                            
                            Text("현재 진행중인 챕터")
                                .font(.title3)
                                .padding(.bottom, 10)
                            
                            Text(currentChapter)
                                .font(.subheadline)
                                .padding(.bottom, 30)
                            
                            
                            
                            Button(action: {
                                if !appState.conditionMet.contains(9) { // 중복 방지
                                  appState.conditionMet.append(9) // 조건 추가
                              }
                              
                              // UserDefaults에서 알림 허용 상태 확인
                                  let isNotificationEnabled = UserDefaults.standard.bool(forKey: "isNotificationEnabled")
                                  
                              if isNotificationEnabled && !appState.hasJavaNotification{
                                  pushNotification(
                                      title: "도전과제9 :",
                                      body: "Java 공부를 시작해보자!",
                                      seconds: 1,
                                      identifier: "CNotification"
                                  )
                                  appState.hasJavaNotification = true
                              }
                            }) {
                                HStack {
                                    Image(systemName: "play.circle.fill")
                                    Text("학습하기")
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                }
                                .padding()
                                .frame(width: 300, height: 40)
                                .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                                .cornerRadius(30)
                            }
                        }
                    }
                    .tag(2)
                    
                   
                    
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 450)
                .padding(.horizontal, 20)
                
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 100, height: 25)
                        .cornerRadius(30)
                    
                    HStack {
                        ForEach(0..<3, id: \.self) { index in
                            Circle()
                                .fill(selectedTab == index ? Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255) : Color.gray.opacity(0.7))
                                .frame(width: 10, height: 10)
                                .padding(5)
                                .onTapGesture {
                                    selectedTab = index
                                }
                        }
                    }
                }
                .padding(.bottom, 10)
     
                // AI 버튼
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
                .padding(.top, 20)
                .offset(x: 120, y: 30)

            }
            .padding(.top, 40)
            .padding(.bottom, 45)
        }
    }
}

struct MainStudyView_Previews: PreviewProvider {
    static var previews: some View {
        MainStudyView()
    }
}
