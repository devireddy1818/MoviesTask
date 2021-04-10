//
//  HomeViewModel.swift
//  Numiparis Task
//
//  Created by devireddy k on 10/04/21.
//

import UIKit
protocol HomeViewModelDelegate : class{
    
}
class HomeViewModel: BaseViewModel {
    weak var delegate: HomeViewModelDelegate?
    
}
