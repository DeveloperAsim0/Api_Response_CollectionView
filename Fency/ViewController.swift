//
//  ViewController.swift
//  Fency
//
//  Created by Tarun Meena on 05/03/20.
//  Copyright © 2020 Mihir Vyas. All rights reserved.
//

import UIKit
import Alamofire
import SDWebImage

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    var myData: Master_Response?
    var imageData =   [UIImage(named: "101"),
                      UIImage(named: "102"),
                      UIImage(named: "103"),
                      UIImage(named: "104"),
                      UIImage(named: "105"),
                      UIImage(named: "106")]
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
       // centeredNavBarImage()
        fetch_Images()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.6431372549, green: 0.4823529412, blue: 0.968627451, alpha: 1)
       
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    func fetch_Images() {
        request(Method.GET_IMAGES_URL).responseJSON { (response) in
            print(response.result)
            print(response.data)
            print(response.response)
            do {
                let myData = try JSONDecoder().decode(Master_Response.self, from: response.data!)
                self.myData = myData
                self.collectionView.reloadData()
            } catch let error {
                print(error.localizedDescription)
            }
        }
    
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    func centeredNavBarImage() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "BreatheLogo"))
        imageView.frame = CGRect(x: 0, y: 0, width: 170, height: 30)
        imageView.contentMode = .scaleAspectFit
        
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 170, height: 30))
        
        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
        
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.section == 1{
            return CGSize(width: (view.frame.width / 2) - 16, height: 200)
        }
        return CGSize(width: view.frame.width, height: 200)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if section == 1 {
            return myData?.result?.count ?? 0
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let hero: Hero
//        hero = myHeros[indexPath.row]
        if indexPath.section == 1{
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "testcell", for: indexPath) as! second
        cell.backgroundColor = UIColor.red
        cell.userimagevie.sd_setImage(with: URL(string: myData?.result?[indexPath.row]._links?.avatar?.href ?? ""), placeholderImage: #imageLiteral(resourceName: "BreatheLogo"), options: .handleCookies, completed: nil)
            return cell
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mergecell", for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 1 {
            return UIEdgeInsets(top: 10, left: 8, bottom: 10, right: 8)
        }
        return UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0)
    }

}

//let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
//let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
//let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
//return CGSize(width: size, height: size)
