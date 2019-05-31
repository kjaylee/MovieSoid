//
//  DetailHeaderCell.swift
//  MovieSoid
//
//  Created by datdn1 on 6/20/17.
//  Copyright © 2017 Ominext. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class DetailHeaderCell: ASCellNode {

    lazy var titleTextNode: ASTextNode = {
        let node = ASTextNode()
        return node
    }()

    lazy var seeAllTextNode: ASTextNode = {
        let node = ASTextNode()
        let attrs = [
            NSAttributedString.Key.foregroundColor : UIColor.lightGray,
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13)
        ]
        node.attributedText = NSAttributedString(string: "See All〉", attributes: attrs)
        return node
    }()

    init(title: String) {
        super.init()
        self.titleTextNode.attributedText = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 14), NSAttributedString.Key.foregroundColor: UIColor.white])
        self.backgroundColor = Constants.Color.headerColor
        self.automaticallyManagesSubnodes = true
    }

    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let headerStackSpec = ASStackLayoutSpec(direction: .horizontal, spacing: 10, justifyContent: .spaceBetween, alignItems: .center, children:  [self.titleTextNode, self.seeAllTextNode])
        headerStackSpec.style.width = ASDimension(unit: .points, value: UIScreen.main.bounds.size.width)
        let headerInsetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 12, left: 8, bottom: 12, right: 8), child: headerStackSpec)
        return headerInsetSpec
    }
}
















