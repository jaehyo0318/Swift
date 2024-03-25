//
//  ContentView.swift
//  Cinema
//
//  Created by  서재효 on 3/25/24.
//

import SwiftUI
import BoxOffices


struct ContentView: View {
    @State private var movies: [Movie] = []
    
    var body: some View {
        List {
            ForEach(movies, id: \.code) { movie in
                HStack {
                    Text("#\(movie.rank)")
                        .bold()
                        .foregroundStyle(Color.accentColor)
                    
                    Text(movie.name)
                }
            }
        }
        .task {
            do {
                movies = try await BoxOffices.shared.fetchDailyTop10().get()
            } catch {
                print(error.localizedDescription)
            }
            
        }
    }
}

extension BoxOffices {
    static var shared: BoxOffices {
        BoxOffices(key: "4686cb5806be8d31934c175f2132f07f")
    }
}

#Preview {
    ContentView()
}
