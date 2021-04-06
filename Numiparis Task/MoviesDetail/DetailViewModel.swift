//
//  DetailViewModel.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import UIKit
protocol DetailViewModelDelegate : class{
}
class DetailViewModel: BaseViewModel {
    weak var delegate: DetailViewModelDelegate?
    
}
