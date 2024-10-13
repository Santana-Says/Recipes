import CoreRecipesDomain
import Kingfisher
import SwiftUI

public struct RecipeListView: View {
    @StateObject private var viewModel = RecipeListViewModel()
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationStack {
            VStack {
                createSourceDataPicker()
                
                List(viewModel.recipes, id: \.uuid) { recipe in
                    HStack {
                        createRecipeImage(recipe.photoUrlSmall)
                        createRecipeDetailsSection(from: recipe)
                    }
                }
            }
            .navigationTitle("Recipes")
        }
    }
    
    private func createSourceDataPicker() -> some View {
        HStack {
            Text("Select data source:")
            
            Spacer()
            
            Picker("", selection: $viewModel.sourceData) {
                ForEach(RecipeSourceDataType.allCases.reversed(), id: \.rawValue) { value in
                    Text(value.rawValue.capitalized).tag(value)
                }
            }
        }
        .padding(.horizontal)
    }
    
    private func createRecipeImage(_ urlString: String) -> some View {
        KFImage(URL(string: urlString))
            .resizable()
            .frame(width: 50, height: 50)
            .background(Color.gray)
    }
    
    private func createRecipeDetailsSection(from recipe: Recipe) -> some View {
        VStack(alignment: .leading) {
            Text(recipe.name)
                .font(.headline)
            Text(recipe.cuisine)
                .font(.subheadline)
        }
    }
}

#Preview {
    RecipeListView()
}
