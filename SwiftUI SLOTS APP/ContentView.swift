//
//  ContentView.swift
//  SwiftUI SLOTS APP
//
//  Created by Jiwoo Ban on 2020/05/14.
//  Copyright © 2020 Jiwoo Ban. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    private var symbols = ["star", "apple", "cherry"]
    @State private var numbers = [1, 2, 0]
    @State private var credits = 1000
    private var betAmount = 10
    @State private var backgrounds = [Color.white, Color.white, Color.white]
    @State private var longPressed = false
    
    var body: some View {
        
        ZStack {
            
            Rectangle()
                .foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(.all)
            
            Rectangle()
                .foregroundColor(Color(red: 228/225, green: 195/255, blue: 76/255 ))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                
                Spacer()
                
                //Title
                HStack {
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                    Text("J&D Slots")
                    .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                }.scaleEffect(2)
                
                
                Spacer()
                //Credits counter
                Text("Credits: " + String(credits))
                    .foregroundColor(.black)
                    .padding(.all, 10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                HStack {
                    Spacer()
                    
                    Image(symbols[numbers[0]])
                    .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(backgrounds[0].opacity(0.5))
                    .cornerRadius(20)
                    
                    Image(symbols[numbers[1]])
                    .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(backgrounds[1].opacity(0.5))
                    .cornerRadius(20)
                    
                    Image(symbols[numbers[2]])
                    .resizable()
                        .aspectRatio(1, contentMode: .fit)
                        .background(backgrounds[2].opacity(0.5))
                    .cornerRadius(20)
                    
                    Spacer()
                }
                
                Spacer()
                
                
                VStack {
                    
                        Button(action: {
                            
                            //Set backgrounds back to white
                            self.backgrounds[0] = Color.white
                            self.backgrounds[1] = Color.white
                            self.backgrounds[2] = Color.white
                            
                            //Change the images
                            self.numbers[0] = Int.random(in: 0...self.symbols.count - 1)
                            self.numbers[1] = Int.random(in: 0...self.symbols.count - 1)
                            self.numbers[2] = Int.random(in: 0...self.symbols.count - 1)
                            
                            //Check winnings
                            if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                                //won
                                self.credits += self.betAmount * 10
                                
                                //Update backgrounds to green
                                self.backgrounds[0] = Color.green
                                self.backgrounds[1] = Color.green
                                self.backgrounds[2] = Color.green
                                
                            }
                            else {
                                self.credits -= self.betAmount
                            }
                            
                            
                            
                        }) {
                            Text("Spin")
                            .bold()
                                .foregroundColor(.white)
                                .padding(.all, 10)
                                .padding([.leading, .trailing], 30)          .background(Color.pink)
                                .cornerRadius(20)

                        }
                        
                        
                    
                        Text("\(betAmount) credits").padding(.top, 10)
                            .font(.footnote)
                    
                    
                        Button(action: {
                            
                            //Set backgrounds back to white
                            self.backgrounds[0] = Color.white
                            self.backgrounds[1] = Color.white
                            self.backgrounds[2] = Color.white
                            
                            //Change the images
                            self.numbers[0] = self.numbers[1]
                            self.numbers[1] = self.numbers[1]
                            self.numbers[2] = self.numbers[1]
                            
                            //Check winnings
                            if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                                //won
                                self.credits += self.betAmount * 10
                                
                                //Update backgrounds to green
                                self.backgrounds[0] = Color.green
                                self.backgrounds[1] = Color.green
                                self.backgrounds[2] = Color.green
                                
                            }
                            else {
                                self.credits -= self.betAmount
                            }
                            
                            
                            
                        }) {
                            Text("Hidden")
                                .foregroundColor(.clear)
                                .padding(.top, 0.5)

                        }
                }
                

            
                
                Spacer()

            }
            
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
