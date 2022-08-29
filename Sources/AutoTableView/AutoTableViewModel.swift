//
//  File.swift
//  
//
//  Created by Paulo Barbosa on 29/08/22.
//

import UIKit

protocol AutoTableViewHeaderModel {
    var title: String { get }
}

protocol AutoTableViewRowModel {}

protocol AutoTableViewSectionModel {
    associatedtype H: AutoTableViewHeaderModel
    associatedtype R: AutoTableViewRowModel
    
    var header: H? { get set }
    var rows: [R] { get set }
}

protocol AutoTableViewModel {
    associatedtype M: AutoTableViewSectionModel

    var sections: [M] { get set }
}
