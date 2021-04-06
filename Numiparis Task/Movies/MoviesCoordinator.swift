//
//  MoviesCoordinator.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import UIKit
protocol MoviesCoordinatorDelegate : class{
}
class MoviesCoordinator: Coordinator {
    weak var delegate: MoviesCoordinatorDelegate?
    var detailCoordinator : DetailCoordinator?
    
    var navigationController: UINavigationController
    init(_ nav: UINavigationController) {
        navigationController = nav
    }
    func start() {
        let moviesViewController = MoviesViewController.instantiate(StoryBoardName.main)
        let moviesViewModel = MoviesViewModel()
        moviesViewModel.delegate = self
        moviesViewController.moviesViewModel = moviesViewModel
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(moviesViewController, animated: false)
    }
}
extension MoviesCoordinator: MoviesViewModelDelegate {
    func DidtaponMove(_ item: UpcomingMovies) {
        detailCoordinator = DetailCoordinator(navigationController)
        detailCoordinator?.movie = item
        detailCoordinator?.delegate = self
        detailCoordinator?.start()
    }
    
    
    
}
extension MoviesCoordinator: DetailCoordinatorDelegate{
    
}
