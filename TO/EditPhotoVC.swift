//
//  EditPhotoVC.swift
//  TO
//
//  Created by Константин Козлов on 02.02.2022.
//

import UIKit

class EditPhotoVC: UIViewController {
    
    var image: Images!
    var photo: Photo!
    var shopName: String!
    private var dataStoreManager = DataStoreManager()
    private var imagePhoto: UIImage!
    
    @IBOutlet weak var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(data: image.image!)
        addGesture()
    }
    
    
    private func addGesture(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(EditPhotoVC.tappedMe))
        imageView.addGestureRecognizer(tap)
        imageView.isUserInteractionEnabled = true
    }
    
    
    @objc func tappedMe() {
        performSegue(withIdentifier: "toScrollVC", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toScrollVC" {
            guard let imagePhoto = segue.destination as? ImageScrolVC else {return}
            imagePhoto.image = self.image
        }
    }
}
