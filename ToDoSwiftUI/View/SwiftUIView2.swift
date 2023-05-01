//
//  SwiftUIView2.swift
//  ToDoSwiftUI
//
//  Created by Владимир Ширяев on 30.04.2023.
//

import SwiftUI
import RealmSwift

struct SwiftUIView2: View {
    @ObservedResults(Person.self) var persons
    @State var name2 = ""
    
    var body: some View {
        List {
            ForEach(persons) { person in
                
                TextField("name", text: $name2)
            }
            .onDelete(perform: $persons.remove)
        }.navigationBarItems(trailing:
            Button("Add") {
                $persons.append(Person())
            }
        )
    }
}

struct SwiftUIView2_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView2()
    }
}
