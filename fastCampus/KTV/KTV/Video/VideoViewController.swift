//
//  VideoViewController.swift
//  KTV
//
//  Created by  서재효 on 3/13/24.
//

import UIKit
import AVKit

protocol VideoViewControllerDelegate: AnyObject {
    
    func videoViewController(
        _ videoViewController: VideoViewController,
        yPositionForMinimizeView height: CGFloat
    ) -> CGFloat
    
    func videoViewControllerDidMinimize(_ videoViewController: VideoViewController)
    func videoViewControllerNeedsMaximize(_ videoViewController: VideoViewController)
    func videoViewControllerDidTapClose(_ videoViewController: VideoViewController)
}

class VideoViewController: UIViewController {
    private let chattingLandscapeConstraint: CGFloat = -500
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var updateDateLabel: UILabel!
    @IBOutlet weak var playCountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var channelThumbnailImageView: UIImageView!    
    @IBOutlet weak var channelNameLabel: UILabel!

    @IBOutlet weak var recommendTableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var portraitControlPannel: UIView!
    
    @IBOutlet weak var landscapeControlPannel: UIView!
    @IBOutlet weak var landscapePlayButton: UIButton!
    @IBOutlet weak var landscapeTitleLabel: UILabel!
    
    @IBOutlet weak var playerView: PlayerView!
    @IBOutlet var playerViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var seekbar: SeekbarView!
    @IBOutlet weak var landscapePlayTimeLabel: UILabel!
    
    @IBOutlet weak var chattingView: ChattingView!
    @IBOutlet weak var chattingBottomConstraint: NSLayoutConstraint!
    
    //MARK: - 최소화
    @IBOutlet weak var minimizeView: UIView!
    @IBOutlet weak var minimizeViewBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var minimizePlayerView: PlayerView!
    @IBOutlet weak var minimizeTitleLabel: UILabel!
    @IBOutlet weak var minimizeChannelLabel: UILabel!
    @IBOutlet weak var minimizePlayButton: UIButton!
    
    var isLiveMode: Bool = false
    private var isMinimizeMode: Bool = false {
        didSet {
            self.minimizeView.isHidden = !self.isMinimizeMode
        }
    }
    weak var delegate: VideoViewControllerDelegate?
    
    private var pipController: AVPictureInPictureController?
    
    private static let dataFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MMdd"
        return formatter
    }()
    
    
    
    private var contentSizeObservation: NSKeyValueObservation?
    private let viewModel = VideoViewModel()
    private var isContentPannelHidden: Bool = true {
        didSet {
            if self.isLandscape(size: self.view.frame.size) {
                self.landscapeControlPannel.isHidden = self.isContentPannelHidden
            } else {
                self.portraitControlPannel.isHidden = self.isContentPannelHidden
            }
        }
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate = self
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.modalPresentationStyle = .fullScreen
        self.transitioningDelegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.minimizePlayerView.delegate = self
        self.playerView.delegate = self
        self.seekbar.delegate = self
        self.chattingView.delegate = self
        self.channelThumbnailImageView.layer.cornerRadius = 14
        self.setupRecommendTableView()
        self.bindViewModel()
        self.viewModel.request()
        self.chattingView.isHidden = !self.isLiveMode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if self.isBeingPresented {
            self.setupPIPController()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if self.isBeingDismissed {
            self.pipController = nil
        }
        
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: any UIViewControllerTransitionCoordinator) {
        self.switchControlPannel(size: size)
        self.playerViewBottomConstraint.isActive = self.isLandscape(size: size)
        
        self.chattingView.textField.resignFirstResponder()
        if self.isLandscape(size: size) {
            self.chattingBottomConstraint.constant = self.chattingLandscapeConstraint
        } else {
            self.chattingBottomConstraint.constant = 0
        }
        
        coordinator.animate { _ in
            self.chattingView.collectionView.collectionViewLayout.invalidateLayout()
        }
        
        super.viewWillTransition(to: size, with: coordinator)
        
    }
    
    private func setupPIPController() {
        guard AVPictureInPictureController.isPictureInPictureSupported(),
              let playerLayer = self.playerView.avPlayerLayer else {
            return
        }
        
        let pipController = AVPictureInPictureController(playerLayer: playerLayer)
        pipController?.canStartPictureInPictureAutomaticallyFromInline = true
        
        self.pipController = pipController
    }
    
    private func isLandscape(size: CGSize) -> Bool {
        size.width > size.height
    }
    
    private func bindViewModel() {
        self.viewModel.dataChangeHandler = { [weak self] in
            self?.setupData($0)
        }
    }
    
    private func setupData(_ video: Video) {
        self.playerView.set(url: video.videoURL)
        self.playerView.play()
        self.minimizeTitleLabel.text = video.title
        self.minimizeChannelLabel.text = video.channel
        self.titleLabel.text = video.title
        self.landscapeTitleLabel.text = video.title
        self.channelThumbnailImageView.loadImage(url: video.channelImageUrl)
        self.channelNameLabel.text = video.channel
        self.updateDateLabel.text = Self.dataFormatter.string(from: Date(timeIntervalSince1970: video.uploadTimestamp))
        self.playCountLabel.text = "재생수 \(video.playCount)"
        self.favoriteButton.setTitle("\(video.favoriteCount)", for: .normal)
        self.recommendTableView.reloadData()
    }
    
    @IBAction func commentDidTap(_ sender: Any) {
        if self.isLiveMode {
            self.chattingView.isHidden = false
        }
    }
    
    
}

extension VideoViewController {
    @IBAction func minimizeViewCloseDidTap(_ sender: Any) {
        self.delegate?.videoViewControllerDidTapClose(self)
    }
    
    @IBAction func maximize(_ sender: Any) {
        self.delegate?.videoViewControllerNeedsMaximize(self)
    }
    
}


extension VideoViewController {
    private func switchControlPannel(size: CGSize) {
        guard self.isContentPannelHidden == false else {
            return
        }
        
        self.landscapeControlPannel.isHidden = !self.isLandscape(size: size)
        self.portraitControlPannel.isHidden = self.isLandscape(size: size)
    }
    
    @IBAction func toggleControlPannel(_ sender: Any) {
        self.isContentPannelHidden.toggle()
    }
    @IBAction func closeDidTap(_ sender: Any) {
        self.isMinimizeMode = true
        self.rotateScene(landscape: false)
        self.dismiss(animated: true)
    }
    @IBAction func moreDidTap(_ sender: UIButton) {
        let moreVc = MoreViewController()
        self.present(moreVc, animated: true)
    }
    @IBAction func rewindDidTap(_ sender: Any) {
        self.playerView.rewind()
    }
    @IBAction func playDidTap(_ sender: Any) {
        if self.playerView.isPlaying {
            self.playerView.pause()
        } else {
            self.playerView.play()
        }
        self.updatePlayButton(isPlaying: self.playerView.isPlaying)
    }
    
    @IBAction func fastFowardDidTap(_ sender: Any) {
        self.playerView.forward()
    }
    @IBAction func expandDidTap(_ sender: Any) {
        self.rotateScene(landscape: true)
    }
    @IBAction func shrinkDidTap(_ sender: Any) {
        self.rotateScene(landscape: false)
    }
    
    private func updatePlayButton(isPlaying: Bool) {
        let playImage = isPlaying ? UIImage(named: "small_pause") : UIImage(named: "small_play")
        self.playButton.setImage(playImage, for: .normal)
        self.minimizePlayButton.setImage(playImage, for: .normal)
        
        let landscapePlayImage = isPlaying ? UIImage(named: "big_pause") : UIImage(named: "big_play")
        self.landscapePlayButton.setImage(landscapePlayImage, for: .normal)
    }
    
    private func rotateScene(landscape: Bool) {
        if #available(iOS 16.0, *) {
            self.view.window?.windowScene?.requestGeometryUpdate(
                .iOS(interfaceOrientations: landscape ? .landscapeRight : .portrait)
            )
        }else {
            let orientation: UIInterfaceOrientation = landscape ? .landscapeRight : .portrait
            UIDevice.current.setValue(orientation.rawValue, forKey: "orientation")
            UIViewController.attemptRotationToDeviceOrientation()
        }
    }

}

extension VideoViewController :PlayerViewDelegate {
    func playerViewReadyToPlay(_ playerView: PlayerView) {
        self.seekbar.setTotalPlayTime(self.playerView.totalPlayTime)
        self.updatePlayButton(isPlaying: playerView.isPlaying)
        
        self.updatePlayTime(0, totalPlayTime: playerView.totalPlayTime)
    }
    
    func playerView(_ playerView: PlayerView, didPlay playTime: Double, playableTime: Double) {
        self.seekbar.setPlayTime(playTime, playableTime: playableTime)
        self.updatePlayTime(playTime, totalPlayTime: playerView.totalPlayTime)
    }
    
    func playerViewDidFinishToplay(_ playerView: PlayerView) {
        self.playerView.seek(to: 0)
        self.updatePlayButton(isPlaying: false)
    }
    
    private func updatePlayTime(_ playTime: Double, totalPlayTime: Double) {
        guard
            let playTimeText = DateComponentsFormatter.playTimeFormatter.string(from: playTime),
            let totalPlayTimeText = DateComponentsFormatter.playTimeFormatter.string(from: totalPlayTime)
        else {
            self.landscapePlayTimeLabel.text = nil
            return
        }
        self.landscapePlayTimeLabel.text = "\(playTimeText) / \(totalPlayTimeText)"
    }
    
    
}

extension VideoViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> (any UIViewControllerAnimatedTransitioning)? {
        self
    }
}

extension VideoViewController: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: (any UIViewControllerContextTransitioning)?) -> TimeInterval {
        0.3
    }
    
    func animateTransition(using transitionContext: any UIViewControllerContextTransitioning) {
        if self.isBeingPresented {
            guard let view = transitionContext.view(forKey: .to) else {
                return
            }
            
            transitionContext.containerView.addSubview(view)
            
            if self.isMinimizeMode {
                self.chattingBottomConstraint.constant = 0
                self.playerViewBottomConstraint.isActive = false
                self.playerView.isHidden = false
                self.minimizeViewBottomConstraint.isActive = false
                self.isMinimizeMode = false
                
                UIView.animate(
                    withDuration: self.transitionDuration(using: transitionContext)
                ) {
                    view.frame = .init(
                        origin: .init(x: 0, y: view.safeAreaInsets.top),
                        size: view.window?.frame.size ?? view.frame.size
                    )
                } completion: { _ in
                    view.frame.origin = .zero
                    transitionContext.completeTransition(transitionContext.transitionWasCancelled == false)
                }
            } else {
                view.alpha = 0
                UIView.animate(
                    withDuration: self.transitionDuration(using: transitionContext)
                ) {
                    view.alpha = 1
                } completion: { _ in
                    transitionContext.completeTransition(transitionContext.transitionWasCancelled == false)
                }
            }
            
            
        } else {
            guard let view = transitionContext.view(forKey: .from) else {
                return
            }
            
            if self.isMinimizeMode,
               let yPosition = self.delegate?.videoViewController(self, yPositionForMinimizeView: self.minimizeView.frame.height) {
                self.minimizePlayerView.player = self.playerView.player
                self.isContentPannelHidden = true
                self.chattingBottomConstraint.constant = self.chattingLandscapeConstraint
                self.playerViewBottomConstraint.isActive = true
                self.playerView.isHidden = true
                
                view.frame.origin.y = view.safeAreaInsets.top
                
                UIView.animate(
                    withDuration: self.transitionDuration(using: transitionContext)
                ) {
                    view.frame.origin.y = yPosition
                    view.frame.size.height = self.minimizeView.frame.height
                } completion: { _ in
                    transitionContext.completeTransition(transitionContext.transitionWasCancelled == false)
                    self.minimizeViewBottomConstraint.isActive = true
                    self.delegate?.videoViewControllerDidMinimize(self)
                }
            } else {
                UIView.animate(
                    withDuration: self.transitionDuration(using: transitionContext)
                ) {
                    view.alpha = 0
                } completion: { _ in
                    transitionContext.completeTransition(transitionContext.transitionWasCancelled == false)
                    view.alpha = 1
                }
            }
        }
    }
    
}

extension VideoViewController: ChattingViewDelegate {
    func liveChattingViewCloseDidTap(_ chattingView: ChattingView) {
        self.chattingView.isHidden = true
        
    }
}

extension VideoViewController: SeekbarViewDelegate {
    func seekbar(_ seekbar: SeekbarView, seekToPercent percent: Double) {
        self.playerView.seek(to: percent)
    }
}

extension VideoViewController: UITableViewDataSource, UITableViewDelegate {
    private func setupRecommendTableView() {
        self.recommendTableView.delegate = self
        self.recommendTableView.dataSource = self
        self.recommendTableView.rowHeight = HomeRecommendItemCell.height
        self.recommendTableView.register(
            UINib(nibName: HomeRecommendItemCell.identifier, bundle: nil) ,
            forCellReuseIdentifier: HomeRecommendItemCell.identifier
        )
        
        self.contentSizeObservation = self.recommendTableView.observe(
            \.contentSize,
             changeHandler: { [weak self] tableView, _ in
                 self?.tableViewHeightConstraint.constant = tableView.contentSize.height
             }
        )
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.video?.recommends.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: HomeRecommendItemCell.identifier,
            for: indexPath
        )
        
        if let cell = cell as? HomeRecommendItemCell,
           let data = self.viewModel.video?.recommends[indexPath.row] {
            cell.setData(data, rank: indexPath.row + 1)
        }
            
        return cell
    }
    
}