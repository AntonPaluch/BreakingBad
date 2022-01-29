//
//  DetailVC.swift
//  BreakingBadApp
//
//  Created by Pandos on 29.01.2022.
//

import UIKit

class DetailVC: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameCharacter: UILabel!
    @IBOutlet weak var occupation: UILabel!
    @IBOutlet weak var nickName: UILabel!
    @IBOutlet weak var status: UILabel!
    
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 15
        configureImage()
        nameCharacter.text = character?.name
        occupation.text = character?.occupation?.joined(separator: ",")
        nickName.text = character?.nickname
        status.text = character?.status
    }
    
    func configureImage() {
        DispatchQueue.global().async {
            guard let stringURL = self.character.img else { return }
            guard let imageURL = URL(string: stringURL) else { return }
            guard let imageData = try? Data(contentsOf: imageURL) else { return }
            
            DispatchQueue.main.async {
                self.imageView.image = UIImage(data: imageData)
        }
    }
  }
}
