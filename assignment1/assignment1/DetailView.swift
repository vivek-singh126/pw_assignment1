import SwiftUI

struct DetailView: View {
    @Binding var location: Location // Use binding to reflect changes

    var body: some View {
        VStack {
            Image(location.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)

            Text(location.name)
                .font(.largeTitle)
                .padding()

            Text("\(location.city), \(location.state)")
                .font(.subheadline)
                .foregroundColor(.gray)

            Text(location.description)
                .padding()

            Button(action: {
                // Update the completion state
                location.isCompleted.toggle()
            }) {
                Text(location.isCompleted ? "Mark as Incomplete" : "Mark as Completed")
                    .padding()
                    .background(location.isCompleted ? Color.red : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding()
        }
        .navigationTitle(location.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

