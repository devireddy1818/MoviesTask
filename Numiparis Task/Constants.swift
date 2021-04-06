//
//  Constants.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import Foundation
struct Constants {
    static var baseURL = "https://developers.themoviedb.org/3/movie/"

    enum ServiceAPI: String {
        case UpcomingMovies = "upcoming?api_key=8239d26e702a57d00bf72caa4d065d47&language=en-US&page=1"
        case TopratedMovies = "get-top-rated-movies"

        

    }
    
}





