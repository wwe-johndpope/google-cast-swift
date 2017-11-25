//
//  MoviesVC.swift
//  google-cast-swift
//
//  Created by jeremy on 25/11/17.
//  Copyright © 2017 jeremy. All rights reserved.
//

import UIKit

class MoviesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateMovies()
        
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieCell {
            let movie = movies[indexPath.row]
            cell.configureCell(movie: movie)
            return cell
        } else {
            return MovieCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        performSegue(withIdentifier: "ShowMovie", sender: movie)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MovieVC {
            if let movie = sender as? Movie {
                destination.movie = movie
            }
        }
    }

    
    private func populateMovies() {
        // Free sample videos are provided by www.vidsplay.com
        let crab = Movie(title: "Crab",
                         imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/04/crab-screenshot.jpg",
                         videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/04/crab.mp4")
        
        let alligator = Movie(title: "Alligator",
                              imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/04/alligator-screenshot.jpg",
                              videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/04/alligator.mp4")
        
        let turtle = Movie(title: "Turtle",
                           imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/04/turtle-screenshot.jpg",
                           videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/04/turtle.mp4")
        
        let postalTruck = Movie(title: "Postal Truck",
                                imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/us_postal-screenshot.jpg",
                                videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/us_postal.mp4")
        
        let traffic = Movie(title: "Traffic",
                            imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/traffic1-screenshot.jpg",
                            videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/traffic1.mp4")
        
        let arrows = Movie(title: "Traffic Arrows",
                           imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/traffic_arrows-screenshot.jpg",
                           videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/traffic_arrows.mp4")
        
        let chicken = Movie(title: "Chicken",
                            imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/bbq_chicken-screenshot.jpg",
                            videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/bbqchicken.mp4")
        
        let hamburger = Movie(title: "Hamburger",
                              imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/hamburger-screenshot.jpg",
                              videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/hamburger.mp4")
        
        let pizza = Movie(title: "Pizza",
                          imageUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/pizza-screenshot.jpg",
                          videoUrl: "http://www.vidsplay.com/wp-content/uploads/2017/05/pizza.mp4")
        
        self.movies.append(crab)
        self.movies.append(alligator)
        self.movies.append(turtle)
        self.movies.append(postalTruck)
        self.movies.append(traffic)
        self.movies.append(arrows)
        self.movies.append(chicken)
        self.movies.append(hamburger)
        self.movies.append(pizza)
    }


}

