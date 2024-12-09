import SwiftUI

struct ExplanaitonView: View {
    
    @State private var selectedTab = 0 // 현재 선택된 페이지
    
    var body: some View {
        NavigationView{
            VStack {
                
                ToplogoView()
                
                TabView(selection: $selectedTab) {
                    GeometryReader { geometry in
                        Image("E1") // 이미지 이름을 사용
                            .resizable()
                            .scaledToFit() // 비율을 유지하며 크기 조정
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                    .tag(0)
                    
                    GeometryReader { geometry in
                        Image("E2") // 이미지 이름을 사용
                            .resizable()
                            .scaledToFit() // 비율을 유지하며 크기 조정
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                    .tag(1)
                    
                    GeometryReader { geometry in
                        Image("E3") // 이미지 이름을 사용
                            .resizable()
                            .scaledToFit() // 비율을 유지하며 크기 조정
                            .frame(width: geometry.size.width, height: geometry.size.height)
                    }
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 600) // 탭 뷰 높이 설정
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
                
                ZStack {
                    Rectangle()
                        .fill(Color.gray.opacity(0.15))
                        .frame(width: 100, height: 25)
                        .cornerRadius(30)
                    
                    // 페이지 인디케이터
                    HStack {
                        ForEach(0..<3, id: \.self) { index in
                            Circle()
                                .fill(selectedTab == index ? Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255) : Color.gray.opacity(0.7)) // 선택된 페이지 색상
                                .frame(width: 10, height: 10)
                                .padding(5)
                                .onTapGesture {
                                    selectedTab = index // 해당 페이지로 이동
                                }
                        }
                    }
                }
                
                // TLangChoiceView로 이동하는 버튼
                NavigationLink(destination: TLangChoiceView()) {
                    Text("이해했어요!")
                        .font(.subheadline)
                        .foregroundColor(.black)
                        .padding()
                        .frame(width: 300, height: 40)
                        .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .cornerRadius(30)
                }
                .padding(.top, 10)
            }
           
        } .navigationBarBackButtonHidden(true)
    }
}
struct Explanaiton_Previews: PreviewProvider {
    static var previews: some View {
        ExplanaitonView()
    }
}
