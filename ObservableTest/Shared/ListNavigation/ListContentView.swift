//
//  ListContentView.swift
//  ObservableTest (iOS)
//
//  Created by 장희선 on 2022/01/07.
//

import SwiftUI

struct ListContentView: View {
    
    @State var toggleStatus = true
    
    var listData: [ToDoItem] = [
        ToDoItem(task: "Wash the car", imageName: "trash.circle.fill"),
        ToDoItem(task: "Vacuume house", imageName: "person.2.fill"),
        ToDoItem(task: "Pick up kids frome school bus @ 3pm", imageName: "car.fill")
    ]
    var body: some View {
        
        
        List {
            Section {
                Toggle(isOn: $toggleStatus) {
                    Text("Allow Notification")
                }
            } header: {
                Text("Settings")
            }
            
            Section {
                ForEach (listData) { item in
                    HStack {
                        Image(systemName: item.imageName)
                        Text(item.task)
                    }
                }
            } header: {
                Text("To Do Task")
            }
        }
        .navigationTitle(Text("To Do List"))
        .toolbar {
            ToolbarItem(
                placement: .navigationBarTrailing) {
                    Button {
                        print("Text")
                    } label: {
                        Text("Add")
                    }

                }
        }
    }
}

struct ListContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListContentView()
    }
}
