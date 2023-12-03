//
//  NudgeRepository.swift
//  Nudge Messaging
//
//  Created by Madison  Courter on 11/30/23.
//

import SwiftUI


struct NudgeRepository: View {
    @StateObject private var viewModel = NudgeRepositoryModel()
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText)

                List {
                    ForEach(viewModel.filteredNudges(searchText: searchText)) { nudge in
                        NavigationLink(destination: NudgeDetailView(nudge: nudge)) {
                            HStack {
                                Circle()
                                    .fill(Color.purple) // change to harmony
                                    .frame(width: 50, height: 50)
                                    .overlay(
                                        Image("DisappointedTerryFlipped") //change to Disappointed Terry Flipped
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 50, height: 50)
                                            .foregroundColor(.white)
                                    )
                                    .padding(.trailing, 8)

                                VStack(alignment: .leading) {
                                    Text(nudge.message)
                                    Text("Sent on \(formattedDate(from: nudge.date))")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                            }
                        }
                    }
                    .onDelete { indexSet in
                        // Remove nudges at specified index set
                        viewModel.removeNudges(at: indexSet)
                    }
                }
               .listStyle(.plain)
            }
            .navigationTitle("Nudge Inbox")
           .navigationBarItems(trailing: NavigationLink(destination: NudgeCreationView(), label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 30, height: 30)
            }))
        }
    }

    func formattedDate(from date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
}

struct NudgeCreationView_Previews: PreviewProvider {
    static var previews: some View {
        NudgeRepository()
    }
}

struct Nudge: Identifiable {
    var id = UUID()
    var message: String
    var date: Date
    // Add more properties as needed
}

class NudgeRepositoryModel: ObservableObject {
    @Published var nudges: [Nudge] = [
        Nudge(message: "The dishes aren't going to wash themselves.", date: Date()),
        Nudge(message: "Trash duty is calling!", date:
                Date().addingTimeInterval(-3600)),
        // Add more nudges
    ]

    func filteredNudges(searchText: String) -> [Nudge] {
        guard !searchText.isEmpty else {
            return nudges
        }

        return nudges.filter { nudge in
            nudge.message.lowercased().contains(searchText.lowercased())
        }
    }
    
    func removeNudges(at offsets: IndexSet) {
            nudges.remove(atOffsets: offsets)
        }
}

struct NudgeDetailView: View {
    var nudge: Nudge

    var body: some View {
        VStack{
            Text(nudge.message)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 50)
                        .fill(Color.white)
                        .shadow(radius: 3)
                        .frame(minWidth: 0, maxWidth: 300, minHeight: 0, maxHeight: .infinity)
                )
                .offset(x:-50,y:40)
            Image(systemName: "tortoise.fill")// Change to Dissapointed Terry
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
                .offset(x:70,y:50)
        }

        
        .padding()
        .navigationTitle("Your Message")
    }
}

struct SearchBar: View {
    @Binding var text: String

    var body: some View {
        HStack {
            TextField("Search", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .overlay(
                    HStack {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding(.leading, 8)
                            .padding(.trailing, 8)
                    }
                )
                .padding(.horizontal, 10)
        }
        .padding(.horizontal)
        .padding(.top, 10)
    }
}
