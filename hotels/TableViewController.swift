import UIKit

class TableViewController: UITableViewController {

    var hotels: [String] = [ "test 1", "test 2", "test 3" ]


    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.hotels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HotelCell", for: indexPath) as! HotelCell
        let info = self.hotels[indexPath.row]

        cell.update(info)

        return cell
    }
}
