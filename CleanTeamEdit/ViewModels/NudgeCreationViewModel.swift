//
//  NudgeCreationViewModel.swift
//  Nudge Messaging
//
//  Created by Madison  Courter on 11/30/23.
//

import Foundation

class NudgeCreationViewModel: ObservableObject {
    @Published var choreCategories: [ChoreCategory] = [
        ChoreCategory(color: .orange, name: "Trash", image:"Trash",  prompts: ["Ew, it stinks in here. Take out the trash.", "The trash is overflowing. Can you handle it?", "Trash duty is calling!"]),
        ChoreCategory(color: .orange, name: "Dishes",image: "Dishes", prompts: ["The dishes are piling up. Can you wash them soon?", "The dishes aren't going to wash themselves.", "I've run out of cups to use!"]),
        ChoreCategory(color: .orange, name: "Sweep",image: "Sweep", prompts: ["Dust bunnies are taking over! Can you help clear them out?", "A quick sweep would be awesome right about now.", "Sweeping time! Our floors need some attention. Mind taking care of it?"]),
        ChoreCategory(color: .orange, name: "Mop",image: "Mop", prompts: ["Hey, the floors could use a little love. Can you mop when you get a chance?", "Let's make our space shine. Can you take care of the floors today?", "The floor is feeling a bit sticky. Mind grabbing the mop?"]),


        // Add more chore categories and prompts as needed
    ]
    @Published var roommates: [String] = ["Teammate 1", "Teammate 2", "Teammate 3"]
    func getRandomPrompt(for category: ChoreCategory) -> String {
        return category.prompts.randomElement() ?? ""
    }
    
    func sendMessage(sender: String, text: String, to roommate: String) {
            // Implement your logic for sending a message here
            print("Sending message from \(sender) to \(roommate): \(text)")
    }
}

