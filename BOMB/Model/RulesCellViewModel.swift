//
//  RulesCellViewModel.swift
//  BOMB
//
//  Created by Дарья Сотникова on 09.08.2023.
//

import UIKit

enum RulesCellViewModel {
    case imageAndText(UIImage?, String)
    case title(String)
    case image(UIImage)
    case text(String)
    case twoImagesLabel(left: (String, String)?, right: (String, String)?)
    case timeDurationLabel(UIImage?, String)
}
