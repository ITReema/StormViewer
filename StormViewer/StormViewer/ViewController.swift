//
//  ViewController.swift
//  StormViewer
//
//  Created by mac_os on 05/08/1440 AH.
//  Copyright © 1440 mac_os. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var pictures = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Storm Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true
        DispatchQueue.global(qos: .background).async { [weak self] in
            let fm = FileManager.default
            let path = Bundle.main.resourcePath!
            let items = try! fm.contentsOfDirectory(atPath: path)
            
            for item in items {
                if item.hasPrefix("nssl") {
                    // this is a picture to load!
                    self?.pictures.append(item)
                }
            }
        
            self?.pictures.sort()
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        
        return cell
    }
    
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      // 1: try loading the "Detail" view controller and typecasting it to be DetailViewController
      if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
          // 2: success! Set its selectedImage property
          vc.selectedImage = pictures[indexPath.row]
        let totalPictures = pictures.count
        let pictureTitle = "Picture \(pictures.firstIndex(of:pictures[indexPath.row])! + 1) of \(totalPictures)"
        vc.pictureTitle = pictureTitle
          // 3: now push it onto the navigation controller
          navigationController?.pushViewController(vc, animated: true)
      }
  }
    
    
}

