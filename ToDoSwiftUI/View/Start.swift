//
//  Start.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 30.04.2023.
//

import SwiftUI

struct Start: View {
    @ObservedObject var listViewModel = ListViewModel()
    var body: some View {
        TabView{
                Home()
                .tabItem{
                    Image(systemName: "list.clipboard")
                }
           AddTaskView()
                .tabItem{
                    Image(systemName: "pencil.line")
                }
            Text("control")
                .tabItem{
                    Image(systemName: "clock")
                }
            
        }
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
            Start()
    }
}
