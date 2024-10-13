import CoreRecipesDomain
import Kingfisher
import SwiftUI

public struct RecipeListView: View {
    @StateObject var viewModel = RecipeListViewModel()
    
    public init() {
        
    }
    
    public var body: some View {
        NavigationStack {
            List(viewModel.recipes, id: \.uuid) { recipe in
                HStack {
                    createRecipeImage(recipe.photoUrlSmall)
                    createRecipeDetailsSection(from: recipe)
                }
            }
            .navigationTitle("Recipes")
        }
    }
    
    func createRecipeImage(_ urlString: String) -> some View {
        KFImage(URL(string: urlString))
            .resizable()
            .frame(width: 50, height: 50)
            .background(Color.gray)
    }
    
    func createRecipeDetailsSection(from recipe: Recipe) -> some View {
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
