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
        print("Cast button was pressed")
        
        /*  In your own app, calulate the actual duration of your stream,
            for this example app, I've just made up a value.
         */
        let randomTimeIntervalThatYouShouldntUseIRL = TimeInterval(9876543210)
        
        let mediaInfo = GCKMediaInformation(contentID: self.movie.videoUrl, streamType: .unknown, contentType: "video/mp4", metadata: self.metadata, streamDuration: randomTimeIntervalThatYouShouldntUseIRL, mediaTracks: nil, textTrackStyle: nil, customData: nil)
        
        let castSession = GCKCastContext.sharedInstance().sessionManager.currentCastSession
        
        if (castSession != nil) {
            print("castSession wasn't nil, time to load the media!")
            castSession?.remoteMediaClient?.loadMedia(mediaInfo, autoplay: true)
        }
        
        castSession?.remoteMediaClient?.play()
        
        /*
         Calling a method that requires a media status with no media status, ignoring; make sure that media is loaded, the media channel has received a status, and that this method is not being called while the device manager is attempting to reconnect
        */
        
        
        
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
