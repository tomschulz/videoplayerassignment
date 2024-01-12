//  VideoModel.swift Created by Tom on 2024-01-12.
import Foundation

struct VideoModel: Codable, Identifiable {
    let id: String
    let title: String
    let hlsURL: String
    let fullURL: String
    let description: String
    let publishedAt: String
    let author: AuthorModel
}
