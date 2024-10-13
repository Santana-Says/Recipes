import Foundation

public struct Recipe: Decodable {
    public let cuisine: String
    public let name: String
    public let photoUrlLarge: String
    public let photoUrlSmall: String
    public let sourceUrl: String?
    public let uuid: String
    public let youtubeUrl: String?
    
    public init(cuisine: String, name: String, photoUrlLarge: String, photoUrlSmall: String, sourceUrl: String?, uuid: String, youtubeUrl: String?) {
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.uuid = uuid
        self.youtubeUrl = youtubeUrl
    }
}
