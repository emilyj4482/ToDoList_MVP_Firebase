//
//  +NotificationCenter.swift
//  ToDoList_MVP_FireBase
//
//  Created by EMILY on 2023/10/20.
//

import Foundation

extension Notification {
    static let reloadMainView = Notification.Name("reloadMainView")
    static let reloadTodoView = Notification.Name("reloadTodoView")
}
