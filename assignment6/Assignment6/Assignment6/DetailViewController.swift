import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var coverImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var lyricsTextView: UITextView!
    @IBOutlet weak var creditsLabel: UILabel!
    
    var track: Track!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        coverImageView.image = UIImage(named: track.coverImageName)
        titleLabel.text = track.title
        artistLabel.text = track.artist
        genresLabel.text = track.genres.joined(separator: " • ")
        lyricsTextView.text = track.lyrics
        creditsLabel.text = "Credits: \(track.credits.joined(separator: ", "))"
    }
    
}
