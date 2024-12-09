import SwiftUI

class AppState: ObservableObject {
    @Published var conditionMet: [Int] = [] // 충족된 조건을 배열로 저장
    @Published var completedChallenges: [Bool] = Array(repeating: false, count: 10)
   
    @Published var hasSentNoteNotification = false // 오답노트 알림 상태변수
    @Published var hasSentRankNotification = false // 랭크 알림 상태변수
    @Published var hasSentLevelNotification = false // 난이도 알림 상태변수
    @Published var hasSentAINotification = false // AI 알림 상태변수
    @Published var hasSentLogoutNotification = false // 로그아웃 알림 상태변수
    @Published var hasStartNotification = false // 메달 알림 상태변수
    
    @Published var currentMedals: Int = 0 // 현재 메달 수 상태변수
}


//남은 도전과제 => 7~9 총 3개!! 각자 공부 화면에서 처음 언어 선택했을 때 알람이 뜨고 도전과제 출력되게 하면 됩니당!
// 1. 위에  AppState에 상태변수 추가하기(3개 다)
//
// @Published var hasCNotification = false // c언어 알림 상태변수
// @Published var hasJavaNotification = false // 자바 알림 상태변수
// @Published var hasPythonNotification = false // 파이썬 알림 상태변수
//
//2. 버튼을 눌렀을 때 알람이 뜰 화면(아마도 MainStudyView인데 그냥 공부 전에 언어 선택하는 뷰에 하시면 됩니당)에
// @EnvironmentObject var appState: AppState 선언해주기! 상태변수값이 바뀌어야 함

// 아마 제 폴더중에 Funtion 폴더에 알림 기능 함수 있어서 그냥 되긴 할거에요
// 버튼 액션에  if !appState.conditionMet.contains(3) { // 중복 방지
//                  appState.conditionMet.append(3) // 조건 추가 ==> 넣어주기! (3) 자리에는 그 버튼 도전과제에 맞는 숫자 넣으면 됩니당
// C = 7 / java = 8  / python = 9 넣으면 끗
//
// if !appState.hasSentLevelNotification {            ===> 얘는 위에 if문이랑 같이 버튼 액션에 넣어주세요
//      pushNotification(                                   얘는 알람 띄워주고 내용 설정하는 부분입니당
//          title: "도전과제3 :",                                       (아래 있음!!)
//          body: "난이도를 바꾸는건 정말 멋진 일이죠!",               각자 타이틀은 "도전과제번호 :" , 바디는 "도전과제내용"
/*          seconds: 1,                                               identifier는 알람 식별자라 "CNotification"이런식으로
                                                                                        하면 구분됩니당
            identifier: "levelNotification"                 그 다음은   appState.hasSentLevelNotification = true인데
                )                                           이것도 appState.(버튼에 맞는 언어 알림 상태변수) = true로 해주시믄 돼용
            appState.hasSentLevelNotification = true
        }
        navigateToLevel = true}

*/

// Testst View에서 "테스트 시작하기" 버튼 누르면 도전과제1 달성하게 해두긴 했는데 이것도 혹시 되나 한번만 봐주세요!
// 혹시 안되면 지금 이 뷰랑 MainStudyView , MyPageView, ProfileSettingView에 도전과제 달성 버튼들 있으니까 참고하시면 될 것 같아요!



struct MedalView: View {
    
    @EnvironmentObject var appState: AppState // 전역 상태 가져오기
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var currentMedals = 0 // 현재 획득한 메달 수
    
    private let challengeTexts = [
        "도전과제1 - 과연 어떤 레벨을 받을까요?",
        "도전과제2 - 코다리에게 처음으로 질문했다!",
        "도전과제3 - 난이도를 바꾸는건 정말 멋진 일이죠!",
        "도전과제4 - 나의 랭크를 처음으로 확인했다!",
        "도전과제5 - 오답노트로 열심히 복습해보자!",
        "도전과제6 - 코다리와 계속 있어주다니, 감동이에요!",
        "도전과제7 - C언어 공부를 시작해보자!",
        "도전과제8 - Java 공부를 시작해보자!",
        "도전과제9 - Python 공부를 시작해보자!",
        "도전과제10 - 코다리에 오신걸 환영해요!"
    ]
    
    let totalMedals = 10 // 전체 메달 수
    let medalImages = [
        "메달0", "메달1", "메달2", "메달6", "메달9",
        "메달12", "메달3", "메달4", "메달5", "메달14"
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    ToplogoView()
                        .offset(y: -30)
                    
                    Text("도전과제")
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                        .offset(y: -35)
                    
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 350, height: 30)
                            .cornerRadius(30)
                            .offset(y: -15)
                        
                        Text("\(appState.completedChallenges.filter { $0 }.count) / \(totalMedals)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.bottom, 30)
                    }
                    .offset(y: -20)
                }
                
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<totalMedals, id: \.self) { index in
                            ZStack {
                                Rectangle()
                                    .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255).opacity(0.5))
                                    .frame(width: 350, height: 70)
                                    .cornerRadius(10)
                                    .padding(5)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 10)
                                            .stroke(Color.gray, lineWidth: 1)
                                    )

                                HStack {
                                    Image(medalImages[index])
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .padding(.trailing, 5)
                                        .padding(.leading, 10)

                                    if appState.completedChallenges[index] {
                                        Text(challengeTexts[index])
                                            .padding()
                                            .foregroundColor(.black)
                                            .font(.caption)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    } else {
                                        Text("조건을 달성해 도전과제를 해금하세요!")
                                            .padding()
                                            .foregroundColor(.gray)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                }
                            }
                        }
                        .onAppear {
                            // 모든 충족된 조건을 처리
                            for condition in appState.conditionMet {
                                let index = condition - 1
                                if index >= 0 && index < totalMedals && !appState.completedChallenges[index] {
                                    appState.completedChallenges[index] = true
                                }
                            }

                            // 메달 수 동기화
                            currentMedals = appState.completedChallenges.filter { $0 }.count
                        }

                    }
                    .padding(.top, 10)
                    .padding(.horizontal, 20)
                }
                .frame(height: 550)
            }
            .navigationBarBackButtonHidden(false)
            .accentColor(.black)
 
                    }
                }
            }
    

struct MedalView_Previews: PreviewProvider {
    static var previews: some View {
        MedalView()
            .environmentObject(AppState()) // 환경 객체 추가
    }
}
