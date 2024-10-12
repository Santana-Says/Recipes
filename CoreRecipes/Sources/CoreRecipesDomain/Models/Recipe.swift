import Foundation

public struct Recipe: Decodable {
    public let cuisine: String
    public let name: String
    public let photoUrlLarge: URL
    public let photoUrlSmall: URL
    public let sourceUrl: URL?
    public let uuid: String
    public let youtubeUrl: URL?
}
