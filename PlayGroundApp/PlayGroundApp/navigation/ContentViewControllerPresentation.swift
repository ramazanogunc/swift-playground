//
//  ContentViewControllerPresentation.swift
//  on-boarding
//
//  Created by Ramazan Öğünç on 11.04.2023.
//

import Foundation
import UIKit

enum ContentViewControllerPresentation{
    case embed(ContentViewController)
    case push(UIViewController)
    case modal(UIViewController)
}
