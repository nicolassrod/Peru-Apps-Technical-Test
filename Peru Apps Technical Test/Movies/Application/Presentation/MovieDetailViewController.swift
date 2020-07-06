//
//  MovieDetailViewController.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/6/20.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var detail: Detail!
    
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = URL(string: detail.img) {
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: url) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self?.MovieImage.image = image
                        }
                    }
                }
            }
        }
        MovieTitle.text = detail.title
        MovieDescription.text = detail.description
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
