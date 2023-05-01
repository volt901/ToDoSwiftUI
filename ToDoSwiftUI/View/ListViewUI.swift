//
//  ListViewUI.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 01.05.2023.
//

import SwiftUI
import RealmSwift

struct ListViewUI: View {
    @EnvironmentObject var listViewModel:ListViewModel
    
    @ObservedResults(MissionItem.self) var missionItem
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)){
            List{
                ForEach(missionItem, id: \.id){ item in
                    Text (item.titleMission)
                }
            }
        }
    }
}
struct ListViewUI_Previews: PreviewProvider {
    static var previews: some View {
       ListViewUI()
    }
}
