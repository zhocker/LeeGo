//
//  ElementViewModel.swift
//  LeeGo
//
//  Created by Victor WANG on 17/01/16.
//  Copyright © 2016 LeeGo. All rights reserved.
//

import Foundation
import LeeGo

final class ElementViewModel<E: Element> {

    let element: E

    init(element: E) {
        self.element = element
    }
}

extension ElementViewModel {
    static func elementViewModelsWithElements(elements: [E]) -> [ElementViewModel] {
        return elements.map({ (element) -> ElementViewModel in
            return ElementViewModel(element: element)
        })
    }
}

extension ElementViewModel: ComponentDataSource {
    func updateComponent(componentView: UIView, with componentTarget: ComponentTarget) {
        switch componentView {
        case let titleLabel as UILabel where componentTarget == ComponentBuilder.title:
            titleLabel.attributedText = titleLabel.updatedAttributedString(with: [element.isRestrict ? "󰀀" : nil, element.title, element.natureEdito])
        case let subtitleLabel as UILabel  where componentTarget == ComponentBuilder.subtitle:
            subtitleLabel.text = element.description
        case let avatar as UIImageView where componentTarget == ComponentBuilder.avatar:
            avatar.backgroundColor = UIColor.grayColor()
        default:
            break
        }
    }
}
