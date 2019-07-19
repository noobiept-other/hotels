import UIKit

class HotelCell: UITableViewCell {

    @IBOutlet var name: UILabel!
    @IBOutlet var stars: UILabel!

    func update(_ info: Hotel) {
        self.name.text = info.name
        self.stars.text = "\(info.stars) Stars"
    }
}
