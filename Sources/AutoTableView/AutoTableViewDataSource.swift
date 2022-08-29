//
//  File.swift
//  
//
//  Created by Paulo Barbosa on 29/08/22.
//

import UIKit

class AutoTableViewDataSource<Cell: AutoTableViewCell, Data: AutoTableViewModel>: NSObject, UITableViewDataSource, AutoTableViewModelListener {

    weak var gestureHandler: AutoTableViewCellGestureHandler?
    weak var tableView: UITableView?
    
    var data: Data {
        didSet {
            tableView?.reloadData()
        }
    }

    init(data: Data, tableView: UITableView, gestureHandler: AutoTableViewCellGestureHandler? = nil) {
        self.data = data
        self.tableView = tableView
        self.gestureHandler = gestureHandler
    }

    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.sections[section].rows.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return data.sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data.sections[section].header?.title
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let reusableCell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            fatalError()
        }

        reusableCell.viewModel = self.data.sections[indexPath.section].rows[indexPath.row]
        reusableCell.gestureHandler = self.gestureHandler
        
        return reusableCell
    }
    
    func didUpdate<T>(_ data: T) where T : AutoTableViewModel {
        guard let data = data as? Data else { return }
        self.data = data
    }

}
