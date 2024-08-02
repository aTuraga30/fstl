//
//  ContentView.swift
//  FSTL
//
//  Created by Turaga on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 25) {
                Spacer()
                NavigationLink("Input Scores", destination: InputScores())
                    .font(.headline)
                    .padding(.all)
                    .foregroundColor(.black)
                    .background(Color.blue)
                    .cornerRadius(9)
                Spacer()
                NavigationLink("Show Leaderboard", destination: showLeaderboard())
                    .font(.headline)
                    .padding(.all)
                    .foregroundColor(.black)
                    .background(Color.blue)
                    .cornerRadius(9)
                Spacer()
                NavigationLink("Update OTS Scores", destination: updateOTS())
                    .font(.headline)
                    .padding(.all)
                    .foregroundColor(.black)
                    .background(Color.blue)
                    .cornerRadius(9)
                Spacer()
                Spacer()
            }
            .padding(.all)
            .navigationTitle("Fairview Stripes League")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .preferredColorScheme(.dark)
        }
    }
}
