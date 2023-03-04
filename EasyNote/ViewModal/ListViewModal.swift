//
//  ListViewModal.swift
//  EasyNote
//
//  Created by Erdem Özbaykuş on 2.04.2023.
//

import Foundation

class ListViewModal: ObservableObject {
    
    
    @Published var items: [itemModal] = []{
        didSet{
            saveItem()
        }
    }
    let itemsKey: String = "items_list"

    init() {
        getItems()
    }
    
    func getItems(){
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([itemModal].self, from: data)
        else {return}
        
        self.items = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = itemModal(title: title, isDone: false)
        items.append(newItem)
    }

    func updateItem(item: itemModal){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.updateCompletion()
        }
    }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
    }

