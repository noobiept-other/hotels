import UIKit

class HotelCell: UITableViewCell {

    @IBOutlet var label: UILabel!

    func update(_ info: String) {
        self.label.text = info
    }
}
