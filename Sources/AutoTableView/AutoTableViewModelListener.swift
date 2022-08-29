//
//  File.swift
//  
//
//  Created by Paulo Barbosa on 29/08/22.
//

import UIKit

public protocol AutoTableViewModelListener {
    func didUpdate<T: AutoTableViewModel>(_ data: T)
}
