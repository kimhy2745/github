//
//  Untitled.swift
//  Coco
//
//  Created by 김하연 on 11/20/24.
//
import SwiftUI

struct TermsOfServiceView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        NavigationView {
            VStack {
                ToplogoView()
                
                Text("서비스 이용약관")
                
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
                            서비스 이용약관

                            1. 서비스 개요
                            서비스가 제공하는 기능 및 주요 목적에 대한 설명.

                            2. 계정 생성 및 이용
                            사용자가 계정을 생성하고 관리하는 절차와 요구되는 자격.

                            3. 사용자의 의무 및 제한 사항
                            서비스 이용 중 금지된 행위(불법 콘텐츠 업로드, 시스템 해킹 시도 등) 및 사용자의 책임.

                            4. 서비스 제공자의 의무
                            보장하는 서비스 수준, 유지보수 및 개인정보 보호 관련 내용.

                            5. 개인정보 보호 및 데이터 처리
                            수집된 개인정보의 사용 목적, 제3자 제공 여부.

                            6. 지적 재산권
                            서비스 내 콘텐츠와 소프트웨어의 저작권 및 사용 권한.

                            7. 서비스 변경 및 중단
                            서비스 변경 또는 중단 시 제공자의 권리와 사용자 고지 절차.

                            8. 면책 조항
                            서비스 제공자가 특정 상황에서 발생하는 손해에 대해 책임을 지지 않는다는 내용.

                            9. 책임의 한계
                            사용자에게 발생할 수 있는 손해에 대해 제공자가 책임을 지는 범위.

                            10. 해지 및 계정 종료
                            사용자가 서비스를 종료하거나 계정 해지 조건과 절차.

                            11. 분쟁 해결 및 준거법
                            법적 분쟁 발생 시 해결 방법(중재, 소송) 및 적용 법률.

                            12. 약관의 변경
                            약관 변경 시 사용자에게 고지하는 절차.

                            13. 기타
                            특정 서비스에만 적용되는 특별 규정 및 예외사항.

                            서비스 이용약관은 사용자가 서비스를 적법하게 이용하고, 제공자는 법적 보호를 받을 수 있도록 돕는 중요한 문서입니다. 이를 통해 분쟁을 예방하고, 발생 시 해결 기준을 제공합니다.
                            """)
                                .font(.body)
                                .padding()
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 20)
                    }
                    .frame(width: 330, height: 520)
                    
                }
            }
            .padding(.bottom, 80)
            
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct TermsOfServiceView_Previews: PreviewProvider {
    static var previews: some View {
        TermsOfServiceView()
    }
}
