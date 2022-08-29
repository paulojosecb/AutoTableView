//
//  File.swift
//  
//
//  Created by Paulo Barbosa on 29/08/22.
//

import UIKit

protocol AutoTableViewModelListener {
    func didUpdate<T: AutoTableViewModel>(_ data: T)
}
