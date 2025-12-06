import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var trackTitleLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var coverImageView: UIImageView!
    
    @IBOutlet weak var playPausedButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    
    @IBOutlet weak var repeatButton: UIButton!
    @IBOutlet weak var shuffleButton: UIButton!
    @IBOutlet weak var queueButton: UIButton!
    
    @IBOutlet weak var progresssSlider: UISlider!
    @IBOutlet weak var currentTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    
    var tracks = TracksManager.shared.tracks
    var originalTracks: [Track] = []
    var shuffledTracks: [Track] = []
    var isShuffling: Bool = false
    var currentIndex: Int = 0
    let player = PlayerManager.shared
    var timer: Timer?
    var repeatMode: RepeatMode = .off
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTracks()
        loadCurrentTrack()
        updateRepeatButton()
        updateShuffleButton()
        
        addDetailViewTaps()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(playbackFinished),
            name: NSNotification.Name("PlaybackFinished"),
            object: nil)
    }
    
    @objc func playbackFinished() {
        switch repeatMode {
        case .off:
            nextTapped(nextButton)
        case .repeatOne:
            player.seek(to: 0)
            player.play()
            startTimer()
            updatePlayPauseButton()
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        stopTimer()
    }
    
    func configureTracks() {
//        guard let url = Bundle.main.url(forResource: "mockdata", withExtension: "json") else {
//            print("JSON file not found")
//            return
//        }
//        
//        do {
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            tracks = try decoder.decode([Track].self, from: data)
//        } catch {
//            print("Error parsing JSON: ", error)
//            
//        }
        
        tracks = TracksManager.shared.tracks
        originalTracks = tracks
    }
    
    func loadCurrentTrack() {
        guard !tracks.isEmpty else {
            print("No tracks to load")
            return
        }
        
        let track = tracks[currentIndex]
        
        trackTitleLabel.text = track.title
        artistLabel.text = track.artist
        coverImageView.image = UIImage(named: track.coverImageName)
        totalTimeLabel.text = track.formattedDuration
        
        do {
            try player.load(fileName: track.audioFileName)
            updateSliderForNewTrack()
        } catch {
            print("Error loading file: ", error)
        }
    }
    
    func updateSliderForNewTrack() {
        progresssSlider.value = 0
        progresssSlider.minimumValue = 0
        progresssSlider.maximumValue = Float(player.duration ?? 0)
        currentTimeLabel.text = "00:00"
    }
    
    @IBAction func playPauseTapped(_ sender: UIButton) {
        if player.isPlaying {
            player.pause()
            stopTimer()
        } else {
            player.play()
            startTimer()
        }
        
        updatePlayPauseButton()
    }
    
    func updatePlayPauseButton() {
        let icon = player.isPlaying ? "pause.fill" : "play.fill"
        playPausedButton.setImage(UIImage(systemName: icon), for: .normal)
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        let shouldResume = player.isPlaying
        
        currentIndex = (currentIndex + 1) % tracks.count
        loadCurrentTrack()
        
        if shouldResume {
            player.play()
            startTimer()
        } else {
            stopTimer()
        }
        
        updatePlayPauseButton()
    }
    
    @IBAction func prevTapped(_ sender: UIButton) {
        let shouldResume = player.isPlaying
        
        currentIndex = (currentIndex - 1 + tracks.count) % tracks.count
        loadCurrentTrack()
        
        if shouldResume {
            player.play()
            startTimer()
        } else {
            stopTimer()
        }
        updatePlayPauseButton()
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        player.seek(to: TimeInterval(sender.value))
    }
    
    func startTimer() {
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { [weak self] _ in
            self?.updateProgressUI()
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
    func updateProgressUI() {
        let time = player.currentTime
        progresssSlider.value = Float(time)
        currentTimeLabel.text = formatTime(time)
    }
    
    func formatTime(_ time: TimeInterval) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    @IBAction func repeatTapped(_ sender: UIButton) {
        switch repeatMode {
        case .off:
            repeatMode = .repeatOne
        case .repeatOne:
            repeatMode = .off
        }
        
        updateRepeatButton()
    }
    
    func updateRepeatButton() {
        switch repeatMode {
        case .off:
            repeatButton.setImage(UIImage(systemName: "repeat"), for: .normal)
            repeatButton.tintColor = .gray
        case .repeatOne:
            repeatButton.setImage(UIImage(systemName: "repeat.1"), for: .normal)
            repeatButton.tintColor = .systemBlue
        }
    }
    
    @IBAction func shuffleTapped(_ sender: UIButton) {
        isShuffling.toggle()
        applyShuffleMode()
        updateShuffleButton()
    }
    
    func applyShuffleMode() {
        let currentTrack = tracks[currentIndex]
        let wasPlaying = player.isPlaying
        let currentTime = player.currentTime
        
        if isShuffling {
            shuffledTracks = originalTracks.shuffled()
            
            if let newIndex = shuffledTracks.firstIndex(where: { $0.id == currentTrack.id}) {
                tracks = shuffledTracks
                currentIndex = newIndex
            }
        } else {
            if let newIndex = originalTracks.firstIndex(where: { $0.id == currentTrack.id}) {
                tracks = originalTracks
                currentIndex = newIndex
            }
        }
        
//        refreshTrackUI()
        if wasPlaying {
            player.seek(to: currentTime)
            player.play()
            startTimer()
        } else {
            player.seek(to: currentTime)
            stopTimer()
        }
//        updatePlayPauseButton()
    }
    
    func updateShuffleButton() {
        let imageName = isShuffling ? "shuffle.fill" : "shuffle"
        let color: UIColor = isShuffling ? .systemBlue : .gray
        shuffleButton.setImage(UIImage(systemName: imageName), for: .normal)
        shuffleButton.tintColor = color
    }
    
//    func refreshTrackUI() {
//        let track = track[currentIndex]
//        trackTitleLabel.text = track.title
//    }
    
    func currentQueueOrder() -> [Track] {
        guard !tracks.isEmpty else { return [] }
        
        let firstPart = tracks[currentIndex...]
        let secondPart = tracks[0..<currentIndex]
        return Array(firstPart+secondPart)
    }
    
    @IBAction func queueTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TrackOrderVC") as! TrackOrderViewController
        
        vc.tracks = currentQueueOrder()
        vc.currentIndex = 0
        vc.delegate = self
        present(vc, animated: true)
    }
    
    // MARK: track details
    
    func addDetailViewTaps() {
        trackTitleLabel.isUserInteractionEnabled = true
        coverImageView.isUserInteractionEnabled = true
        
        let titleTap = UITapGestureRecognizer(target: self, action: #selector(openTrackDetails))
        let imageTap = UITapGestureRecognizer(target: self, action: #selector(openTrackDetails))
        
        trackTitleLabel.addGestureRecognizer(titleTap)
        coverImageView.addGestureRecognizer(imageTap)
    }
    
    @objc func openTrackDetails() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "TrackDetailsVC") as! DetailViewController
        
        vc.track = tracks[currentIndex]
        navigationController?.pushViewController(vc, animated: true)
        
    }
}

extension ViewController: TrackOrderViewControllerDelegate {
    func didSelectTrack(at index: Int) {
        currentIndex = (currentIndex + index) % tracks.count
        
        loadCurrentTrack()
        player.play()
        startTimer()
        updatePlayPauseButton()
    }
}

