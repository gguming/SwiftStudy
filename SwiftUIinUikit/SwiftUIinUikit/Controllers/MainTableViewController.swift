//
//  MainTableViewController.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/01.
//

import Foundation
import UIKit
import SwiftUI


class MainTableViewController: UITableViewController {
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateMovies()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(MoviesTableViewCell.self, forCellReuseIdentifier: "MoviesTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = self.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath) as! MoviesTableViewCell
        
        cell.textLabel?.text = movie.title
        
        DispatchQueue.global().async {
            let imageData = try? Data(contentsOf: URL(string: movie.poster)!)
            if let imageData = imageData {
                DispatchQueue.main.async {
                    cell.imageView?.image = UIImage(data: imageData)
                }
            }
        }
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = movies[indexPath.row]
        let movieDetailView = UIHostingController(rootView: MovieDetailView(movie: movie))
        self.navigationController?.pushViewController(movieDetailView, animated: true)
    }
    
    private func populateMovies() {
        let url = "http://www.omdbapi.com/?s=batman&apikey=564727fa"
        WebService().loadMovies(url: url) { movies in
            if let movies = movies {
                self.movies = movies
                self.tableView.reloadData()
            }
        }
    }
}
