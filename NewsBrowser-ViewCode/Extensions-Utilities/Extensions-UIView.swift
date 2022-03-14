//
//  Extensions-UIView.swift
//  NewsBrowser-ViewCode
//
//  Created by Matheus Quirino on 06/03/22.
//

import Foundation
import UIKit

enum ViewSide{
    case top
    case bottom
    case left
    case right
    case leading
    case trailing
    
    func getLayoutConstraint(of view: UIView, toThe parentSide: ViewSide, of parent: UIView) -> NSLayoutConstraint{
        switch self {
        case .top:
            return view.topAnchor.constraint(equalTo: parentSide.getYAnchor(of: parent))
        case .bottom:
            return view.bottomAnchor.constraint(equalTo: parentSide.getYAnchor(of: parent))
        case .left:
            return view.leftAnchor.constraint(equalTo: parentSide.getXAnchor(of: parent))
        case .right:
            return view.rightAnchor.constraint(equalTo: parentSide.getXAnchor(of: parent))
        case .leading:
            return view.leadingAnchor.constraint(equalTo: parentSide.getXAnchor(of: parent))
        case .trailing:
            return view.trailingAnchor.constraint(equalTo: parentSide.getXAnchor(of: parent))
        default:
            fatalError("Couldn't create a constraint from this side.")
        }
    }
    func getYAnchor(of view: UIView) -> NSLayoutYAxisAnchor {
        switch self {
        case .top:
            return view.topAnchor
        case .bottom:
            return view.bottomAnchor
        default:
            fatalError("Couldn't find this anchor on the Y axis.")
        }
    }
    func getXAnchor(of view: UIView) -> NSLayoutXAxisAnchor{
        switch self {
        case .left:
            return view.leftAnchor
        case .right:
            return view.rightAnchor
        case .leading:
            return view.leadingAnchor
        case .trailing:
            return view.trailingAnchor
        default:
            fatalError("Couldn't find this anchor on the X axis.")
        }
    }
}

extension UIView {
    
    func fillParent(within parent: UIView){
        self.translatesAutoresizingMaskIntoConstraints                          = false
        self.topAnchor.constraint(equalTo: parent.topAnchor).isActive           = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor).isActive     = true
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor).isActive   = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor).isActive = true
    }
    func fillParentSafely(within parent: UIView){
        self.translatesAutoresizingMaskIntoConstraints                          = false
        self.topAnchor.constraint(equalTo: parent.topAnchor,
                                  constant: parent.safeAreaInsets.top)
                                  .isActive                                     = true
        self.bottomAnchor.constraint(equalTo: parent.bottomAnchor,
                                     constant: -parent.safeAreaInsets.bottom)
                                    .isActive                                   = true
        self.leadingAnchor.constraint(equalTo: parent.leadingAnchor,
                                      constant: parent.safeAreaInsets.left)
                                     .isActive                                  = true
        self.trailingAnchor.constraint(equalTo: parent.trailingAnchor,
                                       constant: -parent.safeAreaInsets.right)
                                     .isActive                                  = true
    }

    func pin(own side: ViewSide, to parentSide: ViewSide, of parent: UIView){
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = side.getLayoutConstraint(of: self, toThe: parentSide, of: parent)
        constraint.isActive                                                     = true
    }
    func pin(own side: ViewSide, to parentSide: ViewSide, of parent: UIView, withPadding padding: CGFloat?){
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraint = side.getLayoutConstraint(of: self, toThe: parentSide, of: parent)
        if let padding = padding {
            constraint.constant = padding
        }
        constraint.isActive                                                     = true
    }
    
    func centerInside(of parent: UIView){
        self.translatesAutoresizingMaskIntoConstraints                          = false
        self.centerXAnchor.constraint(equalTo: parent.centerXAnchor).isActive   = true
        self.centerYAnchor.constraint(equalTo: parent.centerYAnchor).isActive   = true
    }
    
    func resize(width: CGFloat?, height: CGFloat?){
        self.translatesAutoresizingMaskIntoConstraints                          = false
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive        = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive      = true
        }
    }
    
    func resizeInRelation(to parent: UIView, widthPadding: CGFloat?, heightPadding: CGFloat?){
        self.translatesAutoresizingMaskIntoConstraints                          = false
        self.widthAnchor.constraint(equalTo: parent.widthAnchor,
                                    constant: widthPadding ?? 0.0).isActive     = true
        self.heightAnchor.constraint(equalTo: parent.heightAnchor,
                                     constant: heightPadding ?? 0.0).isActive   = true
        
    }
}
