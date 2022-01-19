//
//  AddNRemove.swift
//  List
//
//  Created by 장희선 on 2022/01/19.
//

import SwiftUI

struct AddNRemove: View {
    @State private var taskName: String = ""
    @State private var tasks: [String] = []
    
    private func deleteTask(indexSet: IndexSet) {
        indexSet.forEach { index in
            tasks.remove(at: index)
        }
    }
    
    private func moveTask(from source: IndexSet, to destination: Int) {
        tasks.move(fromOffsets: source, toOffset: destination)
    }
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Enter task name", text: $taskName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Add Task") {
                        tasks.append(taskName)
                        taskName = ""
                    }
                }
//                List(tasks, id: \.self) { task in
//                    Text("\(task)")
//
//                }
//                .listStyle(PlainListStyle())
                List {
                    ForEach(tasks, id: \.self) { task in
                        Text(task)
                    }
                    .onDelete(perform: deleteTask)
                    .onMove(perform: moveTask)
                }
                .listRowSeparator(.hidden)
//            .listStyle(PlainListStyle())
                .toolbar {
                    EditButton()
                }
            }
            .padding()
        }
    }
}

struct AddNRemove_Previews: PreviewProvider {
    static var previews: some View {
        AddNRemove()
    }
}
