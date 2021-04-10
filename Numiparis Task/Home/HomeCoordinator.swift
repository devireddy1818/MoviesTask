//
//  HomeCoordinator.swift
//  Numiparis Task
//
//  Created by devireddy k on 10/04/21.
//

import UIKit
protocol HomeCoordinatorDelegate : class{
    
}
class HomeCoordinator: Coordinator {
    weak var delegate: HomeCoordinatorDelegate?
    
    var navigationController: UINavigationController
    init(_ nav: UINavigationController) {
        navigationController = nav
    }
    func start() {
        let homeViewController = HomeViewController.instantiate(StoryBoardName.main)
        let homeViewModel = HomeViewModel()
        homeViewModel.delegate = self
        homeViewController.homeViewModel = homeViewModel
        navigationController.setNavigationBarHidden(true, animated: false)
        navigationController.pushViewController(homeViewController, animated: false)
    }
}
extension HomeCoordinator: HomeViewModelDelegate {
}
