//
//  OnboardingPageView.swift
//  CleanTeamEdit
//
//  Created by Madison  Courter on 12/7/23.
//

import SwiftUI

struct OnboardingPageView: View {
    var page: Page
    
    var body: some View {
        VStack() {
            Image("\(page.image)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(30)
                //.background(.gray.opacity(0.10))
                .cornerRadius(10)
                .padding()
            
            Text(page.name)
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
            Text(page.description)
                .padding(.top,10)
                .frame(width: 350)
                .multilineTextAlignment(.center)
                .lineSpacing(10)
            
           // Spacer()
        }
    }
}

struct OnboardingPageView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingPageView(page: Page.samplePage)
    }
}
