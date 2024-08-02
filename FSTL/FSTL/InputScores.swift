//
//  InputScores.swift
//  FSTL
//
//  Created by Turaga on 7/17/22.
//

import SwiftUI

struct InputScores: View {
    @State private var winnerOTSText = ""
    @State private var winnerOTSDouble = 0.0
    
    @State private var learnerOTSText = ""
    @State private var learnerOTSDouble = 0.0
    
    @State private var scoreDifferenceText = ""
    @State private var scoreDifferenceInt = 0
    
    @State private var differenceBetweenOTS = 0.0
    @State private var s1Winner = 0.0
    @State private var s2Winner = 0.0
    @State private var s1Learner = 0.0
    @State private var s2Learner = 0.0
    @State private var sWinner = 0.0
    @State private var sLearner = 0.0
    @State private var baseOTSWinner = 0.0
    @State private var baseOTSLearner = 0.0
    @State private var exOTSWinner = 0.0
    @State private var exOTSLearner = 0.0
    @State private var newOTSWinner = 0.0
    @State private var newOTSLearner = 0.0
    @State private var newOTSWinnerRounded = 0.0
    @State private var newOTSLearnerRounded = 0.0
    
    @State private var updatedOtsWinner = 0.0
    @State private var updatedOtsLearner = 0.0
    
    @FocusState private var nameIsFocused: Bool
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    TextField("Winner's OTS", text:$winnerOTSText)
                        .padding(.all)
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(Color.gray)
                        .font(.headline)
                        .keyboardType(.decimalPad)
                        .focused($nameIsFocused)
                    
                    
                    TextField("Learner's OTS", text:$learnerOTSText)
                        .padding(.all)
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(Color.gray)
                        .font(.headline)
                        .keyboardType(.decimalPad)
                        .focused($nameIsFocused)
                    
                    
                    TextField("Difference between scores", text:$scoreDifferenceText)
                        .padding(.all)
                        .background(Color.gray.opacity(0.3).cornerRadius(10))
                        .foregroundColor(Color.gray)
                        .font(.headline)
                        .keyboardType(.decimalPad)
                        .focused($nameIsFocused)
                
                    
                    Spacer()
                        .padding(.bottom)
                    
                    VStack {
                        Button(action: {
                            winnerOTSDouble = Double(winnerOTSText) ?? 0.0
                            learnerOTSDouble = Double(learnerOTSText) ?? 0.0
                            scoreDifferenceInt = Int(scoreDifferenceText) ?? 0
                            
                            differenceBetweenOTS = abs(winnerOTSDouble - learnerOTSDouble)
                            
                            if (winnerOTSDouble > learnerOTSDouble) {
                                
                                if (differenceBetweenOTS > 0 && differenceBetweenOTS < 1) {
                                    s1Winner = -0.5
                                    s1Learner = 6
                                }
                                
                                else if (differenceBetweenOTS > 1.01 && differenceBetweenOTS < 2.01) {
                                    s1Winner = -0.75
                                    s1Learner = 6.5
                                }
                                
                                else if (differenceBetweenOTS > 2.01 && differenceBetweenOTS < 3.01) {
                                    s1Winner = -1
                                    s1Learner = 7
                                }
                                
                                else if (differenceBetweenOTS > 3.01 && differenceBetweenOTS < 4.01) {
                                    s1Winner = -1.5
                                    s1Learner = 7.5
                                }
                                
                                else {
                                    s1Winner = -1.75
                                    s1Learner = 8
                                }
                                
                                let winnerScoreDict:[Int:Double] = [
                                    8: 2.75,
                                    7: 2.50,
                                    6: 2.25,
                                    5: 2.00,
                                    4: 1.75,
                                    3: 1.50,
                                    2: 1.25,
                                    1: 1.00
                                ]
                                
                                let learnerScoreDict:[Int:Double] = [
                                    8: -7.75,
                                    7: -7.50,
                                    6: -7.00,
                                    5: -6.75,
                                    4: -6.50,
                                    3: -6.00,
                                    2: -5.75,
                                    1: -5.50
                                ]
                                
                                s2Winner = winnerScoreDict[scoreDifferenceInt]!
                                s2Learner = learnerScoreDict[scoreDifferenceInt]!
                                
                                
                                sWinner = s1Winner + Double(s2Winner)
                                sLearner = s1Learner + Double(s2Learner)
                                
                                updatedOtsWinner = ((1.2 * sWinner) / 2.68) + winnerOTSDouble
                                updatedOtsLearner = ((1.2 * sLearner) / 2.68) + learnerOTSDouble
                            }
                            
                        
                        
                            else if (winnerOTSDouble < learnerOTSDouble) {
                                
                                differenceBetweenOTS = abs(learnerOTSDouble - winnerOTSDouble)
                                
                                if (differenceBetweenOTS > 0 && differenceBetweenOTS < 1) {
                                    s1Winner = 0
                                    s1Learner = 6
                                }
                                
                                else if (differenceBetweenOTS > 1.01 && differenceBetweenOTS < 2.01) {
                                    s1Winner = 0.5
                                    s1Learner = 5.5
                                }
                                
                                else if (differenceBetweenOTS > 2.01 && differenceBetweenOTS < 3.01) {
                                    s1Winner = 1
                                    s1Learner = 5
                                }
                                
                                else if (differenceBetweenOTS > 3.01 && differenceBetweenOTS < 4.01) {
                                    s1Winner = 1.5
                                    s1Learner = 4.5
                                }
                                
                                else {
                                    s1Winner = 2
                                    s1Learner = 4
                                }
                                
                                let winnerScoreDict:[Int:Double] = [
                                    8: 3.00,
                                    7: 2.75,
                                    6: 2.50,
                                    5: 2.00,
                                    4: 1.75,
                                    3: 1.50,
                                    2: 1.00,
                                    1: 0.75
                                ]
                                
                                let learnerScoreDict:[Int:Double] = [
                                    8: -8.50,
                                    7: -8.00,
                                    6: -7.75,
                                    5: -7.50,
                                    4: -7.00,
                                    3: -6.75,
                                    2: -6.50,
                                    1: -6
                                ]
                                
                                s2Winner = winnerScoreDict[scoreDifferenceInt]!
                                s2Learner = learnerScoreDict[scoreDifferenceInt]!
                                
                                
                                sWinner = s1Winner + Double(s2Winner)
                                sLearner = s1Learner + Double(s2Learner)
                                
                                updatedOtsWinner = ((1.2 * sWinner) / 2.68) + winnerOTSDouble
                                updatedOtsLearner = ((1.2 * sLearner) / 2.68) + learnerOTSDouble
                            }
                            
                            /*exOTSWinner = (1.2 * sWinner) / 3.39 + baseOTSWinner
                            exOTSLearner = (1.2 * sLearner) / 3.39 + baseOTSLearner

                            newOTSWinner = (winnerOTSDouble + exOTSWinner) / 2
                            newOTSLearner = (learnerOTSDouble + exOTSLearner) / 2
                            
                            newOTSWinnerRounded = round(newOTSWinner * 100) / 100.0
                            newOTSLearnerRounded = round(newOTSLearner * 100) / 100.0 */
                            
                            nameIsFocused = false
                            
                        }) {
                            Text("Calculate OTS")
                        }
                        .padding(.all)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .font(.title3)
                        
                        
                        // Text("Winner's OTS is: \(String(newOTSWinnerRounded))")
                        //Label("Learner's OTS is: \(String(newOTSLearnerRounded))")
                        
                        Spacer()
                            .padding(.bottom)
                        
                        Label("Winner's OTS is: \(String(round(updatedOtsWinner * 100) / 100.0))", systemImage: "winnerIcon")
                            .font(.title2)
                        
                        
                        Label("Learner's OTS is: \(String(round(updatedOtsLearner * 100) / 100.0))",
                            systemImage: "learnerOTS")
                            .font(.title2)
                        

                    }
                    
                    Spacer()
                    
                }
                //.navigationTitle("OTS Score Calculations")
            }
        }
        
    }
}

struct InputScores_Previews: PreviewProvider {
    static var previews: some View {
        InputScores()
    }
}
