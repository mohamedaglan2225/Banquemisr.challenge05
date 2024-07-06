//
//  NowPlayingMoviesCell.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import UIKit

class NowPlayingMoviesCell: UITableViewCell {
    
    
    //MARK: - IBOutLets -
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var movieNameTitle: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    
    
    //MARK: - LifeCycle Events -
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

    
    //MARK: - Configure Cell -
    func configureCell(model: NowPlayingModelResult) {
        posterImage.setWith("https://image.tmdb.org/t/p/original/\(model.posterPath)")
        movieNameTitle.text = model.title
        movieReleaseDate.text = "Release Date \(model.releaseDate)"
    }
    
}
