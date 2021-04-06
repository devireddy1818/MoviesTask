//
//  MoviesTableViewCell.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import UIKit
import SDWebImage
class MoviesTableViewCell: UITableViewCell {
    @IBOutlet weak var Logo: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    
    @IBOutlet weak var PosterHeight: NSLayoutConstraint!
   
    
    func UpdateMovieUI(item: UpcomingMovies){
        self.TitleLabel.text = item.original_title
        self.Logo.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(item.backdrop_path ?? "")"))

    }

   

}
