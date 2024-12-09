import SwiftUI

struct TLevelChoiceView: View {
    
    @State private var buttonText = "코다리를 누르면 설명을 볼 수 있어요!"
    @State private var fontSize: CGFloat = 20  // 텍스트 크기 상태 변수
    
    // 버튼 클릭 상태 관리
    @State private var isBeginnerSelected = false
    @State private var isIntermediateSelected = false
    @State private var isAdvancedSelected = false
    
    var body: some View {
        NavigationView{
            VStack {
                ZStack {
                    // 사각형 배경
                    Rectangle()
                        .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                        .frame(width: UIScreen.main.bounds.width, height: 500)
                        .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight])) // 위쪽 모서리만 둥글게
                        .offset(y:-70)
                    
                    VStack {
                        ToplogoView()
                        
                        Image("Lco")
                            .resizable()
                            .frame(width: 150, height: 60)
                            .padding(.bottom, 10)
                            .offset(y:-55)
                        
                        // 말풍선
                        SpeechBubble(text: "코다리에서 추천드리는 레벨은\n초급입니다!\n추천받은 레벨을 참고하여 본인에게\n맞는 레벨을 골라봐요!")
                            .frame(width: 300, height: 190)
                            .padding(.bottom)
                            .offset(y:-35)
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
                .offset(y: -65)
                
                HStack(spacing: 20) {
                    Button(action: {
                        buttonText = "간단한 빈칸 문제와 학습으로\n기초부터 한 단계씩 시작해봐요!"
                        fontSize = 20  // 글자 크기 변경
                        isBeginnerSelected = true
                        isIntermediateSelected = false
                        isAdvancedSelected = false
                    }) {
                        VStack{
                            Image("Rco")  // 첫 번째 버튼 이미지
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .cornerRadius(10)
                                .padding(.bottom,-30)
                            Text("초급")
                                .fontWeight(.semibold)
                                .foregroundColor(isBeginnerSelected ? .green : .black)  // 선택된 버튼은 초록색, 아니면 검은색
                                .font(.system(size: fontSize))  // 동적으로 텍스트 크기 조정
                        }
                    }
                    
                    Button(action: {
                        buttonText = "보다 심화된 문제를 통해 지금까지\n배운 내용을 복습해봐요!"
                        fontSize = 20  // 글자 크기 변경
                        isBeginnerSelected = false
                        isIntermediateSelected = true
                        isAdvancedSelected = false
                    }) {
                        VStack{
                            Image("Rco")  // 첫 번째 버튼 이미지
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .cornerRadius(10)
                                .padding(.bottom,-30)
                            Text("중급")
                                .fontWeight(.semibold)
                                .foregroundColor(isIntermediateSelected ? .green : .black)  // 선택된 버튼은 초록색, 아니면 검은색
                                .font(.system(size: fontSize))  // 동적으로 텍스트 크기 조정
                        }
                    }
                    
                    Button(action: {
                        buttonText = "더 도전적인 문제에 도전하면서 깊이 있는 이해와 응용 능력을\n키워봐요!"
                        fontSize = 20  // 글자 크기 변경
                        isBeginnerSelected = false
                        isIntermediateSelected = false
                        isAdvancedSelected = true
                    }) {
                        VStack{
                            Image("Rco")  // 첫 번째 버튼 이미지
                                .resizable()
                                .scaledToFit()
                                .frame(width: 90, height: 90)
                                .cornerRadius(10)
                                .padding(.bottom,-30)
                            Text("고급")
                                .fontWeight(.semibold)
                                .foregroundColor(isAdvancedSelected ? .green : .black)  // 선택된 버튼은 초록색, 아니면 검은색
                                .font(.system(size: fontSize))  // 동적으로 텍스트 크기 조정
                        }
                    }
                }
                .offset(y:-70)
                
                // 텍스트 박스
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width: 350, height: 110)
                    .cornerRadius(10)
                    .overlay(
                        Text(buttonText)  // 버튼을 클릭하면 이 텍스트가 변경됨
                            .font(.system(size: fontSize))  // 텍스트 크기 조정
                            .foregroundColor(.black)
                            .multilineTextAlignment(.center)
                            .padding()
                    )
                    .padding(.bottom, 20)
                    .offset(y: -50)
                
                NavigationLink(destination: ExplanaitonView()) {
                    Text("언어 선택하기")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 350, height: 40)  // 사이즈 그대로 유지
                        .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .cornerRadius(30)
                }
                
                .offset(y: -55)
            }
        }
    }
}

struct TLevelChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        TLevelChoiceView()
    }
}
