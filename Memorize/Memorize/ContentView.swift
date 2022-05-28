//
//  ContentView.swift
//  Memorize
//
//  Created by Daniel Yun on 5/25/22.
//

import SwiftUI

struct ContentView: View {
   
    @State var selectedTheme = GameTheme().vehicles
    
    @State var emojiCount = 4
    var body: some View {
        VStack {
            Text("Memorize")
                .font(.title)
            ScrollView {
            // main view
                
                // lazy about accessing body vars of all of its views
                // only get the body vars of the views that appear on screen
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 75))]) {
                    ForEach(selectedTheme[0..<emojiCount], id: \.self, content: { emoji in
                        CardView(content: emoji)
                            .aspectRatio(2/3, contentMode: .fit)
                    })
                }
            }
            .foregroundColor(.red)

            Spacer()
            // Button
            HStack {
                chooseVehiclesTheme
                Spacer()
                chooseanimalsTheme
                Spacer()
                chooseWeatherTheme
            }
            .font(.largeTitle)
            .padding(.horizontal)

        }
        .padding(.horizontal)
    }
    var chooseVehiclesTheme : some View {
        Button(action: {
            chooseTheme(theme: GameTheme().vehicles)
        }, label: {
            VStack {
            Image(systemName: "car")
            Text("Vehicles")
                .font(.caption)
            }
        })
    }
    
    var chooseanimalsTheme : some View {
        Button(action: {
            chooseTheme(theme: GameTheme().animals)
        }, label: { VStack {
            Image(systemName: "tortoise")
            Text("Animals")
                .font(.caption)
            }})
    }
    
    var chooseWeatherTheme : some View {
        Button(action: {
            chooseTheme(theme: GameTheme().weather)
        }, label: { VStack {
            Image(systemName: "cloud.sun")
            Text("Weather")
                .font(.caption)
            }})
    }
    
    func chooseTheme(theme : Array<String>) {
        self.selectedTheme = theme
        randomizeCardCount()
        shuffleCards()
    }
    
    func shuffleCards() {
        self.selectedTheme.shuffle()
    }
    
    // extra credit 1
    func randomizeCardCount() {
        self.emojiCount = Int.random(in: 4...8)
    }
}


struct GameTheme {
    var vehicles = ["🚗", "🚛", "🚜", "🚓", "🚕", "🚙", "🚌", "🚎"]
    var animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼"]
    var weather = ["☀️", "🌦", "☁️", "🌧", "❄️", "⚡️", "💨", "🌪"]
}


// view is immutable.
struct CardView: View {
    var content: String
    // uses memory to store var temporarily.
    // only used for ui actions - mid drag, etc.
    @State var isFaceUp: Bool = true
    
    var body : some View {
        ZStack(alignment: .center) {
            let shape = RoundedRectangle(cornerRadius: 25.0)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 5)
                Text(content).font(.largeTitle).foregroundColor(.orange)
                
            } else {
                shape.fill()
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}




















struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
    }
}
