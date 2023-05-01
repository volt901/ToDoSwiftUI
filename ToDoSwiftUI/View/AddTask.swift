//
//  AddTask.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 09.04.2023.
//
import SwiftUI
import RealmSwift

struct AddWordView: View {
    
    @State var addMission = ""
    
    @State var showAlert = false
    @ObservedResults(MissionItem.self) var missionItem
    
    @EnvironmentObject var listViewModel:ListViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Text("New word")
                    .font(.system(size: 20, weight: .bold))
                Spacer()
               
                Button{
                    listViewModel.isShowAddView.toggle()
                }label: {
                    Image(systemName: "xmark")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .foregroundColor(.black)
                    
                }
            }
            .padding(.leading,20)
            
            VStack(alignment: .leading)  {
                TextField("Mission", text: $addMission)
                    .padding()
                    .background(.gray.opacity(0.4))
                    .cornerRadius(15)
            }
            Button{
                if addMission.count == 0  {
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
                Text("SAVE")
                    .foregroundColor(.white)
            }
            .padding(.horizontal,30)
            .padding(.vertical)
            .frame(maxWidth: .infinity)
            .background(.green)
            .cornerRadius(15)
            .alert(Text("Empty fields"), isPresented: $showAlert) {
                //
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .padding(.vertical,30)
        .padding()
        .ignoresSafeArea(.all)
        .background(.white)
    }
}

struct AddWorldView_Previews: PreviewProvider {
    static var previews: some View {
        AddWordView()
    }
}

