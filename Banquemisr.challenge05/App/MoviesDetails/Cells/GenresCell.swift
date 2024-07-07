//
//  GenresCell.swift
//  Banquemisr.challenge05
//
//  Created by Mohamed Aglan on 7/7/24.
//

import UIKit

class GenresCell: UICollectionViewCell {
    
    //MARK: - IBOutLets -
    @IBOutlet weak var genresTitle: UILabel!
    
    
    
    
    
    
    //MARK: - LifeCycle Events -
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    
    //MARK: - Configure Cell -
    func configureCell(model: Genre) {
        genresTitle.text = model.name
    }
    

}