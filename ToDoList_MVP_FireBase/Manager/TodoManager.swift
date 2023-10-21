//
//  TodoManager.swift
//  ToDoList_MVP_FireBase
//
//  Created by EMILY on 2023/10/17.
//

import Foundation

final class TodoManager {
    
    static let shared = TodoManager()
    
    private let fm = FirebaseManager()
    
    // List.id 저장용 프로퍼티
    var lastListId: Int = 1
    
    var lists: [List] = []
    
    var list: List?
    
    private func createList(_ name: String) -> List {
        let nextId = lastListId + 1
        lastListId = nextId
        
        return List(id: nextId, name: name, tasks: [])
    }
    
    func addList(_ name: String) {
        let list = createList(name)
        lists.append(list)
        fm.addList(lists)
    }
    
    func updateList(_ name: String) {
        if let index = lists.firstIndex(where: { $0.id == list?.id }) {
            lists[index].update(name: name)
        }
    }
}
