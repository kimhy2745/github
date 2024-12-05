import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Spacer()
            
            // 텍스트를 왼쪽 정렬
           
                Text("코드에 다리를 잇다.")
                .font(.system(size: 35, weight: .bold))
                    .foregroundColor(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                   // .padding(.bottom, 0.5)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
            HStack(spacing: 0) {
                Text("코")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(Color.black)
                Text("다리")
                    .font(.system(size: 50, weight: .bold)) 
                    .foregroundColor(Color.black)
                }
            .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.bottom, 20)
            
            // 로고 이미지
            Image("Logo") // 실제 로고 이미지 이름을 사용하세요.
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .padding(.bottom, 70)
            
            // 시작하기 버튼
            Button(action: {
                // 버튼 클릭 시 동작을 정의하세요
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .frame(width: 350, height: 60)
                        .cornerRadius(30)
                    
                    Text("시작하기")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            
            Spacer()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
