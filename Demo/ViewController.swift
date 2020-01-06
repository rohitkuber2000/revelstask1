//
//  ViewController.swift
//  Demo
//
//  Created by Rohit Kuber on 04/01/20.
//  Copyright © 2020 Rohit Kuber. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellId = "cellID"
    
    lazy var yellowButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .white
        button.setTitle("Test", for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return button
    }()
    
    
    var abc : [String]?
    
    
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.delegate = self
        tv.dataSource = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.register(dummyCell.self, forCellReuseIdentifier: cellId)
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        view.addSubview(yellowButton)
        
        
        
        
//        abc = ["123", "456", "789", "123", "123"]
        
//        yellowButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 64).isActive = true
//        yellowButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 64).isActive = true
//        yellowButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -64).isActive = true
//        yellowButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        _ = yellowButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, topConstant: 64, leftConstant: 64, bottomConstant: 0, rightConstant: 64, widthConstant: 0, heightConstant: 50)
        
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: yellowButton.bottomAnchor, constant: 64).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
        
        navigationItem.title = "DEMO APP"
        
        // Do any additional setup after loading the view.
    }
    
    
    
    @objc func buttonTapped(){
        let vc = ViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.abc =  ["123", "456", "789", "123", "123"]
        present(vc, animated: true) {
            print("presented")
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                self.dismiss(animated: true)
            }
        }
        
        navigationController?.pushViewController(vc, animated: true)
        print(123)
    }


}


extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! dummyCell
        cell.numberLabel.text = abc?[indexPath.row] ?? "No Values"
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let def = abc else { return 1 }
        
        return def.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}


class dummyCell: UITableViewCell{
    
    
    let numberLabel : UILabel = {
        let label = UILabel()
        label.text = "hello"
        label.textAlignment = .center
        return label
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(numberLabel)
        numberLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor)
        numberLabel.anchorWithConstants(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 16, rightConstant: 16)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
