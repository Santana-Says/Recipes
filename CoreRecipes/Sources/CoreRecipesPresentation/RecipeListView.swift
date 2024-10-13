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
                
                if !viewModel.recipes.isEmpty {
                    List(viewModel.recipes, id: \.uuid) { recipe in
                        HStack {
                            createRecipeImage(recipe.photoUrlSmall)
                            createRecipeDetailsSection(from: recipe)
                        }
                    }
                } else {
                    Spacer()
                    createEmptyRecipesView()
                    Spacer()
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
    
    private func createEmptyRecipesView() -> some View {
        if viewModel.sourceData == .malformed {
            Text("An error occured loading data. Please select an alternative source")
        } else {
            Text("Did not find any recipes to display")
        }
    }
}

#Preview {
    RecipeListView()
}
