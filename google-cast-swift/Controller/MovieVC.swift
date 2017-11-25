//
//  MovieVC.swift
//  google-cast-swift
//
//  Created by jeremy on 25/11/17.
//  Copyright © 2017 jeremy. All rights reserved.
//

import UIKit
import GoogleCast

class MovieVC: UIViewController {
    
    var movie : Movie!
    var metadata : GCKMediaMetadata!
    var mediaInfo : GCKMediaInformation!

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setMediaMetadata()
    }
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func castButtonPressed(_ sender: UIButton) {
        
        /*  In your own app, calulate the actual duration of your stream,
            for this example app, I've just made up a value.
         */
        let randomTimeIntervalThatYouShouldntUseIRL = TimeInterval(9876543210)
        
        let mediaInfo = GCKMediaInformation(contentID: self.movie.videoUrl, streamType: .unknown, contentType: "video/mp4", metadata: self.metadata, streamDuration: randomTimeIntervalThatYouShouldntUseIRL, mediaTracks: nil, textTrackStyle: nil, customData: nil)
        
        let castSession = GCKCastContext.sharedInstance().sessionManager.currentCastSession
        
        if (castSession != nil) {
            castSession?.remoteMediaClient?.loadMedia(mediaInfo, autoplay: true)
        }
        
        castSession?.remoteMediaClient?.play()
        
        
        
    }
    
    private func configureView() {
        self.movieTitle.text = movie.title
        self.movieImage.imageFromServerURL(urlString: movie.imageUrl)
    }
    
    private func setMediaMetadata() {
        self.metadata = GCKMediaMetadata(metadataType: .movie)
        self.metadata.setString(self.movie.title, forKey: kGCKMetadataKeyTitle)
        self.metadata.addImage(GCKImage(url: URL(string: self.movie.imageUrl)!, width: 1920, height: 1080))
    }

}
