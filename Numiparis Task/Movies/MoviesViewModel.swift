//
//  MoviesViewModel.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import UIKit
protocol MoviesViewModelDelegate : class{
    
    func DidtaponMove(_ item: UpcomingMovies)
}
class MoviesViewModel: BaseViewModel {
    weak var delegate: MoviesViewModelDelegate?
    
    
    func taponMovie(item: UpcomingMovies){
        delegate?.DidtaponMove(item)
    }
    var networkManager = AlamofireNetworkAdapter.shared
    var bindViewModel:()-> Void = { }
    var upcomingMovies: [UpcomingMovies] = []

    func GetMovies(Url: String?) {
        guard let Url = Url else {
            return
        }
        let authenticationString = Url//Constants.baseURL + Constants.ServiceAPI.UpcomingMovies.rawValue

        guard let url = URL(string: authenticationString) else {
            return
        }
        DispatchQueue.main.async {
            self.startIndicatorHandler()
        }
        networkManager.request(url, method: "GET", parameters: nil, headers: nil) { (result) in
            print(result)
            DispatchQueue.main.async {
            self.stopIndicatorHandler()
            }
            switch result {
            case .success(let value):
                if let json = value as? [String: Any], let outputData = json["results"] as? [[String: Any]] {
                    print(outputData)
                    self.upcomingMovies =  UpcomingMovies.upcomingMovies(outputData)
                    self.bindViewModel()
                }
                print("value")
            case .error(let error):
                print(error)
                
            }
        }
    }
    func isMoviesAvailable() -> Bool {
          return upcomingMovies.count > 0
      }
      func getMovieCount() -> Int {
          return upcomingMovies.count
      }
       func item(at index: Int) -> UpcomingMovies {
             return upcomingMovies[index]
         }
}
