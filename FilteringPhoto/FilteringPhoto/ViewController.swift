//
//  ViewController.swift
//  FilteringPhoto
//
//  Created by 장희선 on 2022/01/21.
//

import UIKit
import RxSwift


class ViewController: UIViewController {
    
    @IBOutlet weak var photoImageView: UIImageView!

    let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navC = segue.destination as? UINavigationController,
              let photosCVC = navC.viewControllers.first as? PhotoCollectionViewController
        else {
            fatalError("Segue destination is not found")
        }
        
        photosCVC.selectedPhoto.subscribe(onNext: {[weak self] photo in
            self?.photoImageView.image = photo
        })
            .disposed(by: disposeBag)
    }


}

