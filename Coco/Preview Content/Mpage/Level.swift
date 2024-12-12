import SwiftUI

struct LevelView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let total: Double = 100  // 최대 진행도
    let value: Double = 20   // 현재 진행도
    
    @State private var isBeginnerChecked = false
    @State private var isIntermediateChecked = false
    @State private var isAdvancedChecked = false
    @State private var showModal = false
    @State private var newDifficulty: String = ""
    @State private var previousDifficulty: String = "초급" // 초기값 설정
    
    var body: some View {
        VStack {
            ToplogoView()
                .offset(y:-30)
            
            Text("난이도 설정")
                .foregroundColor(.black)
                .padding(.top, 40)
                .padding(.bottom, 20)
                .offset(y:40)
            
            Text("현재 난이도")
                .font(.callout)
                .padding(.top, 20)
                .offset(y:30)
            
            Image("Lco")
                .resizable()
                .scaledToFit()
                .frame(width: 130, height: 130)
                .padding(.bottom, 20)
            
            ZStack {
                Rectangle()
                    .fill(Color(red: 133 / 255, green: 234 / 255, blue: 236 / 255).opacity(0.6))
                    .frame(width: 150, height: 30)
                    .cornerRadius(30)
                
                Text("초급")
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
            .offset(y:-45)
            .padding(.bottom,-40)
            
            VStack(alignment: .leading, spacing: 10) {
                
                let exp = total - value
                
                HStack {
                    Text("난이도 진행도")
                        .padding(.top, 5)
                        .font(.subheadline)
                        .padding(.leading,75)
                    Spacer()
                    Text("\(Int(exp))")
                        .padding(.top, 5)
                        .font(.subheadline)
                        .padding(.trailing,115)
                        .foregroundColor(.green)
                }
                
                // 경험치 진행 바
                ProgressView(value: value, total: total)
                    .progressViewStyle(LinearProgressViewStyle())
                    .frame(width: 250)
                    .padding(.top, 10)
                    .padding(.horizontal,25)
                    .padding(.leading,25)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
            
            ZStack {
                Rectangle()
                    .fill(Color.gray.opacity(0.1))
                    .frame(width: 360, height: 400)
                    .cornerRadius(30)
                    .offset(y:-15)
                
                VStack(alignment: .center, spacing: 20) {
                    Text("난이도 변경")
                        .font(.headline)
                        .padding(.top, 10)
                    
                    HStack {
                        Image("Rco")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .offset(x:-10)
                        Text("간단한 빈칸 문제와 학습으로\n기초부터 한 단계씩 시작해봐요!")
                            .padding(.trailing, 15)
                        
                        CheckBox(isChecked: $isBeginnerChecked, level: "초급", isBeginnerChecked: $isBeginnerChecked, isIntermediateChecked: $isIntermediateChecked, isAdvancedChecked: $isAdvancedChecked, showModal: $showModal, newDifficulty: $newDifficulty, previousDifficulty: $previousDifficulty)
                    }
                    .padding(.top, 20)
                    
                    Divider()
                        .frame(width: 320)
                        .frame(height: 0.6)
                        .background(Color.black)
                    
                    HStack {
                        Image("Rco")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .offset(x:-10)
                        Text("보다 심화된 문제를 통해 지금까지\n배운 내용을 복습해봐요!")
                        CheckBox(isChecked: $isIntermediateChecked, level: "중급", isBeginnerChecked: $isBeginnerChecked, isIntermediateChecked: $isIntermediateChecked, isAdvancedChecked: $isAdvancedChecked, showModal: $showModal, newDifficulty: $newDifficulty, previousDifficulty: $previousDifficulty)
                    }
                    .padding(.top, 20)
                    
                    Divider()
                        .frame(width: 320)
                        .frame(height: 0.3)
                        .background(Color.black)
                    
                    HStack {
                        Image("Rco")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .offset(x:-10)
                        Text("더 도전적인 문제에 도전하면서\n깊이 있는 이해와 응용 능력을\n키워봐요!")
                            .padding(.trailing, 20)
                        CheckBox(isChecked: $isAdvancedChecked, level: "고급", isBeginnerChecked: $isBeginnerChecked, isIntermediateChecked: $isIntermediateChecked, isAdvancedChecked: $isAdvancedChecked, showModal: $showModal, newDifficulty: $newDifficulty, previousDifficulty: $previousDifficulty)
                    }
                    .padding(.top, 10)
                    
                    Spacer()
                }
            }
            .padding(.top, 20)
        }
        .overlay(
            LogoutModalView(isShowing: $showModal, newDifficulty: $newDifficulty, previousDifficulty: $previousDifficulty)
        )
    }
}

struct CheckBox: View {
    
    @Binding var isChecked: Bool
    var level: String
    @Binding var isBeginnerChecked: Bool
    @Binding var isIntermediateChecked: Bool
    @Binding var isAdvancedChecked: Bool
    @Binding var showModal: Bool
    @Binding var newDifficulty: String
    @Binding var previousDifficulty: String
    
    var body: some View {
        Button(action: {
            // 하나의 체크박스만 선택 가능하도록 설정
            if level == "초급" {
                isChecked = true
                isIntermediateChecked = false
                isAdvancedChecked = false
                previousDifficulty = "초급" // 초급 상태로 저장
            } else if level == "중급" {
                isChecked = true
                isBeginnerChecked = false
                isAdvancedChecked = false
                previousDifficulty = "중급" // 중급 상태로 저장
            } else {
                isChecked = true
                isBeginnerChecked = false
                isIntermediateChecked = false
                previousDifficulty = "고급" // 고급 상태로 저장
            }
            newDifficulty = level
            showModal = true
        }) {
            Image(systemName: isChecked ? "checkmark.square" : "square")
                .resizable()
                .scaledToFit()
                .frame(width: 25, height: 25)
                .foregroundColor(.blue)
        }
    }
}

struct LogoutModalView: View {
    @Binding var isShowing: Bool
    @Binding var newDifficulty: String
    @Binding var previousDifficulty: String
    
    var body: some View {
        if isShowing {
            ZStack {
                Color.black.opacity(0.5) // 반투명 배경
                    .frame(width: 420, height: 1500)
                    .ignoresSafeArea()
                
                VStack {
                    Text("난이도를 변경하시겠습니까?")
                        .padding(.bottom, 10)
                    
                    Text("현재 난이도: \(newDifficulty)")
                        .font(.subheadline)
                        .foregroundColor(.green)
                        .padding(.bottom, 10)
                    
                    HStack {
                        Button(action: {
                            // 난이도 변경
                            isShowing = false
                        }) {
                            Text("예")
                                .font(.footnote)
                                .frame(width: 100, height: 40)
                                .background(Color(red: 133/255, green: 234/255, blue: 236/255))
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                        
                        Button(action: {
                            // "아니오" 버튼을 눌렀을 때 체크박스 상태를 유지하고, 이전 난이도로 되돌리기
                            newDifficulty = previousDifficulty
                            isShowing = false // 모달 닫기
                        }) {
                            Text("아니오")
                                .font(.footnote)
                                .frame(width: 100, height: 40)
                                .background(Color.gray.opacity(0.2))
                                .foregroundColor(.black)
                                .cornerRadius(30)
                        }
                        
                    }
                    .padding(.bottom,20)
                    Text("⚠️ 난이도 변경 시 진행도가 초기화됩니다.")
                        .font(.caption)
                }
                .frame(width: 280, height: 200)
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
            }
        }
    }
}

struct LevelView_Previews: PreviewProvider {
    static var previews: some View {
        LevelView()
    }
}
