import SwiftUI

struct ToplogoView: View {
    var body: some View {
        ZStack {
            Color.clear // 배경 투명
            
            VStack(spacing: 12) {
                HStack {
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 50) // 로고 크기 조정
                    Spacer()
                }
                
                Divider()
                    .frame(width: 350) // 선 길이
                    .frame(height: 1)  // 선 두께
                    .background(Color.black) // 선 색상
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 20) // Toplogo 크기 제한
       // .background(Color.white) // 배경색 (필요한 경우 설정)
        .position(x: UIScreen.main.bounds.width / 2, y: 90) // 화면 맨 위로 위치
        .ignoresSafeArea() // Safe Area 무시
    }
}

struct ToplogoView_Previews: PreviewProvider {
    static var previews: some View {
        ToplogoView()
    }
}
