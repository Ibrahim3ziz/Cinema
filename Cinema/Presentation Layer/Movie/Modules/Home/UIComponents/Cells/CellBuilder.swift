//
//  CellBuilder.swift
//  Cinema
//
//  Created by Ibrahim Abdul Aziz on 31/05/2022.
//

import Foundation
import UIKit

protocol CellAttributes {
    var image: UIImage? { get }
    var titleText: String? { get }
}

class GeneresCell: CellAttributes {
    var image = UIImage(systemName: "square.grid.2x2")
    var titleText: String? = "Generes"
}


class tvSeriesCell: CellAttributes {
    var image = UIImage(systemName: "tv")
    var titleText: String? = "TV Series"
}

class moviesCell: CellAttributes {
    var image = UIImage(systemName: "house")
    var titleText: String? = "Movies"
}

class theatreCell: CellAttributes {
    var image = UIImage(systemName: "house")
    var titleText: String? = "In Theatre"
}


class CellCreator {
    class func createCell(category: CategoryEnum) -> CellAttributes {
        switch category {
        case .generes:
            return GeneresCell()
        case .tvSeries:
            return tvSeriesCell()
        case .movies:
            return moviesCell()
        case .inTheatre:
            return theatreCell()
        }
    }
}



 class CategoryCell: CategoryCollectionViewCell {
     var cellAttributes: CellAttributes?

     required public override init(frame: CGRect) {
         super.init(frame: frame)
         config()
     }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(category: CategoryEnum) {
        super.init(frame: .zero)
        cellAttributes = CellCreator.createCell(category: category)
        config()
    }
    
    private func config() {
        self.titleLabel.text = cellAttributes?.titleText
        self.categoryImageView.image = cellAttributes?.image
    }
    
}
