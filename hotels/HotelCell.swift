import UIKit

class HotelCell: UITableViewCell {

    @IBOutlet var label: UILabel!

    func update(_ info: Hotel) {
        self.label.text = info.name
    }
}
