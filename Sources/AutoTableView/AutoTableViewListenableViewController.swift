//
//  File.swift
//  
//
//  Created by Paulo Barbosa on 29/08/22.
//

import UIKit

public class AutoListenableViewController<Data: AutoTableViewModel>: UIViewController {
    private var listeners: [AutoTableViewModelListener] = []
    
    deinit {
        self.listeners = []
    }
    
    public func add(listener: AutoTableViewModelListener) {
        self.listeners.append(listener)
    }
    
    public func updateAutoTableViews(with data: Data) {
        self.updateListeners(with: data)
    }
    
    private func updateListeners(with data: Data) {
        listeners.forEach { $0.didUpdate(data)}
    }
}
