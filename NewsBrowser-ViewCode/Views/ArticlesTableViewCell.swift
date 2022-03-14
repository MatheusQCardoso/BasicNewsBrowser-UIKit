//
//  ArticlesTableViewCell.swift
//  NewsBrowser-ViewCode
//
//  Created by Matheus Quirino on 06/03/22.
//

import Foundation
import UIKit

class ArticlesTableViewCell: UITableViewCell{
    
    var articleImageView        = UIImageView()
    var articleTitleView        = UILabel()
    var articleDescriptionView  = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(articleImageView)
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
