//
//  AddOrderViewController.swift
//  HotCoffee
//
//  Created by SUN on 2022/03/09.
//

import Foundation
import UIKit


class AddOrderViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBAction func save() {
        let name = nameTextField.text
        let email = emailTextField.text
        let selectedCoffeeSize = coffeeSegmentControl.titleForSegment(at: coffeeSegmentControl.selectedSegmentIndex)
        guard let indexPath = tableView.indexPathForSelectedRow else {
            fatalError("Error in selecting coffee")
        }
        vm.name = name
        vm.email = email
        vm.selectedType = vm.types[indexPath.row]
        vm.selectedSize = selectedCoffeeSize
    }
    
    @IBAction func cancel() {
        
    }
    
    private var vm = AddCoffeeViewModel()
    private var coffeeSegmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        setupUI()
    }
    
    private func setupUI() {
        self.coffeeSegmentControl = UISegmentedControl(items: self.vm.sizes)
        self.coffeeSegmentControl.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(coffeeSegmentControl)
        
        coffeeSegmentControl.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20)
            .isActive = true
        coffeeSegmentControl.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            .isActive = true
    }
}




extension AddOrderViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.types.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoffeeTypeTableViewCell", for: indexPath)
        cell.textLabel?.text = vm.types[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.accessoryType = .none
    }
    
    
}
