//
//  ViewController.swift
//  Weather
//
//  Created by 장희선 on 2022/04/08.
//

import UIKit
import Combine

class ViewController: UIViewController {

    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityTextField: UITextField!
    
    private var webService: WebService = WebService()
    private var cancellable: AnyCancellable?
    override func viewDidLoad() {
        super.viewDidLoad()
        setupPublisher()
        /*
        self.cancellable = webService.fetchWeather(city: "Boston")
            .catch { _ in Just(Weather.placeholder) }
//            .map { "\($0.temp)"}
            .map { weather in
                if let temp = weather.temp {
                    return "\(temp)"
                } else {
                    return "Error getting weather"
                }
            }
            .assign(to: \.text, on: self.tempLabel)
         */
    }
    
    private func setupPublisher() {
        let publisher = NotificationCenter.default.publisher(for: UITextField.textDidChangeNotification, object: self.cityTextField)
        
        self.cancellable = publisher.compactMap {
                ($0.object as! UITextField).text?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
            }.debounce(for: .milliseconds(500), scheduler: RunLoop.main)
                .flatMap { city in
                    return self.webService.fetchWeather(city: city)
                        .catch { _ in Just(Weather.placeholder) }
                        .map { $0 }
            }.sink {
                
                if let temp = $0.temp {
                    self.tempLabel.text = "\(temp) ℉"
                } else {
                    self.tempLabel.text = ""
                }
            }
    }


}

