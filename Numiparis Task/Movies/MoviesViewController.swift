//
//  MoviesViewController.swift
//  Numiparis Task
//
//  Created by devireddy k on 06/04/21.
//

import UIKit

class MoviesViewController: BaseViewController {
    @IBOutlet weak var MoviesTableview: UITableView!
    var moviesViewModel: MoviesViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.bindViewModel()
        self.moviesViewModel?.GetMovies(Url: "https:api.themoviedb.org/3/movie/upcoming?api_key=8239d26e702a57d00bf72caa4d065d47&language=en-US&page=1")

    }
    @IBAction func TabsTappped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.moviesViewModel?.GetMovies(Url: "https:api.themoviedb.org/3/movie/upcoming?api_key=8239d26e702a57d00bf72caa4d065d47&language=en-US&page=1")
        case 1:
            self.moviesViewModel?.GetMovies(Url: "https://api.themoviedb.org/3/movie/top_rated?api_key=8239d26e702a57d00bf72caa4d065d47&language=en-US&page=1")
        default:
            break
        }
    }
    

    func bindViewModel() {
        self.moviesViewModel?.bindViewModel = { [unowned self] in
           if self.moviesViewModel?.isMoviesAvailable() ?? false {
            self.MoviesTableview.reloadData()
           }else{
            
           }
       }
        self.moviesViewModel?.startIndicatorHandler = { [weak self] in
               self?.startIndicator()
           }
        self.moviesViewModel?.stopIndicatorHandler = { [weak self] in
               self?.stopIndicator()
           }
       }


}
extension MoviesViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.moviesViewModel?.getMovieCount() ?? 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell")as! MoviesTableViewCell
        if let item = self.moviesViewModel?.item(at: indexPath.item){
            cell.UpdateMovieUI(item: item)

        }
        
        return cell
    }
    
}
extension MoviesViewController : UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let item = self.moviesViewModel?.item(at: indexPath.item){
        self.moviesViewModel?.taponMovie(item: item)
        }
    }
}
