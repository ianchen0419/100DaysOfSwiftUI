//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yi An Chen on 2022/1/30.
//

import SwiftUI

struct FlagView: View {
    var name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle.bold()) //largeTitle.weight(.bold)
            .foregroundColor(.white)
    }
}

extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var showingFinal = false
    
    @State private var scoreTitle = ""
    @State private var scoreMesssage = ""
    @State private var score = 0
    
    @State private var gameCount = 1
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    let labels = [
        "Estonia": "Flag with three horizontal stripes of equal size. Top stripe blue, middle stripe black, bottom stripe white",
        "France": "Flag with three vertical stripes of equal size. Left stripe blue, middle stripe white, right stripe red",
        "Germany": "Flag with three horizontal stripes of equal size. Top stripe black, middle stripe red, bottom stripe gold",
        "Ireland": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe orange",
        "Italy": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe red",
        "Nigeria": "Flag with three vertical stripes of equal size. Left stripe green, middle stripe white, right stripe green",
        "Poland": "Flag with two horizontal stripes of equal size. Top stripe white, bottom stripe red",
        "Russia": "Flag with three horizontal stripes of equal size. Top stripe white, middle stripe blue, bottom stripe red",
        "Spain": "Flag with three horizontal stripes. Top thin stripe red, middle thick stripe gold with a crest on the left, bottom thin stripe red",
        "UK": "Flag with overlapping red and white crosses, both straight and diagonally, on a blue background",
        "US": "Flag with red and white stripes of equal size, with white stars on a blue background in the top-left corner"
    ]
    
    @State private var spinValue = 0.0
    @State private var opacityValue = 1.0
    @State private var scaleValue = 1.0
    @State private var userSelectIndex: Int = -1
    
    var body: some View {
        
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.2), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .titleStyle()
//                    .font(.largeTitle.bold()) //largeTitle.weight(.bold)
//                    .foregroundColor(.white)
                
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                        //dynamic type
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            print("tapped")
                            //flag was tapped
                            userSelectIndex = number
                            withAnimation {
                                spinValue = 360
                                opacityValue = 0.25
                                scaleValue = 0.75
                            }
                            flagTapped(number)
                        } label: {
                            FlagView(name: countries[number])
                                .accessibilityLabel(labels[countries[number], default: "Unknown flag"])
                        }
                        .rotation3DEffect(.degrees(userSelectIndex==number ? spinValue : 0.0), axis: (x: 0, y: 1, z: 0))
                        .opacity(userSelectIndex==number ? 1.0 : opacityValue)
                        .scaleEffect(userSelectIndex==number ? 1.0 : scaleValue)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(score)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                
                Spacer()
                
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text(scoreMesssage)
        }
        .alert("Final Question", isPresented: $showingFinal) {
            Button("Restart", action: reset)
        } message: {
            Text("The total score is \(score)/8")
        }
    }
    
    func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            scoreTitle = "Correct"
            score += 1
            scoreMesssage = "Your score is \(score)"
        } else {
            scoreTitle = "Wrong"
            scoreMesssage = "That's the flag of \(countries[number])"
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        if gameCount == 8 {
            showingFinal = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
            gameCount += 1
            
            spinValue = 0
            opacityValue = 1.0
            scaleValue = 1.0
        }
        
    }
    
    func reset() {
        score = 0
        gameCount = 1
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
