//
//  PostListTableViewController.swift
//  CombineForNoti
//
//  Created by 장희선 on 2022/04/06.
//

import Combine
import UIKit



class PostListTableViewController: UITableViewController {
    
    private var webService = WebService()
    private var cancellable: AnyCancellable?
    private var posts = [Post]() {
        didSet {
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.cancellable = self.webService.getPosts()
            .catch { _ in Just([Post]()) }
            .assign(to: \.posts, on: self)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath)
        let post = posts[indexPath.row]
        cell.textLabel?.text = post.title
        return cell
    }
}
