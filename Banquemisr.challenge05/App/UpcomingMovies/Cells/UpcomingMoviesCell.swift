//
//  UpcomingMoviesCell.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import UIKit

class UpcomingMoviesCell: UITableViewCell {
    
    //MARK: - IBOutLets -
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieNameTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    
    //MARK: - Configure Cell -
    func configureCell(model: UpcomingMoviesResult) {
        posterImage.setWith("https://image.tmdb.org/t/p/original/\(model.posterPath)")
        movieNameTitle.text = model.title
        movieReleaseDate.text = "Release Date \(model.releaseDate)"
    }
    
}
