//
//  TLangChoice.swift
//  Coco
//
//  Created by 김하연 on 12/5/24.
//

import SwiftUI

struct TLangChoiceView: View {
    
    @State private var buttonText = "이 버튼을 눌러주세요!"

    
    var body: some View {
        VStack {
            ZStack {
                // 사각형 배경
                Rectangle()
                    .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight])) // 위쪽 모서리만 둥글게
                    .offset(y:-70)
                
                VStack {
                    ToplogoView()
                    
                    Image("Lco")
                        .resizable()
                        .frame(width: 150, height: 60)
                        .padding(.bottom, 10)
                        .offset(y:-55)
                
                    // 말풍선
                    SpeechBubble(text: "코다리에서 추천드리는 레벨은\n초급입니다!\n추천받은 레벨을 참고하여 본인에게\n맞는 레벨을 골라봐요!")
                        .frame(width: 300, height: 190)
                        .padding(.bottom)
                        .offset(y:-35)
                }
            }
            
            // 아래에 위치한 HStack
            HStack {
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 5, height: 100)
                    .padding(.trailing, 10)
                
                VStack {
                    HStack{
                        Text("Level Test  :")
                            .font(.title)
                            .padding(.bottom, 10)
                            .padding(.trailing,10)
                        
                        Text("10개의 랜덤 문제 ")
                            .font(.title3)
                            .padding(.bottom, 10)
                    }
                    Text("풀이로 자신의 레벨 테스트하기")
                        .font(.title3)
                        .padding(.trailing, 60)
                }
                .padding(.trailing, 30)
            }
            //.padding(.bottom, 50)
            .offset(y: -65)
             
            HStack(spacing: 20) {
                               Button(action: {
                                   buttonText = "첫 번째 버튼이 클릭되었습니다."
                               }) {
                                   VStack{
                                       Image("Rco")  // 첫 번째 버튼 이미지
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 90, height: 90)
                                           .cornerRadius(10)
                                           .padding(.bottom,-30)
                                       Text("초급")
                                           .fontWeight(.semibold)
                                           .foregroundColor(.black)
                                   }
                               }
                               
                               Button(action: {
                                   buttonText = "두 번째 버튼이 클릭되었습니다."
                               }) {
                                   VStack{
                                       Image("Rco")  // 첫 번째 버튼 이미지
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 90, height: 90)
                                           .cornerRadius(10)
                                           .padding(.bottom,-30)
                                       Text("중급")
                                           .fontWeight(.semibold)
                                           .foregroundColor(.black)
                                   }
                               }
                               
                               Button(action: {
                                   buttonText = "세 번째 버튼이 클릭되었습니다."
                               }) {
                                   VStack{
                                       Image("Rco")  // 첫 번째 버튼 이미지
                                           .resizable()
                                           .scaledToFit()
                                           .frame(width: 90, height: 90)
                                           .cornerRadius(10)
                                           .padding(.bottom,-30)
                                       Text("고급")
                                           .fontWeight(.semibold)
                                           .foregroundColor(.black)
                                   }
                               }
                           }
                            .offset(y:-70)
                           
                           
                           
                           Rectangle()
                               .fill(Color.gray.opacity(0.2))
                               .frame(width: 350,height: 110)
                               .cornerRadius(10)
                               .overlay(
                                   Text(buttonText)  // 버튼을 클릭하면 이 텍스트가 변경됨
                                       .font(.title)
                                       .foregroundColor(.black)
                                       .multilineTextAlignment(.center)
                                       .padding()
                               )
                               .padding(.bottom,20)
                               .offset(y:-50)
                           
                           
              
                           Button(action: {
                               // Play 버튼 액션
                           }) {
                               Text("테스트 시작하기")
                                   .fontWeight(.semibold)
                                   .foregroundColor(.black)
                                   .padding()
                                   .frame(width: 350, height: 50)
                                   .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                                   .cornerRadius(30)
                           }
                           .offset(y:-55)
                       }
                   }
               }
           

struct TLangChoiceView_Previews: PreviewProvider {
    static var previews: some View {
        TLangChoiceView()
    }
}
