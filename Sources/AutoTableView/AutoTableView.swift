//
//  AutoSizingTableView.swift
//  AutoTableView
//
//  Created by Paulo Barbosa on 12/08/22.
//

import UIKit

public class AutoTableView<Cell: AutoTableViewCell, Data: AutoTableViewModel>: UITableView {
    
    private var autoTableViewDelegate: AutoTableViewDelegate?
    private var autoTableViewDataSource: AutoTableViewDataSource<Cell, Data>?
    
    var gestureHandler: AutoTableViewCellGestureHandler? {
        didSet {
            self.autoTableViewDataSource?.gestureHandler = gestureHandler
        }
    }
    
    init(data: Data, gestureHandler: AutoTableViewCellGestureHandler? = nil) {
        super.init(frame: .zero, style: .plain)

        self.autoTableViewDelegate = AutoTableViewDelegate()
        self.autoTableViewDataSource = AutoTableViewDataSource<Cell, Data>(data: data, tableView: self, gestureHandler: gestureHandler)
        
        self.delegate = self.autoTableViewDelegate
        self.dataSource = self.autoTableViewDataSource
        
        self.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        
        self.estimatedRowHeight = UITableView.automaticDimension
        self.rowHeight = UITableView.automaticDimension
        self.sectionHeaderHeight = UITableView.automaticDimension
        self.estimatedSectionHeaderHeight = UITableView.automaticDimension
        self.estimatedSectionFooterHeight = UITableView.automaticDimension
        self.estimatedSectionFooterHeight = UITableView.automaticDimension
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }

    public override var intrinsicContentSize: CGSize {
        layoutIfNeeded()
        return CGSize(width: UIView.noIntrinsicMetric, height: contentSize.height)
    }
}

extension AutoTableView: AutoTableViewModelListener {
    public func didUpdate<T>(_ data: T) where T : AutoTableViewModel {
        guard let data = data as? Data else { return }
        self.autoTableViewDataSource?.data = data
    }
}


