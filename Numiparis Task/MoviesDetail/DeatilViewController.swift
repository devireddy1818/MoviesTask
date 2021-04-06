//
//  DeatilViewController.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import UIKit

class DeatilViewController: BaseViewController {
    var detailViewModel: DetailViewModel?
    var movie: UpcomingMovies?
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var OverviewLabel: UILabel!
    @IBOutlet weak var PosterLogo: UIImageView!
    @IBOutlet weak var Posterheight: NSLayoutConstraint!
    @IBOutlet weak var ScrollviewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.TitleLabel.text = "Movie Name: \(movie?.original_title ?? "")"
       
        self.OverviewLabel.text = "Movie Overview: \n\(movie?.overview ?? "")\n\nOriginal Language: \(movie?.original_language ?? "")\n\nAdult : \(movie?.adult ?? false)\n\n Release date: \(movie?.release_date ?? "")\n\nVote average: \(movie?.vote_average ?? 0)\n\nVote count: \(movie?.vote_count ?? 0)"
        
        self.PosterLogo.sd_setImage(with: URL(string: "https://image.tmdb.org/t/p/w500\(movie?.poster_path ?? "")"), placeholderImage: nil, options: [], completed: { (theImage, error, cache, url) in
            
            self.Posterheight.constant = self.getAspectRatioAccordingToiPhones(cellImageFrame: self.PosterLogo.frame.size,downloadedImage: theImage ?? #imageLiteral(resourceName: "Rectangle 84"))
            let font = UIFont(name: "Helvetica", size: 15.0)

            let height = self.heightForView(text: self.OverviewLabel.text ?? "", font: font!, width: self.view.bounds.size.width)

            self.ScrollviewHeight.constant = self.Posterheight.constant + height + 150
            

                })
    }
   
   
}
extension UIViewController {
    func getAspectRatioAccordingToiPhones(cellImageFrame:CGSize,downloadedImage: UIImage)->CGFloat {
           let widthOffset = downloadedImage.size.width - cellImageFrame.width
           let widthOffsetPercentage = (widthOffset*100)/downloadedImage.size.width
           let heightOffset = (widthOffsetPercentage * downloadedImage.size.height)/100
           let effectiveHeight = downloadedImage.size.height - heightOffset
           return(effectiveHeight)
       }
    func heightForView(text:String, font:UIFont, width:CGFloat) -> CGFloat{
        let label:UILabel = UILabel(frame: CGRect(x: 0, y: 0, width: width, height: CGFloat.greatestFiniteMagnitude))
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.font = font
        label.text = text
        label.sizeToFit()

        return label.frame.height
    }
}
