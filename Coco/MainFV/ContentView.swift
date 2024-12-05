import SwiftUI

struct ContentView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationStack {
            ZStack {
                // 배경 뷰
                ToplogoView()
                
                // 이미지와 선
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .padding(.top, 80)
                    .padding(.bottom, 30)
                
                Divider()
                    .frame(width: 350)
                    .frame(height: 1)
                    .background(Color.black)
                    .padding(.top, 350)
                
                Spacer()  // 내용과 직사각형 사이에 공간을 추가
            }
            
            // 버튼들을 하단으로 위치
            VStack {
                Spacer() // 버튼들을 화면 하단에 배치하기 위한 Spacer
                
                ZStack() {
                    // 첫 번째 버튼
                    NavigationLink(destination: MyPageView()) {
                        Text("마이 페이지")
                            .font(.title3)
                            .padding(.bottom, 250)
                            .frame(height: 330)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.3))
                            .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                            .frame(width: UIScreen.main.bounds.width)
                            .foregroundColor(.black)
                            .padding(.top, 20)
                            
                    }.offset(y:-70)
                    
                    // 두 번째 버튼
                    NavigationLink(destination: MedalView()) {
                        Text("나의 메달")
                            .font(.title3)
                            .padding(.bottom, 250)
                            .frame(height: 330)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.6))
                            .foregroundColor(.black)
                            .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                            .frame(width: UIScreen.main.bounds.width)
                           
                    }.offset(y:30)
                    
                    // 세 번째 버튼
                    NavigationLink(destination: StudyView()) {
                        Text("공부하러 가기")
                            .font(.title3)
                            .padding(.bottom, 150)
                            .frame(height: 220)
                            .frame(maxWidth: .infinity)
                            .background(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.9))
                            .foregroundColor(.black)
                            .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))
                            .frame(width: UIScreen.main.bounds.width)
                            
                    }.offset(y:70)
                }
                .padding(.horizontal, 20)
                .padding(.top, 30)
                .padding(.bottom, -35)  // 하단 여백을 추가하여 직사각형을 내림
            }
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

// RoundedCorner shape (사용자 정의 모서리 모양)
struct RoundedCorner: Shape {
    var radius: CGFloat = 10
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


