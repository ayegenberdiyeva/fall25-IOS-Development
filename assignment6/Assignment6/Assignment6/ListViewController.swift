import UIKit

class ListViewController: UIViewController {
    var tracks = TracksManager.shared.tracks
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
//        NotificationCenter.default.addObserver(
//            self,
//            selector: #selector(tracksDidLoad),
//            name: .tracksLoaded,
//            object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.rowHeight = 60
        tableView.reloadData()
    }
    
    @objc func tracksDidLoad() {
        tableView.reloadData()
    }
    
    deinit {
//        NotificationCenter.default.removeObserver(self, name: .tracksLoaded, object: nil)
    }
}

extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTrackCell", for: indexPath) as! TrackCellTableViewCell
        
        let track = tracks[indexPath.row]
        cell.coverImageView.image = UIImage(named: track.coverImageName)
        cell.titleLabel.text = track.title
        cell.artistLabel.text = track.artist
        
        return cell
    }
}
