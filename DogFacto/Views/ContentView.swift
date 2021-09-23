//
//  ContentView.swift
//  DogFacto
//
//  Created by Laurynas Kapacinskas on 2021-09-23.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("dogFact") var dogFact: String = "I have no fact for you right now 🙈"
    
    var body: some View {
        ZStack {
            Color(red: 237/255, green: 106/255, blue: 90/255)
                .ignoresSafeArea()
            VStack {
                Text(dogFact)
                Spacer()
                Button(action: fetch, label: {
                    Text("Press to get a doggo fact 🐶")
                        .foregroundColor(.white)
                        .bold()
                        .padding()
                })
                .frame(width: 150, height: 80, alignment: .center)
                .background(Color(red: 155/255, green: 192/255, blue: 188/255))
                .cornerRadius(15)
                .padding(100)
            }
            .padding(100)
        }
    }
    
    func fetch(){
        NetworkManager.shared.getBankList { (result) in
            switch result {
            case .success(let response):
                dogFact = response[0].fact ?? "Something went wrong"
            case .failure(let error):
                print("ERROR: \(error)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
