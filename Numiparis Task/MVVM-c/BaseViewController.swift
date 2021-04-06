
import UIKit

typealias AlertHandler = (_ alertAction:UIAlertAction) -> ()
class BaseViewController: UIViewController, StoryBoard {
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    lazy var activityIndicagtorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.hidesWhenStopped = true
        activityIndicatorView.center = CGPoint(x: view.bounds.size.width/2, y: view.bounds.size.height/2)
        activityIndicatorView.style = UIActivityIndicatorView.Style.large
        activityIndicatorView.color = UIColor.green

        return activityIndicatorView
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        if #available(iOS 13.0, *) {
            return .darkContent
        } else {
            return .default
            // Fallback on earlier versions
        }
    }
    func startIndicator() {
        self.view.addSubview(activityIndicagtorView)
        activityIndicagtorView.startAnimating()
        self.view.isUserInteractionEnabled = false

    }
    
    func stopIndicator() {
        activityIndicagtorView.stopAnimating()
        self.view.isUserInteractionEnabled = true
    }
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    func displayAlert(title: String = "OOPS",message: String, handlerAction:AlertHandler? = nil)  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: handlerAction)
        alertController.addAction(alertAction)
        present(alertController, animated: true, completion: nil)
    }
    func displayAlert(title: String = "Alert",message: String, alertTitles: [String], handlerAction:[AlertHandler])  {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (key, value) in alertTitles.enumerated() {
            let alertAction = UIAlertAction(title: value, style: .default, handler: handlerAction[key])
            alertController.addAction(alertAction)
        }
        present(alertController, animated: true, completion: nil)
    }
    
    
    
}
