//
//  MoviesModel.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import Foundation
struct UpcomingMovies {
    
    var adult: Bool?
    var backdrop_path: String?
    var id: NSNumber?
    var original_language: String?
    var original_title: String?
    var overview: String?
    var popularity : String?
    var poster_path :String?
    var release_date: String?
    var title: String?
    var video: Bool?
    var vote_average: NSNumber?
    var vote_count: NSNumber?

    
    init(_ json: [String: Any]) {
        let adult = json["adult"] as? Bool
        let backdrop_path = json["backdrop_path"] as? String
        let id = json["id"] as? NSNumber
        let original_language = json["original_language"]as? String
        let original_title = json["original_title"]as? String
        let overview = json["overview"]as? String
        let popularity = json["popularity"]as? String
        let poster_path = json["poster_path"]as? String
        let release_date = json["release_date"]as? String
        let title = json["title"]as? String
        let video = json["video"]as? Bool
        let vote_average = json ["vote_average"]as? NSNumber
        let vote_count = json["vote_count"]as? NSNumber
        
        
        self.adult = adult
        self.backdrop_path = backdrop_path
        self.id = id
        self.original_language = original_language
        self.original_title = original_title
        self.overview = overview
        self.popularity = popularity
        self.poster_path = poster_path
        self.release_date = release_date
        self.title = title
        self.video = video
        self.vote_average = vote_average
        self.vote_count = vote_count
        
        
    }
    static func upcomingMovies(_ json: [[String: Any]]) -> [UpcomingMovies] {
        return json.map { UpcomingMovies($0)}
    }
}
