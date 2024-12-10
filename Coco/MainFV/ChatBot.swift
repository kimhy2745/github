//
//  AI.swift
//  Coco
//
//  Created by 김하연 on 12/4/24.
//
/*
import SwiftUI

struct AIView: View {
    var body: some View {
        VStack {
            Text("AI 화면")
                .font(.largeTitle)
                .fontWeight(.bold)
           
        }
        .navigationBarTitle("AI 화면", displayMode: .inline)
    }
}

struct AIView_Previews: PreviewProvider{
static var previews: some View {
        AIView()
    }
}
*/
import SwiftUI

struct ChatBotView: View {
    @Binding var isPresented: Bool  // 모달 닫기 위한 상태 바인딩
    @State private var userInput: String = ""
    @State private var messages: [(String, Bool)] = [] // (메시지, 사용자 여부) 튜플 배열 추가
    @State private var errorMessage: String = "" // 에러 메시지 상태 추가
    
    var body: some View {
        VStack {
            Image("Logo")
                .resizable()
                .frame(width: 60, height: 60)
                .padding()
            
            Divider()
                .background(Color.black) // 선 색상을 검정으로 설정
                .padding(.horizontal)
            
            Spacer()
            
            ScrollView {
                ForEach(messages, id: \.0) { message, isUser in
                    HStack {
                        if isUser {
                            Spacer() // 사용자의 메시지 오른쪽 정렬
                            Text(message)
                                .font(.system(size: 14)) // 글씨 크기 조정
                                .padding()
                                .background(Color(hex: "#85EAEC")) // 사용자 메시지 배경 색상
                                .cornerRadius(10)
                                .foregroundColor(.black) // 텍스트 색상
                        } else {
                            // AI의 메시지 왼쪽 정렬
                            HStack {
                                Image("codari-logo") // AI의 응답에 로고 추가
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 5) // 로고와 텍스트 간격
                                
                                Text(message)
                                    .font(.system(size: 14)) // 글씨 크기 조정
                                    .padding()
                                    .background(Color(hex: "#F3F3F3")) // 챗봇 메시지 배경 색상
                                    .cornerRadius(10)
                                    .foregroundColor(.black) // 텍스트 색상
                            }
                        }
                    }
                    .padding(isUser ? .trailing : .leading, 0) // 사용자 메시지의 오른쪽 패딩 제거
                    .padding(.vertical, 5)
                }
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
            // HStack을 RoundedRectangle으로 감싸기
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                .background(Color.white) // 배경 색상
                .padding(4)
                .overlay(
                    HStack {
                        TextField("메시지를 입력하세요...", text: $userInput)
                            .padding(10) // TextField의 패딩 조정
                            .frame(minHeight: 40) // 최소 높이 조정
                        
                        Button(">") {
                            sendMessage()
                        }
                        .padding()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                    }
                        .padding(5) // HStack의 패딩 조정
                )
                .frame(height: 50) // 전체 HStack의 높이 조정
        }
        .padding()
        .onDisappear {
            // ChatBotView가 사라질 때, isPresented 상태를 false로 설정
            isPresented = false
        }
    }
    
    func sendMessage() {
        // 사용자의 입력 메시지 추가
        messages.append((userInput, true))
        
        // API 요청을 위한 URL과 요청 본문 생성
        guard let url = URL(string: "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-flash:generateContent?key=AIzaSyC6zZXT3iMV2smpV1hjs3PgetE9J3_voDU") else { return }
        
        let requestBody: [String: Any] = [
            "contents": [
                [
                    "parts": [
                        ["text": userInput + "3줄로 줄여서 알려줘"]
                    ]
                ]
            ]
        ]
        
        guard let jsonData = try? JSONSerialization.data(withJSONObject: requestBody) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData
        
        // API 요청 실행
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // 오류 처리
            if let error = error {
                print("Error: \(error.localizedDescription)")
                return
            }
            
            // HTTP 응답 코드 확인
            if let httpResponse = response as? HTTPURLResponse {
                print("Response code: \(httpResponse.statusCode)")
                if httpResponse.statusCode != 200 {
                    print("Error: Unexpected response code")
                    return
                }
            }
            
            // 응답 데이터 파싱
            if let data = data {
                // JSON 응답 출력
                if let jsonString = String(data: data, encoding: .utf8) {
                    print("JSON Response: \(jsonString)") // API 응답 출력
                }
                
                // JSON 응답 파싱
                if let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                   let candidates = json["candidates"] as? [[String: Any]], // 배열로 변경
                   let firstCandidate = candidates.first,
                   let content = firstCandidate["content"] as? [String: Any],
                   let parts = content["parts"] as? [[String: Any]],
                   let botMessage = parts.first?["text"] as? String {
                    DispatchQueue.main.async {
                        // 챗봇의 응답 추가
                        messages.append((botMessage, false))
                        self.userInput = "" // 입력 필드 초기화 (응답 후 처리)
                    }
                } else {
                    print("Error: Failed to parse JSON")
                }
            }
        }
        
        task.resume()
    }
}

