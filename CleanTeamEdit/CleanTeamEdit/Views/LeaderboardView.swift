//
//  LeaderboardView.swift
//  CleanTeamEdit
//
//  Created by NMI Student on 11/27/23.
//
import SwiftUI
struct LeaderboardView: View {
    @ObservedObject var leaderData: LeaderData
    @State private var showRewards = false
    @State private var selectedReward: String = ""
    @State private var displayMode: DisplayMode = .rewards // Declare displayMode
      @State private var selectedPunishment: String = "" // Declare selectedPunishment
      
    
    var body: some View {
        VStack(spacing: 10) { // Adjust the spacing between elements
            HStack {
                Text("Leaderboard")
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                Image(systemName: "rosette")
                    .font(.title)
            }
            .padding(.top, 35)
            
            List(leaderData.leaders.sorted { $0.points > $1.points }) { leader in
                HStack {
                    Image(systemName: leader.imageName)
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                    VStack{
                        Text(leader.name)
                        Spacer()
                        Text("\(leader.points) points")
                    }
                    .padding(.top)
                }
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: mapPointsToWidth(points: leader.points), height: 15)
                }
            }
            .listRowInsets(EdgeInsets()) // Remove extra padding from List rows
            
            VStack(alignment: .leading) {
                Text("This Cycle Goal")
                    .font(.title)
                Text("Competing to Reach 200 Points")
                    .font(.title3)
                Text("Cycle \(displayMode == .rewards ? "Reward" : "Punishment"): \(displayMode == .rewards ? selectedReward : selectedPunishment)")
                        .font(.title3)
                
                
            }
            Button(action: {
                showRewards.toggle()
            }) {
                Text("Select Reward/Punishment")
                    .font(.body)
            }
            .sheet(isPresented: $showRewards) {
                RewardsPage(selectedReward: $selectedReward, selectedPunishment:$selectedPunishment,displayMode: $displayMode, didSelectReward: { reward in
                    selectedReward = reward // Update the selected reward
                },
                didSelectPunishment: { punishment in selectedPunishment = punishment
                },
                didSelectType: { type in
                    displayMode = type // Update the selected type (reward or punishment)
                })
            }
        }
    }
    
    func mapPointsToWidth(points: Int) -> CGFloat {
        let ratio = CGFloat(points) / CGFloat(200)
        return ratio * UIScreen.main.bounds.width * 0.8
    }
    
    
    struct LeaderboardView_Previews: PreviewProvider {
        static var previews: some View {
            LeaderboardView(leaderData: LeaderData())
        }
    }
}

