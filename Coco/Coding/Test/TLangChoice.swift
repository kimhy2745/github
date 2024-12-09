import SwiftUI

struct TLangChoiceView: View {
    
    @State private var buttonText = "언어를 누르면 설명을 볼 수 있어요!"
    @State private var fontSize: CGFloat = 18  // 텍스트 크기 상태 변수
    
    @State private var languagechoiceModal = false // 언어선택 모달 표시 상태
    
    // 버튼 클릭 상태 관리
    @State private var isBeginnerSelected = false
    @State private var isIntermediateSelected = false
    @State private var isAdvancedSelected = false
    
    @State private var navigateToContentView = false // ContentView로 이동할 상태
    
    var body: some View {
        VStack {
            ZStack {
                // 사각형 배경
                Rectangle()
                    .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight])) // 위쪽 모서리만 둥글게
                    .offset(y:-60)
                
                VStack {
                    ToplogoView()
                        .offset(y:10)
                    Image("Lco")
                        .resizable()
                        .frame(width: 150, height: 60)
                        .padding(.bottom, 10)
                        .offset(y:-50)
                
                    // 말풍선
                    SpeechBubble(text: "코다리에는 C언어 / Python / Java\n총 세 가지 언어를 학습할 수 있어요!\n각 언어의 특징을 살펴보고 자신에게 맞는 언어를 선택해봐요! ")
                        .frame(width: 300, height: 190)
                        .padding(.bottom)
                        .offset(y:-30)
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
                        Text("Language Choice    : ")
                            .font(.title)
                            .padding(.bottom, 10)
                            .padding(.trailing,60)
                    }
                    Text("어떤 언어를 먼저 공부해 볼까요?")
                        .font(.title3)
                        .padding(.trailing, 60)
                }
                .padding(.trailing, 10)
            }
            .offset(y: -60)
             
            HStack(spacing: 50) {
                Button(action: {
                    buttonText = "기초부터 고급까지 폭넓게 활용되는 언어로, 시스템 프로그래밍과 임베디드 시스템에 적합해요. 효율적이고 빠른 실행 속도가 특징이에요!"
                    fontSize = 18  // 글자 크기 변경
                    isBeginnerSelected = true
                    isIntermediateSelected = false
                    isAdvancedSelected = false
                }) {
                    VStack{
                        Image("C")  // 첫 번째 버튼 이미지
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height:60)
                            .cornerRadius(10)
                            
                        Text("C언어")
                            .foregroundColor(isBeginnerSelected ? .green : .black)  // 선택된 버튼은 초록색, 아니면 검은색
                            .font(.system(size: fontSize))  // 동적으로 텍스트 크기 조정
                    }
                }
                
                Button(action: {
                    buttonText = "초보자에게 친숙하고, 웹 개발, 데이터 분석, AI 등 다양한 분야에서 활용되는 인기 있는 언어에요! 간결한 문법과 강력한 라이브러리가 장점입니다!"
                    fontSize = 18 // 글자 크기 변경
                    isBeginnerSelected = false
                    isIntermediateSelected = true
                    isAdvancedSelected = false
                }) {
                    VStack{
                        Image("Python")  // 첫 번째 버튼 이미지
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                            
                        Text("파이썬")
                            .foregroundColor(isIntermediateSelected ? .green : .black)  // 선택된 버튼은 초록색, 아니면 검은색
                            .font(.system(size: fontSize))  // 동적으로 텍스트 크기 조정
                    }
                }
                
                Button(action: {
                    buttonText = "어떤 플랫폼에서도 실행 가능한 언어로, 대형 시스템 개발과 모바일 앱 개발에 주로 사용돼요. 안정성과 확장성이 뛰어나다는 특징이 있어요!"
                    fontSize = 18  // 글자 크기 변경
                    isBeginnerSelected = false
                    isIntermediateSelected = false
                    isAdvancedSelected = true
                }) {
                    VStack{
                        Image("Java")  // 첫 번째 버튼 이미지
                            .resizable()
                            .scaledToFit()
                            .frame(width: 60, height: 60)
                            .cornerRadius(10)
                          
                        Text("자바")
                            .foregroundColor(isAdvancedSelected ? .green : .black)  // 선택된 버튼은 초록색, 아니면 검은색
                            .font(.system(size: fontSize))  // 동적으로 텍스트 크기 조정
                    }
                }
            }
            .offset(y:-60)
            
            // 텍스트 박스
            Rectangle()
                .fill(Color.gray.opacity(0.2))
                .frame(width: 350, height: 130)
                .cornerRadius(10)
                .overlay(
                    Text(buttonText)  // 버튼을 클릭하면 이 텍스트가 변경됨
                        .font(.system(size: fontSize))  // 텍스트 크기 조정
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                        .padding()
                )
                .padding(.bottom, 20)
                .offset(y: -55)
            
            // 언어 선택하기 버튼
            Button(action: {
                languagechoiceModal = true // 버튼 클릭 시 모달을 띄움
            }) {
                Text("언어 선택하기")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .padding()
                    .frame(width: 350, height: 40)
                    .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                    .cornerRadius(30)
            }
            .offset(y: -65)
        }
        .overlay(
            LanguagechoiceModalView(isShowing: $languagechoiceModal) // 모달을 띄우기 위한 overlay 추가
        )
        .navigationBarBackButtonHidden(true)
    }
}

struct LanguagechoiceModalView: View {
    @Binding var isShowing: Bool
    @State private var navigateToContentView = false // ContentView로 이동할 상태
    
    var body: some View {
        if isShowing {
            ZStack {
                Color.black.opacity(0.5) // 반투명 배경
                    .frame(width: 420,height: 1500)
                    .ignoresSafeArea()
                
                VStack(alignment: .center) {
                    Text("이대로 코딩 공부를 시작해도 될까요?\n##언어는 [메인]->[마이페이지]->[언어]에서 변경할 수 있어요!##")
                        .padding(.bottom, 20)
                        .multilineTextAlignment(.center)
                    
                    HStack {
                        Button(action: {
                            // 언어 선택 후 ContentView로 이동
                            navigateToContentView = true
                        }) {
                            Text("시작하기")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .frame(width: 100, height: 40)
                                .background(Color(red: 133/255, green: 234/255, blue: 236/255))
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                        .background(
                            NavigationLink(destination: ContentView(), isActive: $navigateToContentView) {
                                EmptyView() // 숨겨진 NavigationLink
                            }
                        )
                        
                        Button(action: {
                            isShowing = false // 모달 닫기
                        }) {
                            Text("아니오")
                                .font(.footnote)
                                .fontWeight(.semibold)
                                .frame(width: 100, height: 40)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                    }
                }
                .frame(width: 320, height: 180)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                // .offset(y:-350)
            }
        }
    }
}

struct TLangChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        TLangChoiceView()
    }
}
