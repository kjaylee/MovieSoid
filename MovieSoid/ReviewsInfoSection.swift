//
//  ReviewsSection.swift
//  MovieSoid
//
//  Created by datdn1 on 6/20/17.
//  Copyright © 2017 Ominext. All rights reserved.
//

import Foundation
import AsyncDisplayKit
import IGListKit


class ReviewsInfoSection: ListSectionController, ASSectionController {
    
    override init() {
        super.init()
        self.inset = UIEdgeInsets(top: 10, left: 0, bottom: 20, right: 0)
    }

    var object: ReviewsInfo?

    func nodeBlockForItem(at index: Int) -> ASCellNodeBlock {
        let dumpNode: ASCellNodeBlock = { return ASCellNode() }
        guard let reviews = self.object?.reviews  else { return dumpNode }

        if index == 0 { return { DetailHeaderCell(title: "Reviews/Comments") }}

        let hiddenSeperator = (index == reviews.count)
        return { ReviewsCell(model: reviews[index-1], hiddenSeperator: hiddenSeperator, delegate: self, index: index - 1) }
    }

    override func numberOfItems() -> Int {
        guard let reviews = self.object?.reviews else { return 0 }
        return reviews.count > 0 ? reviews.count + 1 : 0
    }

    override func didUpdate(to object: Any) {
        self.object = object as? ReviewsInfo
    }

    override func didSelectItem(at index: Int) { }

    override func sizeForItem(at index: Int) -> CGSize {
        return ASIGListSectionControllerMethods.sizeForItem(at: index)
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

extension ReviewsInfoSection: ReviewsCellDelegate {
    func didTapSeeMore(at index: Int) {
//        ASSectionContext.
//        ASSectionContext?.reload(in: self, at: IndexSet(integer: index + 1))
    }
}



