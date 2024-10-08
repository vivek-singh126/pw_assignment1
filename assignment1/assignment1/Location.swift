import Foundation

struct Location: Identifiable, Codable {
    let id: Int
    let name: String
    let city: String
    let state: String
    var isCompleted: Bool
    let description: String
    let imageName: String
}

