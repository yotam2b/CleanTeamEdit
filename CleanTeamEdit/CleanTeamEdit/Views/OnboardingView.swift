//
//  OnboardingView.swift
//  CleanTeamEdit
//
//  Created by Madison  Courter on 12/7/23.
//

import SwiftUI

struct OnboardingView: View {
    @State private var pageIndex = 0
    private let pages: [Page] = Page.samplePages
    private let dotAppearance = UIPageControl.appearance()
    private let userId: String = "yourUserId"
    
    var body: some View {
        NavigationView{
        TabView(selection: $pageIndex) {
            ForEach(pages) { page in
                VStack {
                    HStack{
                        Spacer()
                        
                        if pageIndex != pages.count - 1 {
                            Button("Skip", action: goToFive)
                                .padding(.horizontal, 10)
                                .font(.title3)
                        }
                    }
                    .foregroundColor(.black)
                    .padding()
                    
                    //Spacer()
                    OnboardingPageView(page: page)
                    Spacer()
                    if page == pages.last {
                        NavigationLink(destination: TodoListView(userId: self.userId)) {
                            Text("Get Started")
                                .padding(12)
                                .padding(.horizontal,20)
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(30)
                        }
                        
                    } else{}
                    
                    Spacer(minLength: 60)
                }
                .tag(page.tag)
            }
        }
        .animation(.easeInOut, value: pageIndex)// 2
        .indexViewStyle(.page(backgroundDisplayMode: .interactive))
        .tabViewStyle(PageTabViewStyle())
        .onAppear {
            dotAppearance.currentPageIndicatorTintColor = .purple
            dotAppearance.pageIndicatorTintColor = .gray
        }
    }
    }
    
    func incrementPage() {
        pageIndex += 1
    }
    
    func goToZero() {
        pageIndex = 0
    }
    
    func goToFive() {
        pageIndex = 5
    }
}

#Preview {
    OnboardingView()
}
