//
//  OnboardingView.swift
//  CitySights App
//
//  Created by Babak Kiaie on 12/13/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedViewIndex = 0
    
    var body: some View {
        
       
        ZStack{
            
            Color(selectedViewIndex == 0 ?  Color(red: 111/255, green: 154/255, blue: 189/255) : Color(red: 139/255, green: 166/255, blue: 65/255)
            ).ignoresSafeArea()
            
            TabView(selection: $selectedViewIndex) {
                OnboardingViewDetails(bgColor: Color(red: 111/255, green: 154/255, blue: 189/255), headline: "Welcome to City Sights", subHeadline: "City Sights help you find the best of the city!") {
                    withAnimation {
                        selectedViewIndex = 1
                    }
                  
                }
                .tag(0)
                .ignoresSafeArea()
                OnboardingViewDetails(bgColor: Color(red: 139/255, green: 166/255, blue: 65/255), headline: "Discover your city", subHeadline: "Second Screen") {
                    withAnimation {
                        dismiss()
                    }
                }
                .tag(1)
                .ignoresSafeArea()
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                HStack(spacing: 16){
                    Spacer()
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 0 ? .white : .gray)
                    Circle()
                        .frame(width: 10)
                        .foregroundStyle(selectedViewIndex == 1 ? .white : .gray)
                    Spacer()
                }
            }
            .padding(.bottom,220)
        }
       
    }
}

#Preview {
    OnboardingView()
}
