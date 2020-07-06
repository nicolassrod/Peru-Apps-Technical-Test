//
//  MovieDetailViewController.swift
//  Peru Apps Technical Test
//
//  Created by Nicolás A. Rodríguez on 7/6/20.
//

import UIKit

class MovieDetailViewController: UIViewController {
    var detail: Detail?
    
    @IBOutlet weak var MovieImage: UIImageView!
    @IBOutlet weak var MovieTitle: UILabel!
    @IBOutlet weak var MovieDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detail = detail else { return }
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
}
