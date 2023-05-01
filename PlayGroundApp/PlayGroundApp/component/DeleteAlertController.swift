//
//  DeleteAlertController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 1.05.2023.
//

import UIKit

class DeleteAlertController: UIAlertController {
    
    convenience init(onDelete: @escaping () -> Void, onCancel: @escaping () -> Void) {
        self.init(title: "Deleting!", message: nil, preferredStyle: .actionSheet)
        addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { _ in
            onDelete()
        }))
        addAction(UIAlertAction(
            title: "Cancel",
            style: .cancel,
            handler: { _ in
                onCancel()
            }))
    }
    
}
