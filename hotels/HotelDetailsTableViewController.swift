import UIKit

class HotelDetailsTableViewController: UITableViewController {

    var hotel: Hotel?
    @IBOutlet var name: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        guard let hotel = self.hotel else {
            return
        }

        self.name.text = hotel.name
    }
}
