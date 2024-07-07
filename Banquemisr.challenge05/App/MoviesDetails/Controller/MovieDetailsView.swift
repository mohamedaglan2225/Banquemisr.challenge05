//
//  MovieDetailsView.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/6/24.
//

import UIKit
import Combine

class MovieDetailsView: BaseViewController {
    
    
    //MARK: - IBOutLets -
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var movieDescrption: UILabel!
    @IBOutlet weak var genresCollectionView: UICollectionView!
    @IBOutlet weak var movieRunTime: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    
    
    
    //MARK: - Properties -
    private var viewModel: MovieDetailsViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    
    
    
    //MARK: - LifeCycle Events -
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    init(viewModel: MovieDetailsViewModel = MovieDetailsViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "MovieDetailsView", bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        self.viewModel = MovieDetailsViewModel()
        super.init(coder: coder)
    }
    
    
    //MARK: - Configure UI -
    
    
    
    
    
    //MARK: - IBActions - 


}
