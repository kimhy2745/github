import SwiftUI

struct LankView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let total: Double = 100  // 최대 경험치
    let value: Double = 50   // 현재 경험치
   
    var body: some View {
        VStack {
            
            ToplogoView()
                .offset(y:-30)
                .padding(.bottom,70)
                
            Text("나의 랭크")
                .foregroundColor(.black)
                .padding(.top, 40)
                .padding(.bottom, 10)
            
            // 프로필 이미지
            Image("PImage") // 실제 이미지 이름으로 변경하세요
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding(.top, 10)
                .padding(.bottom, 30)
            
            // 랭크 및 경험치 정보
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Lv. 15")
                        .font(.title3)
                    //  .fontWeight(.bold)
                        .padding(.leading,60)
                    Spacer()
                    Text("골드")
                        .font(.title3)
                    //  .fontWeight(.bold)
                        .padding(.trailing,80)
                }
                
                // 경험치 진행 바
                ProgressView(value: value, total: total) // 예시로 50/100 진행
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(width: 300)
                    .padding(.top, 10)
                    .padding(.horizontal,25)
                    .padding(.bottom,40)
            }
            .padding(.horizontal, 20)
            //.padding(.bottom, 10)
            
            //Spacer() // 화면을 하단으로 밀어서 공간 확보
            
            ZStack {
                // 사각형 배경
                Rectangle()
                    .fill(Color(red: 133/255, green: 234/255, blue: 236/255).opacity(0.5))
                    .frame(width: UIScreen.main.bounds.width, height: 460)           .clipShape(RoundedCorner(radius: 40, corners: [.topLeft, .topRight]))  // 위쪽 모서리만 둥글게
                    .offset(y:10)
                ZStack{
                    Rectangle()
                        .fill(Color(.white))
                        .frame(width: 350, height: 150)
                        .cornerRadius(30)
                        .offset(y:-120)
                    
                    Text("💡 랭크를 좀 더 빠르게 올리고 싶어요!")
                        .font(.headline)
                        .offset(y:-165)
                        .padding()
                    
                    Text("✏️ 다양한 언어를 공부해봐요")
                        .font(.callout)
                        .offset(y:-120)
                        .padding()
                    
                    Text("✏️ 게임에서 난이도별 문제를 풀어봐요")
                        .font(.callout)
                        .offset(y:-80)
                        .padding()
                   
                }
                
                HStack{
                    
                    Image("Brz")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(.top, 30)
                      //  .padding(.bottom, 0)
                    
                    Spacer()
                    
                    Image("Silv")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(.top, 30)
                }.padding(.horizontal,100)
             
                HStack{
                    Text("브론즈")
                     
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 140)
                    
                    Spacer()
                    
                    Text("실버")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 140)
                        .padding(.trailing, 5)
                }.padding(.horizontal,125)
             
                HStack{
                    
                    Image("Gold")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(.top, 250)
                        .padding(.horizontal,10)
                   
                    
                    Image("Plat")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(.top, 250)
                        .padding(.horizontal,10)
                   
                    
                    Image("Dia")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                        .padding(.top, 250)
                        .padding(.horizontal,10)
                }

                HStack{
                    Text("골드")
                     
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 360)
                    
                    Spacer()
                    
                    Text("플래티넘")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 360)
                        .padding(.leading, 65)
                    
                    Spacer()
                    
                    Text("다이아")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .padding(.top, 360)
                        .padding(.leading, 50)
                        .padding(.trailing,-5)
                    
                }.padding(.horizontal,70)
                
                    
            }
            
        }
        .padding(.top, 10) // 상단 여백 추가
      
    
    }
}

struct LankView_Previews: PreviewProvider {
    static var previews: some View {
        LankView()
    }
}
