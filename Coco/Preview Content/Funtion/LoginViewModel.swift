//
//  LoginViewModel.swift
//  Coco
//
//  Created by 김하연 on 12/9/24.
//

//
//  LoginViewModel.swift
//  CODARI
//
//  Created by 김준서 on 2024/12/09.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    
    // FaceIDService 접근 레벨을 internal로 변경
    var faceIDService = FaceIDService()  // private -> internal로 변경
    
    @Published var authenticationStatus: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var isFaceIDEnabled: Bool = false  // Face ID 토글 상태
    
    init() {
        // 앱 실행 시 Face ID 토글 상태 로드
        self.isFaceIDEnabled = faceIDService.getFaceIDState()
        
        if isFaceIDEnabled {
            authenticateWithFaceID()  // Face ID가 활성화된 상태에서 인증 시도
        }
    }
    
    // Face ID 인증 시도
    func authenticateWithFaceID() {
        faceIDService.authenticateWithFaceID { [weak self] message in
            if message == "Face ID 인증 성공" {
                self?.isLoggedIn = true
                self?.authenticationStatus = "로그인 성공"
            } else {
                self?.authenticationStatus = message
            }
        }
    }
    
    // Face ID 활성화 또는 비활성화
    func toggleFaceID() {
        isFaceIDEnabled.toggle()
        faceIDService.saveFaceIDState(isEnabled: isFaceIDEnabled)
    }
}
