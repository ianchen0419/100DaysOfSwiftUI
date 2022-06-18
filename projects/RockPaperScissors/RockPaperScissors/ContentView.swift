//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Yi An Chen on 2022/2/1.
//

import SwiftUI

struct BlueTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body.bold())
            .foregroundStyle(AppColor.grandGradient)
            .padding(.vertical)
    }
}

struct LeftText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct RightText: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
}

struct HandView<T: ShapeStyle>: View {
    var name: String
//    var color: Color?
    var color: T
    
    var body: some View {
        
        Image(name)
            .resizable()
            .frame(width: 60, height: 60)
            .padding()
            .background(color)
            .clipShape(Circle())
    }
}

extension View {
    func blueTitleStyle() -> some View {
        modifier(BlueTitle())
    }
    
    func leftTextStyle() -> some View {
        modifier(LeftText())
    }
    
    func rightTextStyle() -> some View {
        modifier(RightText())
    }
}

struct AppColor {
    static let lightPink = Color(red: 0.98, green: 0.94, blue: 0.99)
    static let lightBlue = Color(red: 0.93, green: 0.96, blue: 0.99)
    static let lightOrange = Color(red: 0.99, green: 0.95, blue: 0.93)
    
    static let ocean = Color(red: 0.41, green: 0.67, blue: 0.89)
    static let teal = Color(red: 0.36, green: 0.52, blue: 1)
    static let grandGradient = LinearGradient(gradient: Gradient(colors: [ocean, teal]), startPoint: .topLeading, endPoint: .bottom)
    
//    static let lightYellow = Color(red: 0.98, green: 0.91, blue: 0.8)
}

struct ContentView: View {
    
    let options: [(name: String, color: Color)] = [
        ("rock", AppColor.lightBlue),
        ("paper", AppColor.lightPink),
        ("scissors", AppColor.lightOrange),
    ]
    
    @State private var appChoice = Int.random(in: 0...2)
    @State private var answerChoice = Int.random(in: 0...2)
    
    var result: String {
        var resultString: String
        
        if appChoice > answerChoice {
            if (appChoice - answerChoice == 2) {
                resultString = "You win"
            } else {
                resultString = "You lose"
            }
            
        } else if answerChoice > appChoice {
            if (answerChoice - appChoice == 2) {
                resultString = "You lose"
            } else {
                resultString = "You win"
            }
        } else {
            resultString = "Tie"
        }
        
        return resultString
    }
    
    
    @State private var score = 0.0
    @State private var showResultAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var showFinalAlert = false
    @State private var gameCount = 1
    
    var body: some View {
        VStack {
            
            Group {
                Spacer()
                
                Text("Rock, Paper and Scissors")
                    .leftTextStyle()
                    .font(.largeTitle.weight(.medium))
                
                Spacer()
            }
            
            
            Group {
                HStack(alignment: .top) {
                    VStack {
                        Text("App's choice is")
                            .font(.body.bold())
                            .foregroundColor(.secondary)
                        
                        HandView(name: options[appChoice].name, color: .ultraThinMaterial)
                    }
                    .frame(maxWidth: .infinity)
                    
                    Spacer()
                    
                    VStack {
                        Text("Result is")
                            .font(.body.bold())
                            .foregroundColor(.secondary)
                        Text(result)
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                            .padding(.vertical)
                    }
                    .frame(maxWidth: .infinity)
                }
                .padding()
    //            .background(Color(UIColor.systemGray6))
                .background(AppColor.grandGradient)
                .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Spacer()
            }
            
            
            Group {
                Text("Choose your answer to fit result")
                    .blueTitleStyle()
                    .leftTextStyle()
                
                HStack(spacing: 12) {
//                    ForEach(options, id: \.name) { option in
//                        Button {
//                            //tap option
//                            handTapped(1)
//                        } label: {
//                            Image(option.name)
//                                .resizable()
//                                .frame(width: 60, height: 60)
//                                .padding()
//                                .background(option.color)
//                                .clipShape(Circle())
//                        }
//                    }
                    
                    ForEach(0..<options.count) { item in
                        Button {
                            //tap option
                            handTapped(item)
                        } label: {
                            HandView(name: options[item].name, color: options[item].color)
                        }
                    }
                    
                        
                }
                
                Spacer()
            }
            
            
            Group {
                Text("Total score")
                    .blueTitleStyle()
                    .leftTextStyle()
                
                Text("\(Int(score)) / 10")
                    .rightTextStyle()
                    .font(.footnote)
                    .foregroundColor(.secondary)
                
                ProgressView(value: score, total: 10.0)
    //                .background(AppColor.lightYellow)
                    .tint(.yellow)
                .scaleEffect(x: 1, y: 2, anchor: .center)
                
                Spacer()
            }
                
            
            
        }
        .padding(.horizontal, 10)
        .alert(alertTitle, isPresented: $showResultAlert) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(alertMessage)
        }
        .alert("Final Question", isPresented: $showFinalAlert) {
            Button("Restart", action: reset)
        } message: {
            Text("The total score is \(Int(score)) / 10")
        }
    }
    
    func askQuestion() {
        
        if gameCount == 10 {
            showFinalAlert = true
        } else {
            shuffle()
            gameCount += 1
        }
        
    }
    
    func handTapped(_ index: Int) {
        
//        print("app choice is \(appChoice)")
//        print("answer choice is \(answerChoice)")
//        print("you tapped is \(index)")
        
        if answerChoice == index {
            alertTitle = "You are right"
            alertMessage = "Correct answer, you get 1 point"
            calculateScore(1.0)
        } else {
            alertTitle = "Wrong!"
            alertMessage = "The correct answer is \(options[answerChoice].name).\n you lose 1 point"
            calculateScore(-1.0)
        }
        
        showResultAlert = true
    }
    
    func calculateScore(_ number: Double) {
        score += number
        if(score < 0) {
            score = 0
        }
    }
    
    func reset() {
        gameCount = 1
        score = 0
        askQuestion()
    }
    
    func shuffle() {
        appChoice = Int.random(in: 0...2)
        answerChoice = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
