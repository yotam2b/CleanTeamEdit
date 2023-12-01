//
//  NudgeCreationView.swift
//  Nudge Messaging
//
//  Created by Madison  Courter on 11/30/23.
//

import SwiftUI

struct NudgeCreationView: View {
    @StateObject private var nudgeCreationViewModel = NudgeCreationViewModel()
    @State private var selectedCategory: ChoreCategory?
    @State private var selectedRoommate: String?

    var body: some View {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    Text("Someone slacking? Don't be shy, give them a nudge.")
                        .font(.title2)
                        .padding(.top,5)
                        .padding(.horizontal,20)
                        
                    // Roommates
                    HStack{
                        Text("Teammates")
                            .font(.title3)
                            .padding(.horizontal,20)
                            .padding(.top,20)
                        Spacer()
                    }
                    
                    HStack(spacing: 20) {
                        ForEach(nudgeCreationViewModel.roommates, id: \.self) { roommate in
                            Button(action: {
                                selectedRoommate = roommate
                            }) {
                                VStack{
                                    Circle()
                                        .fill(Color.purple) //Change to Harmoy
                                        .frame(width: 60, height: 60)
                                        .overlay(
                                            Image(systemName: "person.fill") // Replace with SF symbol representing the roommate
                                                .foregroundColor(.white)
                                        )
                                        .overlay(
                                            Circle()
                                                .stroke(selectedRoommate == roommate ? Color.black : Color.clear, lineWidth: 2)
                                        )
                                    Text(roommate)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding()
                    
                    // Chore Categories
                    HStack{
                        Text("Prompts By Category")
                            .font(.title3)
                            .padding(.horizontal,20)
                            .padding(.top,20)
                         
                        Spacer()
                    }
                    HStack(spacing: 20) {
                        ForEach(nudgeCreationViewModel.choreCategories) { category in
                            NavigationLink(destination:NudgePromptSelectionView(category: category, viewModel: nudgeCreationViewModel, selectedCategory: $selectedCategory, selectedRoommate: $selectedRoommate)) {
                                VStack{
                                    Circle()
                                        .fill(category.color)
                                        .frame(width: 80, height: 80)
                                        .overlay(
                                            Image(category.image)
                                                .resizable()
                                                .frame(width:140,height:140)
                                        )
                                        .overlay(
                                            Circle()
                                                .stroke(selectedCategory?.id == category.id ? Color.black : Color.clear, lineWidth: 2)
                                        )
                                    Text(category.name)
                                        .foregroundColor(.black)
                                }
                            }
                        }
                    }
                    .padding()
                }
              
            }
            .navigationTitle("Create New Nudge")
    }
}


class IdentifiableString: Identifiable {
    let id = UUID()
    let value: String
    var selectedRoommate: String?
    init(_ value: String) {
        self.value = value
    }
}

struct ChoreCategory: Identifiable {
    var id: UUID = UUID()
    var color: Color
    var name: String
    var image: String
    var prompts: [String]
}

struct NudgePromptSelectionView: View {
    var category: ChoreCategory
    @ObservedObject var viewModel: NudgeCreationViewModel
    @Binding var selectedCategory: ChoreCategory?
    @Binding var selectedRoommate: String?

    @State private var selectedPrompt: IdentifiableString?
    @State private var isActionSheetPresented = false
    @State private var isSentConfirmationVisible = false


    var body: some View {
        ScrollView {
            ForEach(category.prompts, id: \.self) { prompt in
                VStack {
                    HStack {
                        Text(prompt)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color("Tidy"))
                            .cornerRadius(50)
                            .onTapGesture {
                                selectedPrompt = IdentifiableString(prompt)
                                isActionSheetPresented = true
                               
                            }
                            .overlay(
                                RoundedRectangle(cornerRadius: 50)
                                    .stroke(selectedPrompt?.value == prompt ? Color.black : Color.clear, lineWidth: 2)
                            )
                        Image("DissapointedTerry") // Replace with your turtle image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                            

                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    .cornerRadius(15)
                    .shadow(radius: 2)
                }
                
                .padding(.vertical, 8)
                
            }
        }
        .background(Color.gray.opacity(0.1)) // Adjust background color as needed
        .navigationTitle(category.name)
        //.navigationBarItems(trailing: sendButton)
        .actionSheet(isPresented: $isActionSheetPresented) {
            ActionSheet(
                title: Text("Send to \(selectedRoommate ?? "Teammate")?"),
                buttons: [
                    .default(Text("Send")) {
                        // Add your message sending logic here
                        if let prompt = selectedPrompt?.value, let roommate = selectedRoommate {
                            let sender = "Anonymous" // Replace with actual sender's identifier
                            viewModel.sendMessage(sender: sender, text: prompt, to: roommate)
                            isSentConfirmationVisible = true
                        }
                        selectedRoommate = nil
                    },
                    .cancel()
                ]
            )
        }
        .overlay(
            VStack {
                if isSentConfirmationVisible {
                            Text("Message sent!")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.green) // Customize the color
                                .cornerRadius(50)
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 20, trailing: 20))
                        }
                    }
                , alignment: .bottom
        )
    }

    /*var sendButton: some View {
        Button(action: {
            isActionSheetPresented = true
        }) {
            Image(systemName: "arrow.up.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
        }
    }*/
}

#Preview {
    NudgeCreationView()
}
