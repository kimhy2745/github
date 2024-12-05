import SwiftUI

struct PrivacyPolicyView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                ToplogoView()
                
                Text("개인정보처리방침")
                 
                Spacer()
                
                ZStack {
                    Rectangle()
                        .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                        .frame(width: 350, height: 550)
                        .cornerRadius(30)
                        .padding(.top, 30)
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            Text("""
                            개인정보처리방침

                            1. 개인정보 수집 항목
                            수집하는 개인정보의 구체적인 항목(이름, 이메일, 전화번호, 위치 정보, 결제 정보 등)을 명시합니다.

                            2. 개인정보 수집 및 이용 목적
                            개인정보를 수집하는 이유와 그 정보를 어떻게 사용할 것인지 설명합니다.

                            3. 개인정보 보유 및 이용 기간
                            개인정보를 얼마 동안 보관할 것인지, 그리고 그 기간이 종료되면 어떻게 파기될 것인지 설명합니다.

                            4. 개인정보 제3자 제공
                            수집한 개인정보를 제3자와 공유하는지 여부를 설명합니다.

                            5. 개인정보 처리 위탁
                            특정 업무를 외부 업체에 위탁할 경우 그 내용을 설명합니다.

                            6. 개인정보의 안전성 확보 조치
                            개인정보를 안전하게 보호하기 위한 기술적, 관리적 조치를 설명합니다.

                            7. 사용자의 권리
                            사용자가 자신의 개인정보에 대해 가질 수 있는 권리를 설명합니다.

                            8. 쿠키(Cookies) 및 유사 기술 사용
                            쿠키나 유사한 추적 기술의 사용 여부를 설명합니다.

                            9. 개인정보 보호책임자 및 연락처
                            개인정보 보호와 관련된 문제를 처리할 책임자의 연락처를 제공합니다.

                            10. 개인정보 국외 이전
                            개인정보를 해외로 이전하는 경우 그 내용을 설명합니다.

                            11. 정책 변경에 대한 고지
                            개인정보처리방침이 변경될 경우의 고지 방법을 설명합니다.

                            본 개인정보처리방침은 사용자 신뢰를 높이고 법적 요구 사항을 준수하기 위한 중요한 문서입니다.
                            """)
                                .font(.body)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading) // 텍스트를 왼쪽 정렬
                        .padding(.horizontal, 20)
                    }
                    .frame(width: 330, height: 520) // 스크롤뷰 크기 조정
                }
            }
            .padding(.bottom, 80)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PrivacyPolicyView_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyPolicyView()
    }
}

