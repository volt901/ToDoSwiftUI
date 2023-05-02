//
//  ListViewUI.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 01.05.2023.
//

import SwiftUI
import RealmSwift

struct ListViewUI: View {
   
    
    @State var showAlert = false
    @State var addMission = ""
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    @ObservedResults(MissionItem.self) var missionItem

    var body: some View {
        VStack{
            List{
                ForEach(missionItem, id: \.id){ item in
                    Text (item.titleMission)
                }
                .onDelete(perform: $missionItem.remove)
            }
            
            HStack{
                VStack(alignment: .leading)  {
                    TextField("Mission", text: $addMission)
                        .frame(height: 40)
                        .padding(.horizontal)
                        .background(.gray.opacity(0.4))
                        .cornerRadius(15)
                }
                Spacer()
                
                Button {
                    if addMission.count == 0 ||
                        $0.titleMission.contains(addMission){
                        showAlert.toggle()
                    } else {
                        let mission = MissionItem()
                        mission.titleMission = addMission
                        $missionItem.append(mission)
                        withAnimation {
                            listViewModel.isShowAddView.toggle()
                        }
                    }
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
            .padding(.horizontal)
            .background(.white)
            .cornerRadius(10)
            .alert(Text("Error"), isPresented: $showAlert) {
                //
            }
        }
    }
}
struct ListViewUI_Previews: PreviewProvider {
    static var previews: some View {
       //ListViewUI()
        Home()
    }
}
