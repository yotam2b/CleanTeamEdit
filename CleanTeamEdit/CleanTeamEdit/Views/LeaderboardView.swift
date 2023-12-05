//
//  LeaderboardView.swift
//  CleanTeamEdit
//
//  Created by NMI Student on 11/27/23.
//
import SwiftUI
struct LeaderboardView: View {
    @ObservedObject var leaderData: LeaderData
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
                    Text(leader.name)
                    Spacer()
                    Text("\(leader.points) points")
                }
                GeometryReader { geometry in
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: mapPointsToWidth(points: leader.points), height: 15)
                }
            }
            .listRowInsets(EdgeInsets()) // Remove extra padding from List rows
            VStack(alignment: .leading, spacing: 10) { // Adjust spacing for the text at the bottom
                Text("This Cycle")
                    .font(.title)
                Text("Competing to Reach 200 Points")
                    .font(.title3)
                Text("Cycle Reward: Free Dinner")
                    .font(.title3)
                Text("View More Rewards")
                    .font(.body)
            }
        }
        .padding(.bottom, 220) // Add bottom padding
    }
    func mapPointsToWidth(points: Int) -> CGFloat {
        let ratio = CGFloat(points) / CGFloat(200) //<- that number is max points
        return ratio * UIScreen.main.bounds.width * 0.8 // Adjust multiplier for width scaling
    }
}
             struct LeaderboardView_Previews: PreviewProvider {
                 static var previews: some View {
                     LeaderboardView(leaderData: LeaderData())
                 }
             }


