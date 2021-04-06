//
//  DetailCoordinator.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import UIKit
protocol DetailCoordinatorDelegate : class{
}
class DetailCoordinator: Coordinator {
    weak var delegate: DetailCoordinatorDelegate?
    var movie: UpcomingMovies?
    
    var navigationController: UINavigationController
    init(_ nav: UINavigationController) {
        navigationController = nav
    }
    func start() {
        let detailViewController = DeatilViewController.instantiate(StoryBoardName.main)
        let detailViewModel = DetailViewModel()
        detailViewModel.delegate = self
        detailViewController.detailViewModel = detailViewModel
        detailViewController.movie = movie
        navigationController.setNavigationBarHidden(false, animated: false)
        navigationController.pushViewController(detailViewController, animated: false)
    }
}
extension DetailCoordinator: DetailViewModelDelegate{
    
    
}
