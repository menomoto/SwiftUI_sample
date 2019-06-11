import SwiftUI

struct Item : Hashable, Codable, Identifiable {
    var id: Int
    let image: String
    let title: String
    let price: Int
}

let items: [Item] = [
    Item(id: 1, image: "11", title: "Item01", price: 12000),
    Item(id: 2, image: "12", title: "Item02", price: 16000),
    Item(id: 3, image: "13", title: "Item03", price: 35000),
    Item(id: 4, image: "14", title: "Item04", price: 29800),
    Item(id: 5, image: "15", title: "Item05", price: 79800),
    Item(id: 6, image: "21", title: "Item21", price: 12000),
    Item(id: 7, image: "22", title: "Item22", price: 16000),
    Item(id: 8, image: "23", title: "Item23", price: 35000),
    Item(id: 9, image: "24", title: "Item24", price: 29800),
    Item(id:10, image: "25", title: "Item25", price: 79800),
    Item(id:11, image: "31", title: "Item31", price: 12000),
    Item(id:12, image: "32", title: "Item32", price: 16000),
    Item(id:13, image: "33", title: "Item33", price: 35000),
    Item(id:14, image: "34", title: "Item34", price: 29800),
    Item(id:15, image: "35", title: "Item35", price: 79800),
]
