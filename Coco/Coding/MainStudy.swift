//
//  Untitled.swift
//  Coco
//
//  Created by 김하연 on 11/20/24.
//

import SwiftUI

struct StudyView: View {
    
    @State private var selectedTab = 0 // 현재 선택된 페이지
    @State private var currentLanguage = "C 언어" // 현재 학습 중인 언어
    @State private var currentChapter = "03 변수와 데이터 타입" // 현재 진행중인 챕터
    
    let total: Double = 100  // 최대 진행도
    let value: Double = 50   // 현재 진행도
    
    var body: some View {
        NavigationView {
            VStack {
                ToplogoView()
                    .offset(y:-60)
                
                Text("현재 학습중인 언어")
                    .foregroundColor(.black)
                    .padding(.top, 40)
                
                // TabView를 사용하여 슬라이딩 페이지 구현
                TabView(selection: $selectedTab) {
                    // 첫 번째 탭
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: 350, height: 150)
                            .cornerRadius(30)
                        HStack {
                            VStack {
                                Image("C")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                Text("C언어")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            .padding(.leading,10)
                            .padding(.trailing,50)
                            
                            let exp = total - value
                            
                            VStack {
                                HStack {
                                    Text("학습률")
                                        .padding(.top, 5)
                                        .padding(.trailing,50)
                                        .font(.subheadline)
                                    Text("\(Int(exp))%")
                                        .padding(.top, 5)
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                }
                                
                                // 경험치 진행 바
                                ProgressView(value: value, total: total)
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .frame(width: 150)
                                    .padding(.top, 10)
                                    .padding(.bottom,10)
                                
                                Text("현재 진행중인 챕터")
                                    .font(.subheadline)
                                    .padding(.bottom,10)
                                
                                Text("03 변수와 데이터 타입")
                                    .font(.caption)
                            }
                        }
                    }
                    .tag(0)
                    
                    // 두 번째 탭
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: 350, height: 150)
                            .cornerRadius(30)
                        HStack {
                            VStack {
                                Image("Python")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                Text("파이썬")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            .padding(.leading,10)
                            .padding(.trailing,50)
                            
                            let exp = total - value
                            
                            VStack {
                                HStack {
                                    Text("학습률")
                                        .padding(.top, 5)
                                        .padding(.trailing,50)
                                        .font(.subheadline)
                                    Text("\(Int(exp))%")
                                        .padding(.top, 5)
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                }
                                
                                // 경험치 진행 바
                                ProgressView(value: value, total: total)
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .frame(width: 150)
                                    .padding(.top, 10)
                                    .padding(.bottom,10)
                                
                                Text("현재 진행중인 챕터")
                                    .font(.subheadline)
                                    .padding(.bottom,10)
                                
                                Text("03 변수와 데이터 타입")
                                    .font(.caption)
                            }
                        }
                    }
                    .tag(1)
                    
                    // 세 번째 탭
                    ZStack {
                        Rectangle()
                            .fill(Color.gray.opacity(0.15))
                            .frame(width: 350, height: 150)
                            .cornerRadius(30)
                        HStack {
                            VStack {
                                Image("Java")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                    .padding(.bottom, 10)
                                    .padding(.top, 10)
                                Text("자바")
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                            }
                            .padding(.leading,10)
                            .padding(.trailing,50)
                            
                            let exp = total - value
                            
                            VStack {
                                HStack {
                                    Text("학습률")
                                        .padding(.top, 5)
                                        .padding(.trailing,50)
                                        .font(.subheadline)
                                    Text("\(Int(exp))%")
                                        .padding(.top, 5)
                                        .font(.subheadline)
                                        .foregroundColor(.green)
                                }
                                
                                // 경험치 진행 바
                                ProgressView(value: value, total: total)
                                    .progressViewStyle(LinearProgressViewStyle())
                                    .frame(width: 150)
                                    .padding(.top, 10)
                                    .padding(.bottom,10)
                                
                                Text("현재 진행중인 챕터")
                                    .font(.subheadline)
                                    .padding(.bottom,10)
                                
                                Text("03 변수와 데이터 타입")
                                    .font(.caption)
                            }
                        }
                    }
                    .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .frame(height: 200)
                .padding(.horizontal, 20)
                
                // 페이지 인디케이터
                HStack {
                    ForEach(0..<3, id: \.self) { index in
                        Circle()
                            .fill(selectedTab == index ? Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255) : Color.gray.opacity(0.5)) // 선택된 페이지 색상
                            .frame(width: 10, height: 10)
                            .padding(5)
                            .onTapGesture {
                                selectedTab = index // 해당 페이지로 이동
                            }
                    }
                }
                .padding(.bottom,10)
                
                HStack {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 5, height: 130)
                        .padding(.trailing,10)
                    
                    VStack {
                        Text("Let’s play a game! :")
                            .font(.title)
                            .padding(.bottom,10)
                            .padding(.trailing,40)
                        Text("총 세 단계로 이루어진 게임을 하나씩 ")
                            .font(.title3)
                            .padding(.bottom, 10)
                        Text("클리어 해봐요! ")
                            .font(.title3)
                            .padding(.trailing,170)
                    }
                    .padding(.trailing,30)
                }
                .padding(.bottom,50)
                .offset(y:15)
                
                Button(action: {
                    // Play 버튼 액션
                }) {
                    HStack {
                        Image(systemName: "gamecontroller.fill")
                        Text("Play")
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                    }
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255))
                    .cornerRadius(30)
                }
                .padding(.top, 20)
                
                NavigationLink(destination: AIView()) {
                                    VStack {
                                        Image("Logo") // "Logo"라는 이름의 이미지를 사용
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 60, height: 60)
                                       
                                    }
                                    .frame(width: 80, height: 80)  // 버튼의 크기 설정
                                    .background(Color.white)  // 배경색 (버튼 안의 색)
                                    .clipShape(Circle())  // 버튼을 원 형태로 만들기
                                    .overlay(  // 테두리 추가
                                        Circle()
                                            .stroke(Color.black, lineWidth: 1)  // 검은색 테두리
                                    )
                                }
                                .buttonStyle(PlainButtonStyle())  // 기본 버튼 스타일을 사용하지 않음
                                .padding(.top, 20)
                                .offset(x:120,y:30) // 위치 설정
                            }
                            .padding(.top, 40)
                            .padding(.bottom,45)
                        }
                    }
                }

          struct StudyView_Previews: PreviewProvider {
              static var previews: some View {
                  StudyView()
              }
          }
