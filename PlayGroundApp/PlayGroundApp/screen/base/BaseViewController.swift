//
//  BaseViewController.swift
//  PlayGroundApp
//
//  Created by Ramazan Öğünç on 16.04.2023.
//

import UIKit

//protocol BaseViewControllerProtocol {
//    var  baseViewModel : BaseViewModel? { get }
//}

class BaseViewController : UIViewController {
    
    var baseViewModel: BaseViewModel? {
//        guard let baseDelegate = self as? BaseViewControllerProtocol else {
//            fatalError("View Control must be BaseViewControllerProtocol")
//        }
//        return baseDelegate.baseViewModel
        return nil
    }
        
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBaseViewModel()
    }
    
    
    private func setupBaseViewModel() {
        baseViewModel?.showLoading = { [weak self] in
            guard let self = self else { return }
            if self.view.subviews.contains(where: { $0 is UILoadingIndicator }) {
                return
            }
            
            let activityIndicator = UILoadingIndicator()
            activityIndicator.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            activityIndicator.frame = self.view.bounds

            UIView.transition(
                with: self.view,
                duration: 0.25,
                options: .transitionCrossDissolve,
                animations: {
                    self.view.addSubview(activityIndicator)
                }
            )
        }
        baseViewModel?.hideLoading = { [weak self] in
            guard let self = self else { return }
            self.view.subviews.filter({ $0 is UILoadingIndicator }).forEach({ $0.removeFromSuperview() })
        }
        baseViewModel?.showWarningToast = { text in
            print("showWarningToast")
        }
    }

    
}
