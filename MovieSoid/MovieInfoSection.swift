//
//  MovieInfoSection.swift
//  MovieSoid
//
//  Created by datdn1 on 6/19/17.
//  Copyright © 2017 Ominext. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import IGListKit

class MovieInfoSection: ListSectionController, AsyncDisplayKit.ASSectionController {
    
    
    var object: Movies?

    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        guard let movie = object else { return {
                return ASCellNode()
            }
        }
        return {
            return MovieDetailInfoCell(model: movie)
        }
    }
    
    override func numberOfItems() -> Int {
        return 1
    }
    override func didUpdate(to object: Any) {
        self.object = object as? Movies
    }
    override func didSelectItem(at index: Int) { }
    override func sizeForItem(at index: Int) -> CGSize {
        return .zero//ASIGListSectionControllerMethods.sizeForItem(at: index)
    }
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
    }
    func nodeForItem(at index: Int) -> ASCellNode {
        return ASCellNode(viewBlock: { () -> UIView in
            return ASIGListSectionControllerMethods.cellForItem(at: index, sectionController: self)
        })
    }
}
