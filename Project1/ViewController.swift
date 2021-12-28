import UIKit

class TableVC: UITableViewController {
    var pictures = [String]()
    var indexImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Storm Viewer"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasPrefix("nssl") {
                // this is a picture to load!
                pictures.append(item)
            }
        }
        print(pictures)
        tableView.isEditing = true
    }
    
//    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        if indexPath.row == 0 {
//            return .insert
//        }else{
//            return .delete
//        }
//    }
//
//    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
//        if indexPath.row == 0 {
//            return "插入"
//        }else{
//            return "删除"
//        }
//    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
                as? PictureTableViewCell else{
                    fatalError("Unable to dequeue")
                }
        //        cell.textLabel?.text = pictures[indexPath.row]
        cell.label.text = pictures[indexPath.row]
        indexImage = pictures[indexPath.row]
        
        let range: Range = indexImage!.range(of: ".")!
        let location: Int = indexImage!.distance(from: indexImage!.startIndex, to: range.lowerBound)
        let subStr = indexImage!.prefix(location)
        
        let path = Bundle.main.path(forResource: String(subStr), ofType: ".jpg")
        cell.picture.image = UIImage(contentsOfFile: path!)
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detial") as? DetialVC {
            // 2: success! Set its selectedImage property
            vc.selectImage = pictures[indexPath.row]
            
            // 3: now push it onto the navigation controller
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
