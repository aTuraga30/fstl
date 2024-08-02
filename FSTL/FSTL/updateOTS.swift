//
//  updateOTS.swift
//  FSTL
//
//  Created by Turaga on 7/17/22.
//

import SwiftUI
import Alamofire
import SwiftyJSON

struct updateOTS: View {
    @State private var testString = "0"
    @State private var testPlayer = ""
    @State private var testOTS = 0.00
    @State private var testOTSString = ""
    @State private var indexNum = 0
    @State private var currentOTS = 0.00
    @State private var idString = ""
    @State private var warning = ""
    
    @FocusState private var nameIsFocused: Bool

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()
                
                TextField("Enter player whose OTS you want to change ", text:$testPlayer)
                    .padding(.all)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(Color.gray)
                    .font(.headline)
                    .keyboardType(.default)
                    .autocapitalization(.none)
                    .focused($nameIsFocused)
                
                TextField("Enter the new OTS ", text: $testOTSString)
                    .padding(.all)
                    .background(Color.gray.opacity(0.3).cornerRadius(10))
                    .foregroundColor(Color.gray)
                    .font(.headline)
                    .keyboardType(.alphabet)
                    .focused($nameIsFocused)
                
                Spacer()
                    .padding(.bottom)
                
                VStack {
                    Button(action: {
                        AF.request("https://playersdatabase.herokuapp.com/").responseJSON {
                            response in switch response.result {
                            case .success(let value):
                                let json = JSON(value)
                                let jsonLength = json.count
                                
                                for indexNumber in 0...jsonLength {
                                    if testPlayer == json[indexNumber]["player"].string {
                                        testPlayer = testPlayer
                                        indexNum = indexNumber
                                    }
                                }
                                
                                currentOTS = json[indexNum]["OTS"].double!
                                idString = json[indexNum]["_id"].string!
                                
                            case .failure(let error):
                                print(error)
                                
                            }
                        }
                        
                        testOTS = Double(testOTSString)!
                        
                        let parameters: [String: Any] = [
                            "player" : "\(testPlayer)",
                            "OTS": testOTS
                        ]
                        
                        AF.request("https://playersdatabase.herokuapp.com/updateOTS/\(idString)", method: .patch, parameters: parameters, encoding: JSONEncoding.default)
                            .responseJSON { response in
                                print(response)
                            }
                        nameIsFocused = false
                        
                    }, label: {
                        Text("Update OTS")
                    })
                        .padding(.all)
                        .background(Color.blue)
                        .foregroundColor(Color.white)
                        .cornerRadius(8)
                        .font(.title3)
                    
                    Spacer()
                        .padding(.bottom)
                }
                
                Spacer()
                Spacer()
            }
            //.padding(.all)
            //.navigationTitle("Update OTS Scores")
            
            Spacer()
        }
    }
}

struct updateOTS_Previews: PreviewProvider {
    static var previews: some View {
        updateOTS()
    }
}
