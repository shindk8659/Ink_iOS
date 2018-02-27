//
//  NewspeedVC.swift
//  Ink_iOS_Deviloper
//
//  Created by 신동규 on 2018. 2. 27..
//  Copyright © 2018년 신동규. All rights reserved.
//

import UIKit

class NewspeedVC: UIViewController , UICollectionViewDataSource{
    @IBOutlet weak var collectionView: UICollectionView!
    
    let randomTexts = ["Aenean dapibus urna a ullamcorper malesuada. Ut tempor.",
                       "Sed venenatis ligula massa, a vulputate ipsum fringilla eget. Ut justo erat, facilisis id rhoncus cursus, fringilla at.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum lobortis nibh metus, elementum tempus libero ornare vitae. Etiam sed leo pretium, consectetur turpis non, dapibus purus. Suspendisse potenti. Ut ut eros nunc. Cras nulla justo, porttitor non sapien at, iaculis.",
                       "Maecenas pellentesque sed magna in congue. Sed non lacus in mi posuere scelerisque. Aenean.",
                       "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras eget ex a velit tincidunt sodales. Donec elementum nisi at enim tempus, et rutrum erat semper. Phasellus ultricies est nec finibus."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView.register(UINib.init(nibName: "NewspeedCell", bundle: nil), forCellWithReuseIdentifier: "NewspeedCell")
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = CGSize(width: 1,height: 1)
        }
        collectionView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let listheaderView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "newspeedHeader", for: indexPath) as! NewspeedCollectionReusableView
        
        
        return listheaderView
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return randomTexts.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "NewspeedCell", for: indexPath) as! NewspeedCell
        cell.comment.addTarget(self, action: #selector(movecommentpage(_:)), for: .touchUpInside)
        cell.descriptionlabel.text = randomTexts[indexPath.row]
        return cell
    }
    @objc func movecommentpage(_ sender: UIButton){
        let storyboard: UIStoryboard = self.storyboard!
        let nextView = storyboard.instantiateViewController(withIdentifier: "commentvc") as! CommentVC
       navigationController?.pushViewController(nextView, animated: true)
        
    }
    
}
