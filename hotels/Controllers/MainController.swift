import UIKit

class MainController: UITableViewController {

    var hotels: [Hotel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // add a loading indicator
        let activityView = UIActivityIndicatorView(style: .gray)
        activityView.center = self.view.center
        activityView.startAnimating()

        self.view.addSubview(activityView)

        self.getData()

        activityView.stopAnimating()
        activityView.removeFromSuperview()
    }

    func getData() {
        let url = URL(string: "https://services.lastminute.com/mobile/stubs/hotels")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let session = URLSession.shared
        let task = session.dataTask(with: request) {
            data, response, error in

            guard let data = data else {
                print("Request failed.")
                return
            }

            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(HotelData.self, from: data)

                self.hotels = decodedData.hotels

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }

            }

            catch {
                print("Error while obtaining the data.")
            }
        }
        task.resume()
    }

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

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let hotel = self.hotels[indexPath.row]
        self.performSegue(withIdentifier: "HotelDetails", sender: hotel)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "HotelDetails" {
            if let hotelDetailsView = segue.destination as? HotelDetailsController,
               let hotel = sender as? Hotel {
                hotelDetailsView.hotel = hotel
            }
        }
    }
}
