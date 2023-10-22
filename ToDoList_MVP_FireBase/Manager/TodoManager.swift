//
//  TodoManager.swift
//  ToDoList_MVP_FireBase
//
//  Created by EMILY on 2023/10/17.
//

import Foundation
import Firebase

final class TodoManager {
    
    static let shared = TodoManager()
    
    var lastListId: Int = 1     // List.id 저장용 프로퍼티
    var lists: [List] = []
    var list: List?
    
    private let db = Database.database().reference()
    
    // firebase realtime database에 저장
    private func saveData() {
        let data = lists.map { $0.toDictionary }
        db.setValue(data)
    }
    
    private func createList(_ name: String) -> List {
        let nextId = lastListId + 1
        lastListId = nextId
        
        return List(id: nextId, name: name, tasks: [])
    }
    
    func addList(_ name: String) {
        let list = createList(name)
        lists.append(list)
        saveData()
    }
    
    func updateList(_ name: String) {
        if let index = lists.firstIndex(where: { $0.id == list?.id }) {
            lists[index].update(name: name)
        }
        saveData()
    }
    
    private func createTask(_ title: String, listId: Int) -> Task {
        return Task(listId: listId, title: title, isDone: false, isImportant: false)
    }
    
    func addTask(_ title: String) {
        if var list = list,
//            var tasks = list.tasks,
           let index = lists.firstIndex(where: { $0.id == list.id }) {
            let task = Task(listId: list.id, title: title, isDone: false, isImportant: false)
            
            // tasks.append(task)
            // lists[index].tasks = tasks
            // list.tasks = tasks

            print(lists[index].tasks)
        }
    }
}
