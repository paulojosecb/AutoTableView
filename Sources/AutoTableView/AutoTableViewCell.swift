//
//  File.swift
//  
//
//  Created by Paulo Barbosa on 29/08/22.
//

import UIKit

public protocol AutoTableViewCellGestureHandler: AnyObject {
    func didPressed(_ row: AutoTableViewRowModel)
}

public protocol AutoTableViewCell: IdentifiableTableViewCell {
    var viewModel: AutoTableViewRowModel? { get set }
    var gestureHandler: AutoTableViewCellGestureHandler? { get set }
}

public protocol IdentifiableTableViewCell: UITableViewCell {
    static var identifier: String { get }
}
