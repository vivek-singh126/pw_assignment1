import Foundation
import SwiftUI

class LocationViewModel: ObservableObject {
    @Published var locations: [Location] = []

    init() {
        loadLocations()
    }

    func loadLocations() {
        guard let url = Bundle.main.url(forResource: "locations", withExtension: "json") else {
            print("JSON file not found")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            self.locations = try decoder.decode([Location].self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

