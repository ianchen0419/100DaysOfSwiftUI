//
//  ListLayoutView.swift
//  Moonshot
//
//  Created by Yi An Chen on 2022/2/9.
//

import SwiftUI

struct ListLayoutView: View {
    
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    @State private var selected: Int?
    
    var body: some View {
        List(missions) { mission in
            NavigationLink(tag: mission.id, selection: $selected) {
                MissionView(mission: mission, astronauts: astronauts)
            } label: {
                HStack {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 80, height: 80)
                        .padding(8)
                        .accessibilityHidden(true)

                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                            .padding(.bottom, 2)
                        Text(mission.formattedLaunchDate(.abbreviated))
                            .foregroundColor(.white.opacity(0.5))
                    }
                }
                .accessibilityElement(children: .combine)
                
            }
            .listRowBackground(mission.id == selected ? Color.lightBackground : Color.darkBackground)


        }
        .listStyle(.plain)
        
    }
    
//    init(missions: [Mission], astronauts: [String: Astronaut]) {
//        self.missions = missions
//        self.astronauts = astronauts
//
//        let color = UIView()
//        color.backgroundColor = UIColor.red
//        UITableViewCell.appearance().selectedBackgroundView = color
//    }
}

struct ListLayoutView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    static var previews: some View {
        NavigationView {
            ListLayoutView(missions: missions, astronauts: astronauts)
                
        }
        .preferredColorScheme(.dark)
    }
}
