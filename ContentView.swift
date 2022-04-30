//
//  ContentView.swift
//  Yahtzee
//
//  Created by Tyler Hilgeman on 4/27/22.
//

import SwiftUI

struct ContentView: View {
    
    // Die values
    @State var isSelected = Array(repeating: false, count: 5)
    @State var dieVals:[Int] = [Int.random(in: 1...6), Int.random(in: 1...6), Int.random(in: 1...6), Int.random(in: 1...6), Int.random(in: 1...6)]
    
    // Game management
    @State var rollsLeft:Int = 3
    @State var turnsLeft:Int = 13
    @State var savedVals:[Int] = []
    
    
    @State var lockedVals:String = ""
    
    
    
    struct Category:Identifiable, Hashable {
        let id = UUID()
        let name:String
        let section:String
        let score:Int
    }
    
    @State var upperCategories = [
        Category(name: "Aces", section: "Upper", score: 0),
        Category(name: "Twos", section: "Upper", score: 0),
        Category(name: "Threes", section: "Upper", score: 0),
        Category(name: "Fours", section: "Upper", score: 0),
        Category(name: "Fives", section: "Upper", score: 0),
        Category(name: "Sixes", section: "Upper", score: 0)
    ]
    @State var upperScore:Int = 0;
    let bonus:Int = 35;
    @State var bonusPoints:Int = 0;
    
    @State var lowerCategories = [
        Category(name: "3 of a kind", section: "Lower", score: 0),
        Category(name: "4 of a kind", section: "Lower", score: 0),
        Category(name: "Full House", section: "Lower", score: 0),
        Category(name: "Sm. Straight", section: "Lower", score: 0),
        Category(name: "Lg. Straight", section: "Lower", score: 0),
        Category(name: "Yahtzee", section: "Lower", score: 0),
        Category(name: "Chance", section: "Lower", score: 0)
    ]
    @State var lowerScore:Int = 0;
    
    @State var totalScore:Int = 0;
    
    
    var body: some View {
        ScrollView {
            VStack {
                
                Image("logo-black")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                Text(String(turnsLeft) + " turns left")
                    .font(.title2)
                    .padding(.top, -20.0)
                
                Text(lockedVals)
                HStack {
                    Button(action: {
                        isSelected[0].toggle();
                    }, label: {
                        Image(systemName: "die.face.\(dieVals[0])")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(isSelected[0] ? Color.red : Color.black)
                    })
                    Button(action: {
                        isSelected[1].toggle();
                    }, label: {
                        Image(systemName: "die.face.\(dieVals[1])")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(isSelected[1] ? Color.red : Color.black)
                    })
                    Button(action: {
                        isSelected[2].toggle();
                    }, label: {
                        Image(systemName: "die.face.\(dieVals[2])")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(isSelected[2] ? Color.red : Color.black)
                    })
                    Button(action: {
                        isSelected[3].toggle();
                    }, label: {
                        Image(systemName: "die.face.\(dieVals[3])")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(isSelected[3] ? Color.red : Color.black)
                    })
                    Button(action: {
                        isSelected[4].toggle();
                    }, label: {
                        Image(systemName: "die.face.\(dieVals[4])")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .foregroundColor(isSelected[4] ? Color.red : Color.black)
                    })
                }
                
                // Roll Button
                Button(action: {
                    savedVals.removeAll()
                    lockedVals.removeAll()
                    for n in 0...4 {
                        if(isSelected[n]) {
                            savedVals.append(dieVals[n])
                            lockedVals.append(String(dieVals[n]))
                        } else {
                            dieVals[n] = Int.random(in: 1...6)
                        }
                    }
                },
                       label: {
                    VStack {
                        HStack {
                            Image(systemName: "dice.fill")
                            Text("Roll")
                                .font(.title3)
                                .fontWeight(.bold)
                            Image(systemName: "dice.fill")
                                
                        }
                        
                        Text(String(rollsLeft) + " rolls left")
                            .font(.headline)
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .background(.red)
                    .cornerRadius(10)
                    
                })
                
                
                VStack {

                    List {
                        Section(header: Text("Upper Section").font(.headline).fontWeight(.bold)) {
                            ForEach(upperCategories, id: \.self) { element in
                                Text(element.name)
                            }
                        }
                    }.frame(height: 330).listStyle(.grouped)
                    Text("Bonus if score is 63 or over: " + String(upperScore))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    
                    Text("Upper Total: " + String(upperScore))
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)
                    
                    List {
                        Section(header: Text("Lower Section").font(.headline).fontWeight(.bold)) {
                            ForEach(lowerCategories, id: \.self) { element in
                                Text(element.name)
                            }
                        }
                    }.frame(height: 400).listStyle(.grouped)
                    
                }
                
            }
        }
        
        
        
       
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
