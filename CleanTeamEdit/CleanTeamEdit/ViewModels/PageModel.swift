//
//  PageModel.swift
//  CleanTeamEdit
//
//  Created by Madison  Courter on 12/7/23.
//

import Foundation

struct Page: Identifiable, Equatable {
    let id = UUID()
    var name: String
    var description: String
    var image: String
    var tag: Int
    
    static var samplePage = Page(name: "Title Example", description: "This is a sample description for the purpose of debugging", image: "work", tag: 0)
    
    static var samplePages: [Page] = [
        Page(name: "Welcome to CleanTeam!", description: "Do your chores as a team — \n not as enemies", image: "Welcome Screen", tag: 0),
        Page(name: "Accountability, Finally", description: "With CleanTeam, teammates have a shared to-do list for all household chores, keeping everyone accountable.", image: "To-Do Screen", tag: 1),
        Page(name: "Leaderboard Glory", description: "Once a task is finished, check it off, and you earn points! The more points you earn, the closer you get to winning a reward or avoiding punishment.", image: "Leaderboard Screen", tag: 2),
        Page(name: "Reward or Punishment? You Decide!", description: "Your team has two systems to choose from: rewards or punishments, either rewarding the person with the most points or punishing the person with the least. It’s up to you!", image: "Rewards Screen", tag: 3),
        Page(name: "Nudge Them Silently", description: "And if you feel like a team member is slacking on their chores, you can send them a friendly, anonymous Nudge to keep them motivated.", image: "Nudge Screen", tag: 4),
        Page(name: "Congrats!", description: "Alright, you’re ready to get started. Say goodbye to roommate horror stories and hello to CleanTeam, a chore management solution that works for you.", image: "Congratulations Screen", tag: 5),
    ]
}
