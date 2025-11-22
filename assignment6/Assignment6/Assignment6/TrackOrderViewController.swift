import UIKit

protocol TrackOrderViewControllerDelegate: AnyObject {
    func didSelectTrack(at index: Int)
}

class TrackOrderViewController: UIViewController {
    var tracks: [Track] = []
    var currentIndex: Int = 0

    @IBOutlet weak var tableView: UITableView!
    weak var delegate: TrackOrderViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 60
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       // MARK: im not sure of this
    }
}

extension TrackOrderViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCellTableViewCell
        
        let track = tracks[indexPath.row]
        cell.coverImageView.image = UIImage(named: track.coverImageName)
        cell.titleLabel.text = track.title
        cell.artistLabel.text = track.artist
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectTrack(at: indexPath.row)
        dismiss(animated: true)
    }
}
