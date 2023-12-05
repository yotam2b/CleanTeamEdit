//
//  ContentView.swift
//  CleanTeamTodo
//
//  Created by Yotam Ben-Bassat on 10/15/23.
//

import SwiftUI

struct MainView: View {
    
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty {
            TabView {
                TodoListView(userId: viewModel.currentUserId)
                    .tabItem{
                        Label("To-Do List", systemImage: "list.bullet.clipboard.fill")
                    }

                NudgeRepository()
                    .tabItem{
                        Label("Nudges", systemImage:"message.fill")
                    }
                LeaderboardView(leaderData: LeaderData())                    .tabItem{
                        Label("Leaderboard", systemImage:"chart.bar")
                    }
                ProfileView()
                    .tabItem{
                        Label("Profile", systemImage: "person.circle")
                    }
            }
        } else {
            LoginView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
