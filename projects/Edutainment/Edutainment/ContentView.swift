//
//  ContentView.swift
//  Edutainment
//
//  Created by Yi An Chen on 2022/2/4.
//

import SwiftUI

struct GridStack<Content: View>: View {
    let itemStart: Int
    let itemEnd: Int
    @ViewBuilder let content: (Int) -> Content
    
    var body: some View {
        VStack {
            HStack {
                ForEach(itemStart..<6, id: \.self) { item in
                    content(item)
                }
            }
            
            HStack {
                ForEach(6..<10, id: \.self) { item in
                    content(item)
                }
            }
            
            HStack {
                ForEach(10..<itemEnd, id: \.self) { item in
                    content(item)
                }
            }
        }
    }
}

struct NumberButton: View {
    let number: Int
    let preActive: Bool
    var clickEvent: () -> Void
    @State private var active: Bool
    
    init(number: Int, preActive: Bool, clickEvent: @escaping () -> Void) {
        self.number = number
        self.preActive = preActive
        self.clickEvent = clickEvent
        
//        print("number", number)
//        print("preActive", preActive)
        self.active = preActive
//        print("active", active)
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                active.toggle()
                clickEvent()
            }
        }) {
            Label {
                Text(number.formatted())
            } icon: {
                if active {
                    Image(systemName: "checkmark")
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding(6)
        .background(active ? AppColor.coffee : AppColor.beige)
        .foregroundColor(active ? AppColor.beige : AppColor.coffee)
        .clipShape(RoundedRectangle(cornerRadius: 6))
    }
}

struct AppColor {
    static let beige = Color("beige")
    static let coffee = Color("coffee")
    static let snow = Color("snow")
    static let orange = Color("orange")
    static let red = Color("red")
    static let green = Color("green")
}

struct AppData {
    
//    var multipleSet = Set<Int>()
    var multipleSet: Set<Int>
    var count: Int
//    var questionArray: [(question: String, answer: Int)]
    var questionArray: [(question: String, answer: Int, options: [Int])] {
        var tempContainer = [(question: String, answer: Int, options: [Int])]()
        
        for _ in 1...count {
            let leftHand = multipleSet.randomElement() ?? 0
            let rightHand = Int.random(in: 2...9)
            let question = "\(leftHand) × \(rightHand)"
            let answer = leftHand * rightHand
            
            let option1 = (leftHand - 1) * rightHand
            let option2 = leftHand * (rightHand + 1)
            let option3 = leftHand * (rightHand + 2)
            let options = [answer, option1, option2, option3].shuffled()
            
            let temp = (question: question, answer: answer, options: options)
            tempContainer.append(temp)
        }
        
        return tempContainer
    }
    
    init(muptipleSet: Set<Int>, count: Int) {
        if muptipleSet.count == 0 {
            self.multipleSet = Set([2,3,4,5,6,7,8,9,10,11,12])
        } else {
            self.multipleSet = muptipleSet
        }
        self.count = count
        
    }
    
    static let animals = [(
        name: "chick",
        saying: "Cheep. Cheep. I found a new question here!"
    ), (
        name: "dog",
        saying: "A new question is coming in. Quick! Quick! Yip! Yip!"
    ), (
        name: "frog",
        saying: "Croak. Croak. Here is a new question."
    ), (
        name: "monkey",
        saying: "Look! Look! Here is new question. Do you need any help?"
    ), (
        name: "octopus",
        saying: "Hey! This question seems to be little difficult. Let's try."
    ), (
        name: "penguin",
        saying: "Another question is coming! Let's solve it together."
    ), (
        name: "tiger",
        saying: "Roar! You'd better to solve this question quickly."
    ), (
        name: "whale",
        saying: "Can you solve this question for me? I will be very happy."
    )]
    
}

struct ContentView: View {
    
    let questionCount = [5, 10, 20]

    @State private var selectedAnimal = AppData.animals.randomElement() ?? (name: "Unknown", saying: "")
    
    @State private var isStart = false
    @State private var isJudge = false
    
    var animalSaying: String {
        if isJudge {
            if isCorrect {
                return "Great, you're right!"
            } else {
                return "Oh-oh, \(questionArray[nowCount].answer) is right answer"
            }
        } else if isEnd {
            return "Game is end, your total score is"
        } else {
            return selectedAnimal.saying
        }
    }
    @State private var optionSelectedIndex = -1
    @State private var isCorrect = false
    @State private var score = 0
    @State private var isEnd = false
    
    @State private var selectedCount = 5
    @State private var selectedTables: Set<Int> = Set([2,3,4])
   
    @State private var questionArray = [(question: "5 × 9", answer: 0, options: [0,1,2,3])]
    @State private var nowCount = 0
    
    @State private var dialogOpacityValue = 0.0
    @State private var questionOpacityValue = 0.0
    @State private var optionOpacityValue = 0.0
    
    var body: some View {
        ZStack {
            
            if isStart == false {
                AppColor.snow
                    .ignoresSafeArea()
                
                VStack {
                    Text("Edutaiment")
                        .font(.largeTitle.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(AppColor.coffee)
                        .padding(.top)
                    
                    Text("A Quiz App for Multiplication Table Practicing")
                        .foregroundColor(.secondary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.bottom)
                    
                    Text("🔢 Select the multiplication tables")
                        .font(.body.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(AppColor.coffee)
                        .padding(.top)
                    
                    GridStack(itemStart: 2, itemEnd: 13) {item in
                        NumberButton(number: item, preActive: selectedTables.contains(item)) {
                            if(selectedTables.contains(item)) {
                                selectedTables.remove(item)
                            } else {
                                selectedTables.insert(item)
                            }
//                            print(selectedTables)
                        }
                    }
                    
                    Text("🎲 Select how many questions")
                        .font(.body.bold())
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(AppColor.coffee)
                        .padding(.top)
                    
                    
                    Picker("Select play times", selection: $selectedCount) {
                        ForEach(questionCount, id: \.self) { count in
                            Text("\(count) Quizs")
                                .foregroundColor(Color.white)
                        }
                    }
                    .pickerStyle(.segmented)
    //                .colorMultiply(AppColor.coffee)
                    
                    
                    Spacer()
                    
                    Button {
                        startGame()
                    } label: {
                        Text("Let's Go")
                            .frame(maxWidth: .infinity)
                    }
                    .font(.body.bold())
                    .padding()
                    .background(AppColor.orange)
                    .foregroundColor(AppColor.beige)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                }
                .padding()
            } else {
                Color("\(selectedAnimal.name)-light")
                    .ignoresSafeArea()
//                    .transition(.opacity)
                
                VStack(spacing: 10) {
                    HStack() {
                        Image(selectedAnimal.name)
                            .resizable()
                            .frame(width: 80, height: 80)
                        
                        VStack {
                            Text(animalSaying)
                                .font(.body.bold())
                                .frame(maxWidth: .infinity, maxHeight: 100, alignment: .leading)
                                .foregroundColor(Color(selectedAnimal.name))
                                .padding(.leading)
                            
                            if isJudge {
                                HStack {
                                    Spacer()
                                    Button(action: askNewQuestion, label: {
                                        Text("Go to next")
                                        Image(systemName: "arrow.forward.circle")
                                    })
                                        .foregroundColor(.secondary)
                                        .padding(.top, 4)
                                }
                            }
                        }
                        
                    }
                    .opacity(dialogOpacityValue)
                    .onAppear {
                        withAnimation(.default.delay(0.5)) {
                            dialogOpacityValue = 1.0
                        }
                    }
                    
                    Text(isEnd ? "\(score) / \(selectedCount)" : questionArray[nowCount].question)
                    .font(.system(size: 60))
                    .foregroundColor(Color(selectedAnimal.name))
                    .opacity(questionOpacityValue)
                    .onAppear {
                        withAnimation(.default.delay(1)) {
                            questionOpacityValue = 1.0
                        }
                    }
                    
                    if isEnd == false {
                        
                        ForEach(questionArray[nowCount].options, id: \.self) { index in
                            Button {
                                if !isJudge {
                                    checkAnswer(index)
                                }
                            } label: {
                                Text(index.formatted())
                                    .frame(maxWidth: .infinity)
                            }
                            .font(.body.bold())
                            .padding()
                            .background(optionSelectedIndex==index ? .clear : Color(selectedAnimal.name))
                            .background(optionSelectedIndex==index && isCorrect ? AppColor.green : AppColor.red)
                            .foregroundColor(Color("\(selectedAnimal.name)-light"))
                            .clipShape(RoundedRectangle(cornerRadius: 16))
                            .padding(.top)
                            
                        }
                        .opacity(optionOpacityValue)
                        .onAppear {
                            withAnimation(.default.delay(1.5)) {
                                optionOpacityValue = 1.0
                            }
                        }
                        
                        Spacer()
                    } else {
                        
                        Spacer()
                        
                        Button {
                            resetGame()
                        } label: {
                            Text("Restart")
                                .frame(maxWidth: .infinity)
                        }
                        .font(.body.bold())
                        .padding()
                        .background(Color(selectedAnimal.name))
                        .foregroundColor(Color("\(selectedAnimal.name)-light"))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .padding(.top)
                    }
                    
                    
                    
                    
                }
                .padding()
            }
        }
    }
    
    init() {
        let UIColorCoffee = UIColor(named: "coffee") ?? UIColor.black
        let UIColorBeige = UIColor(named: "beige") ?? UIColor.white
        
        UISegmentedControl.appearance().selectedSegmentTintColor = UIColorCoffee
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColorBeige], for: .selected)
        UISegmentedControl.appearance().setTitleTextAttributes([.foregroundColor: UIColorCoffee], for: .normal)
    }
    
    func resetGame() {
        withAnimation {
            isStart = false
            isEnd = false
            
        }
    }
    
    func startGame() {
        dialogOpacityValue = 0.0
        questionOpacityValue = 0.0
        optionOpacityValue = 0.0
        
        score = 0
        nowCount = 0
        
        questionArray = AppData(muptipleSet: selectedTables, count: selectedCount).questionArray
        selectedAnimal = AppData.animals.randomElement() ?? (name: "Unknown", saying: "")
        
        isStart = true
//        print(questionArray)
    }
    
    func checkAnswer(_ index: Int) {
//        let answer = questionArray[nowCount].options[index]
        withAnimation {
            isCorrect = index == questionArray[nowCount].answer
            optionSelectedIndex = index
            isJudge = true
            if isCorrect {
                score += 1
            }
        }
    }
    
    func askNewQuestion() {
        optionSelectedIndex = -1
        withAnimation {
            isJudge = false
            selectedAnimal = AppData.animals.randomElement() ?? (name: "Unknown", saying: "")
            
            if nowCount < selectedCount-1 {
                nowCount += 1
            } else {
                withAnimation {
                    isEnd = true
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
