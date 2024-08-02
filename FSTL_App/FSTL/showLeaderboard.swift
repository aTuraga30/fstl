//
//  showLeaderboard.swift
//  FSTL
//
//  Created by Turaga on 7/17/22.
//

import SwiftUI

struct playersAndOTS: Hashable, Codable {
    var player: String
    var OTS: Double
}

class ViewModel: ObservableObject {
    @Published var courses: [playersAndOTS] = []
    
    func fetch() {
        guard let url = URL(string: "https://playersdatabase.herokuapp.com") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data,
            _, error in guard let data = data, error == nil else {
                return
            }
            do {
                let courses = try JSONDecoder().decode([playersAndOTS].self, from: data)
                    DispatchQueue.main.async {
                    self?.courses = courses
                }
            }
            catch {
                print(error)
            }
        }
        
        task.resume()
        
    }
}

struct showLeaderboard: View {
    @StateObject var viewModel = ViewModel()
    @State private var playersAndOtsDict = [
        "test": 0.00
    ]
    
    var body: some View {
        VStack(spacing: 15) {
            List {
                ForEach(viewModel.courses, id: \.self) {
                    course in HStack {
                        Text("\(course.player): \(String(course.OTS))")
                    }
                    .padding(3)
                }
            }
            
            Button(action: {
                viewModel.fetch()
            }) {
                Text("Refresh Data")
            }
        }
        .navigationTitle("OTS Leaderboard")
    }
}

struct showLeaderboard_Previews: PreviewProvider {
    static var previews: some View {
        showLeaderboard()
    }
}
