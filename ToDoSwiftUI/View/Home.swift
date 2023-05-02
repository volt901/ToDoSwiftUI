//
//  Home.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 09.04.2023.
//

import SwiftUI
import RealmSwift

struct Home: View {
    
    @ObservedResults(MissionItem.self) var missionItem
    @ObservedObject var listViewModel = ListViewModel()
   
    
    var body: some View {
        
        ZStack{
            NavigationView {
                
                ListViewUI()
                    .environmentObject(listViewModel)
                    .navigationTitle("Mission")
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
