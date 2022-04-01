//
//  MainTableViewController.swift
//  SwiftUIinUikit
//
//  Created by 장희선 on 2022/04/01.
//

import Foundation
import UIKit


class MainTableViewController: UITableViewController {
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let movie = self.movies[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoviesTableViewCell", for: indexPath)
        
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
