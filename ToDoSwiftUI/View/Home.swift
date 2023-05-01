//
//  Home.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 09.04.2023.
//

import SwiftUI

struct Home: View {
    @ObservedObject var listViewModel = ListViewModel()
    
    var body: some View {
        
        ZStack{
            NavigationView {
                
                ListViewUI()
                    .environmentObject(listViewModel)
                    .navigationTitle("Mission")
            }
                VStack{
                    Spacer()
                    
                    HStack{

                        EditButton()
                            .frame(width: 100.0)
                            .frame(height: 40)
                            .background(.tint)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .font(.headline)
                        
                        Spacer()
                        
                        Button{
                            listViewModel.isShowAddView.toggle()
                        } label: {
                            HStack{
                                Image(systemName: "plus.circle")
                                Text("ADD")
                            }
                            .frame(width: 100.0)
                            .frame(height: 40)
                            .background(.tint)
                            .foregroundColor(.white)
                            .cornerRadius(15)
                            .font(.headline)
                        }
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(10)
                    .padding()
                }
            
                if listViewModel.isShowAddView {
                    AddWordView()
                        .environmentObject(listViewModel)
                }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}





//            if listViewModel.isShowAddView {
//                AddWordView()
//                    .environmentObject(listViewModel)
//            }
