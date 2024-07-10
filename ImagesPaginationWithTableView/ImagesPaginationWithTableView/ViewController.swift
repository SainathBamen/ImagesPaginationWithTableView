//
//  ViewController.swift
//  ImagesPaginationWithTableView
//
//  Created by mac on 7/10/24.
//

//import UIKit
//
//class ViewController: UIViewController {
//    var imageList = ["dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2","dattaImg", "boyImg","male", "ramImg2"]
//
//
//    @IBOutlet weak var myTableView: UITableView!
//
//    var limit = 5
//    var totalImages = 0
//    var index = 0
//
//    var displyImages:[String] = Array()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        myTableView.delegate = self
//        myTableView.dataSource = self
//        loadTable()
////        imageList.append("dattaImg")
////        imageList.append("boyImg")
////        imageList.append("male")
////        imageList.append("ramImg2")
////        imageList.append("dattaImg")
////        imageList.append("boyImg")
////        imageList.append("male")
////        imageList.append("ramImg2")
////        imageList.append("dattaImg")
////        imageList.append("boyImg")
////        imageList.append("male")
////        imageList.append("ramImg2")
////        imageList.append("dattaImg")
////        imageList.append("boyImg")
////        imageList.append("male")
////        imageList.append("ramImg2")
////        imageList.append("dattaImg")
////        imageList.append("boyImg")
////        imageList.append("male")
////        imageList.append("ramImg2")
////        imageList.append("dattaImg")
////        imageList.append("boyImg")
////        imageList.append("male")
////        imageList.append("ramImg2")
//
//        totalImages = imageList.count
//        while index < limit{
//            displyImages.append(imageList[index])
//            index = index + 1
//        }
//    }
//}
//
//extension ViewController: UITableViewDelegate, UITableViewDataSource{
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return displyImages.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as?
//        MyTableViewCell
//        let imageName = "\(indexPath.row + 1). \(displyImages[indexPath.row])"
//        cell!.myImg.image = UIImage(named: imageName)
//        return cell!
//
//    }
//    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        if indexPath.row == displyImages.count - 1{
//            var index = displyImages.count - 1
//
//            if index + 20 > imageList.count - 1{
//                limit = imageList.count - index
//            }else{
//                limit = index + 20
//            }
//            while index < limit{
//                displyImages.append(imageList[index])
//                index = index + 1
//            }
//            self.perform(#selector(loadTable), with: nil, afterDelay: 0.5)
//        }
//    }
//    @objc func loadTable(){
//        self.myTableView.reloadData()
//    }
//
//
//}
//
import UIKit

class ViewController: UIViewController {
    var imageList = ["dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2", "dattaImg", "boyImg", "male", "ramImg2"]

    @IBOutlet weak var myTableView: UITableView!

    var limit = 5
    var totalImages = 0
    var index = 0

    var displyImages: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        myTableView.delegate = self
        myTableView.dataSource = self
        loadTable()
        
        totalImages = imageList.count
        while index < limit {
            displyImages.append(imageList[index])
            index = index + 1
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displyImages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyTableViewCell
        let imageName = displyImages[indexPath.row]
        cell.myImg.image = UIImage(named: imageName)
        return cell
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == displyImages.count - 1 {
            var index = displyImages.count

            if index + 20 > imageList.count - 1 {
                limit = imageList.count
            } else {
                limit = index + 20
            }
            while index < limit {
                displyImages.append(imageList[index])
                index = index + 1
            }
            self.perform(#selector(loadTable), with: nil, afterDelay: 0.5)
        }
    }

    @objc func loadTable() {
        self.myTableView.reloadData()
    }
}
