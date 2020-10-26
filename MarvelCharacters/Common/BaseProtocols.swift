//
//  RootViewController.swift
//  MarvelCharacters
//
//  Created by Noeda, David on 17/10/2020.
//

import Foundation
import UIKit
import NVActivityIndicatorView

protocol LoadingViewProtocol: class {
   var activityIndicator: NVActivityIndicatorView? {get set}

   func showLoading(fromView: LoadingBaseView)
   func hideLoading()
}

enum LoadingBaseView {
   case controllerView
   case controllerFull
   case window
}

extension LoadingViewProtocol where Self: UIViewController {

   func createLoadingView() {
      self.activityIndicator = NVActivityIndicatorView(frame: .zero)

      if let activityIndicator = self.activityIndicator {
         activityIndicator.type = .circleStrokeSpin
         activityIndicator.color = .black
         activityIndicator.widthAnchor.constraint(equalToConstant: 80).isActive = true
         activityIndicator.heightAnchor.constraint(equalToConstant: 80).isActive = true
      }
   }

   func showLoading(fromView: LoadingBaseView = .controllerView) {
      DispatchQueue.main.async {
         if self.activityIndicator == nil {
            self.createLoadingView()

            var baseView: UIView?
            switch fromView {
            case .controllerView:
               baseView = self.view
            case .controllerFull:
               if let view = self.tabBarController?.view {
                  baseView = view
               } else if let view = self.navigationController?.view {
                  baseView = view
               } else {
                  baseView = self.view
               }
            case .window:
               baseView = UIApplication.shared.windows.filter({ $0.isKeyWindow }).first
            }

            if let baseView = baseView {
               self.activityIndicator?.translatesAutoresizingMaskIntoConstraints = false
               baseView.addSubview(self.activityIndicator!)

               self.activityIndicator?.centerXAnchor.constraint(equalTo: baseView.centerXAnchor).isActive = true
               self.activityIndicator?.centerYAnchor.constraint(equalTo: baseView.centerYAnchor).isActive = true

               self.activityIndicator?.startAnimating()
            }
         }
      }
   }

   func hideLoading() {
      DispatchQueue.main.async {
         UIView.animate(withDuration: 0.6, delay: 0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: .curveEaseOut, animations: {
            self.activityIndicator?.alpha = 0
      }, completion: { _ in
            self.activityIndicator?.stopAnimating()
         })
      }
   }
}
