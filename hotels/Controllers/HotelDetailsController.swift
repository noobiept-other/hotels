import UIKit

class HotelDetailsController: UITableViewController {

    var hotel: Hotel?

    @IBOutlet var name: UILabel!
    @IBOutlet var stars: UILabel!
    @IBOutlet var userRating: UILabel!
    @IBOutlet var address: UILabel!
    @IBOutlet var city: UILabel!
    @IBOutlet var latitude: UILabel!
    @IBOutlet var longitude: UILabel!
    @IBOutlet var checkInFrom: UILabel!
    @IBOutlet var checkInTo: UILabel!
    @IBOutlet var checkOutFrom: UILabel!
    @IBOutlet var checkOutTo: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var email: UILabel!


    override func viewDidLoad() {
        super.viewDidLoad()

        guard let hotel = self.hotel else {
            return
        }

        self.name.text = hotel.name
        self.stars.text = String(hotel.stars)
        self.userRating.text = String(hotel.userRating)
        self.address.text = hotel.location.address
        self.city.text = hotel.location.city
        self.latitude.text = String(hotel.location.latitude)
        self.longitude.text = String(hotel.location.longitude)
        self.checkInTo.text = hotel.checkIn.to
        self.checkInFrom.text = hotel.checkIn.from
        self.checkOutTo.text = hotel.checkOut.to
        self.checkOutFrom.text = hotel.checkOut.from
        self.phoneNumber.text = hotel.contact.phoneNumber
        self.email.text = hotel.contact.email
    }
}
