import SwiftUI

struct MyPageView: View {
    
   @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
  
    var body: some View {
       
            ZStack {
                // 사각형 배경
                Rectangle()
                    .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                    .frame(width: UIScreen.main.bounds.width, height: 400)           .clipShape(RoundedCorner(radius: 40, corners: [.bottomLeft, .bottomRight]))  // 위쪽 모서리만 둥글게
                    .offset(y:-270)
                
                
                VStack {
                    
                    ToplogoView()
                    
                    
                    Text("마이 페이지")
                        .foregroundColor(.black)
                        .padding(.top, 30)
                        .padding(.bottom,10)
                        .offset(y:-660)
                }
                
                // 프로필 정보 (사각형 위에 겹치게 배치)
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        Image("ProfileImage") // 프로필 이미지
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        
                        VStack(alignment: .leading) {
                            Text("아이디명")
                                .font(.headline)
                                .padding(.bottom, 20)
                            Text("Lv. 15")
                                .font(.subheadline)
                        }
                        .offset(x: -55)
                        Spacer()
                    }
                    
                    // 프로그래스 바
                    ProgressView(value: 0.75, total: 1)
                        .progressViewStyle(LinearProgressViewStyle(tint: Color.blue))
                        .frame(height: 10)
                        .cornerRadius(5)
                        .frame(width: 200)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .frame(width: 200)
                .padding(.top, 30)
                .offset(x: -60, y: -210)
                
                // 프로필 수정 버튼
                NavigationLink(destination: ProfileSettingsView()) {
                    Text("프로필 수정하기")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
                    
                }
                .padding(.leading, 30)
                .padding(.vertical, 10)
                .background(Color.clear)
                .contentShape(Rectangle())
                .offset(x:95,y:-100)
                
                // 이미지
                Image("PImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 90)
                    .padding(.leading, -45)
                    .offset(x: 150, y: -195)
                
                Spacer() // 버튼들 위치 조정
                
                // 네비게이션 링크를 사용한 버튼들
                VStack(spacing: 40) {
                    Spacer()
                    NavigationLink(destination: NoteView()) {
                        VStack {
                            Image("Note")
                                .resizable()
                                .frame(width: 100, height: 100)
                                .padding(.bottom, -5)
                                .padding(.top, 10)
                            Text("오답노트")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    
                    NavigationLink(destination: LankView()) {
                        VStack {
                            Image("Lank")
                                .resizable()
                                .frame(width: 70, height: 75)
                            Text("나의 랭크")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                    
                    NavigationLink(destination: LevelView()) {
                        VStack {
                            Image("Level")
                                .resizable()
                                .frame(width: 80, height: 80)
                            Text("난이도 변경")
                                .font(.subheadline)
                                .foregroundColor(.black)
                        }
                    }
                }
                
                .padding(.bottom, 10) // 버튼들 하단 여백 추가
            }
            .accentColor(.black)
        }
    }




struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
