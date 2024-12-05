import SwiftUI

struct PasswordView: View {
    
    @State private var password: String = ""
    @State private var newpassword: String = ""
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        // NavigationView {
        VStack {
            
            ToplogoView()

            Text("비밀번호 변경")
                .padding(.top, 10)
                .padding(.bottom,45)

        Spacer()
            
            VStack(alignment: .leading, spacing: 15) {
                Text("기존 비밀번호")
                    .padding(.leading, 40)
                TextField("기존 비밀번호 입력", text: $password)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(width: 350)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,10)
                
                Text("새 비밀번호")
                    .padding(.leading, 40)
                SecureField("새로운 비밀번호 입력", text: $newpassword)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(width: 350)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,10)
                
                Text("새 비밀번호 재입력")
                    .padding(.leading, 40)
                SecureField("새 비밀번호 재입력", text: $newpassword)
                    .padding()
                    .overlay(
                        RoundedRectangle(cornerRadius: 17)
                            .stroke(Color.gray, lineWidth: 1)
                    )
                    .frame(width: 350)
                    .padding(.horizontal, 30.0)
                    .padding(.bottom,10)
                
                Spacer()
            }.offset(y:-10)
            
            Button(action: {
                // 뒤로 가기 동작
                presentationMode.wrappedValue.dismiss()
            }) {
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                        .frame(width: 350, height: 60)
                        .cornerRadius(30)
                    
                    Text("비밀번호 변경")
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                .padding(.bottom, 210)
            }
            
        }
 
        .accentColor(.black) // 뒤로가기 버튼 색상 변경
    }

    
}

struct PasswordView_Previews: PreviewProvider {
    static var previews: some View {
        PasswordView()
    }
}
