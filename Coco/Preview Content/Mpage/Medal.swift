import SwiftUI

struct MedalView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let totalMedals = 15  // 전체 메달 수 (15개로 변경)
    let currentMedals = 1  // 현재 획득한 메달 수
    
    var body: some View {
        NavigationView {
            VStack {
                VStack{
                    ToplogoView()
                        .offset(y: -30)
                    
                    
                    Text("나의 메달")
                        .padding(.top, 10)
                        .padding(.bottom, 20)
                    
                    ZStack{
                        
                        Rectangle()
                            .fill(Color.gray.opacity(0.1))
                            .frame(width: 350, height: 30)
                            .cornerRadius(30)
                            .offset(y:-15)
                        
                        Text("\(currentMedals) / \(totalMedals)")
                            .font(.subheadline)
                            .foregroundColor(.black)
                            .padding(.bottom, 30)
                    }
                }
                
                // 메달 그리드 (3x5 형식으로 정렬)
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(0..<totalMedals, id: \.self) { index in
                        // 빈 공간을 표시하는 텍스트
                        Text("") // 실제 메달 아이콘을 표시하지 않고 빈 공간을 두기
                            .frame(width: 90, height: 90)
                            .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255).opacity(0.5))
                            .cornerRadius(10)
                            .padding(5)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.gray, lineWidth: 1)
                            )
                    }
                }
                .padding(.horizontal, 20)
            
            }
       
            .navigationBarBackButtonHidden(false)
            .accentColor(.black)
        }
    }
}

struct MedalView_Previews: PreviewProvider {
    static var previews: some View {
        MedalView()
    }
}
