import SwiftUI

struct ListingView: View {
    @StateObject var viewModel = LocationViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.locations.indices, id: \.self) { index in
                    NavigationLink(destination: DetailView(location: $viewModel.locations[index])) {
                        HStack {
                            Image(viewModel.locations[index].imageName)
                                .resizable()
                                .frame(width: 50, height: 50)
                            
                            VStack(alignment: .leading) {
                                Text(viewModel.locations[index].name)
                                    .font(.headline)
                            }
                            
                            Spacer()
                            
                            // Star icon based on completion state
                            Image(systemName: viewModel.locations[index].isCompleted ? "star.fill" : "star")
                                .foregroundColor(viewModel.locations[index].isCompleted ? .yellow : .gray)
                                .padding(.trailing) // Optional padding for spacing
                        }
                        .padding(.vertical, 8) // Optional vertical padding for list items
                    }
                }
            }
            .navigationTitle("Locations")
        }
    }
}

