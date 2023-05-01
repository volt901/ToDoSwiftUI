//
//  SwiftUIView.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 30.04.2023.
//

import SwiftUI
import RealmSwift

struct SwiftUIView: View {
    @ObservedResults(TaskModel.self) var persons
    @State var name = ""
    
    var body: some View {
        List {
            ForEach(persons) { person in
                
                TextField("name", text: $name)
            }
            .onDelete(perform: $persons.remove)
        }.navigationBarItems(trailing:
            Button("Add") {
                $persons.append(TaskModel())
            }
        )
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
