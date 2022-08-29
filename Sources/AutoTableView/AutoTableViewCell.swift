//
//  File.swift
//  
//
//  Created by Paulo Barbosa on 29/08/22.
//

import UIKit

protocol AutoTableViewCellGestureHandler: AnyObject {
    func didPressed(_ row: AutoTableViewRowModel)
}

protocol AutoTableViewCell: IdentifiableTableViewCell {
    var viewModel: AutoTableViewRowModel? { get set }
    var gestureHandler: AutoTableViewCellGestureHandler? { get set }
}

protocol IdentifiableTableViewCell: UITableViewCell {
    static var identifier: String { get }
}
