//
//  ViewController.swift
//  DemoWeather
//
//  Created by Sudeepa Pal on 07/06/24.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UITextFieldDelegate, WeatherManagerDelegate {
    
    var weatherManager = WeatherManager()
    let locationManager = CLLocationManager()
    
    let backGroundImageView: UIView = {
           let background = UIView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.backgroundColor = .lightGray
            background.contentMode = .scaleAspectFill // Adjusts the image to fill the view
          //  background.image = UIImage(named: "dark_background") // Replace "backgroundImageName" with yimage name
            return background
        }()
    
    let defaultImageView: UIImageView = {
           let background = UIImageView()
            background.translatesAutoresizingMaskIntoConstraints = false
            background.backgroundColor = .lightGray
            background.contentMode = .scaleAspectFill // Adjusts the image to fill the view
            background.image = UIImage(named: "dark_background") // Replace "backgroundImageName" with yimage name
            return background
        }()
    
    let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Search"
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 13
       // textField.keyboardType = .numberPad
        textField.returnKeyType = .go
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let magnifyglassButton: UIButton = {
        let button =  UIButton()
        button.setBackgroundImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        button.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    let currentLocationButton: UIButton = {
        let button =  UIButton()
        button.setBackgroundImage(UIImage(systemName: "location.fill"), for: .normal)
       // button.setImage(UIImage(systemName: "location.fill"), for: .normal)
        button.addTarget(self, action: #selector(locationPressed), for: .touchUpInside)
        button.imageView?.contentMode = .scaleAspectFill
        button.tintColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    var conditionImageView: UIImageView = {
        let background = UIImageView()
         background.translatesAutoresizingMaskIntoConstraints = false
         background.contentMode = .scaleAspectFill // Adjusts the image to fill the view
//         background.image = UIImage(named: "dark_back") // Replace "backgroundImageName" with yimage name
        background.image = UIImage(systemName: "sun.max")
        background.tintColor = .black
         return background
    }()
    
    var temperatureLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "21°C"
        label.font = UIFont.boldSystemFont(ofSize: 35)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var cityLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "London"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
        
        
        weatherManager.delegate = self
        searchTextField.delegate = self
        
        view.addSubview(backGroundImageView)
        backGroundImageView.addSubview(defaultImageView)
        backGroundImageView.addSubview(searchTextField)
        backGroundImageView.addSubview(magnifyglassButton)
        backGroundImageView.addSubview(currentLocationButton)
        backGroundImageView.addSubview(conditionImageView)
        backGroundImageView.addSubview(temperatureLabel)
        backGroundImageView.addSubview(cityLabel)
        
        NSLayoutConstraint.activate([
            backGroundImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            backGroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0),
            backGroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            backGroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            backGroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backGroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            defaultImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            defaultImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -0),
            defaultImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            defaultImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            defaultImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            defaultImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            searchTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            searchTextField.centerXAnchor.constraint(equalTo: backGroundImageView.centerXAnchor, constant: 0),
            searchTextField.leadingAnchor.constraint(equalTo: backGroundImageView.leadingAnchor, constant: 40),
            searchTextField.trailingAnchor.constraint(equalTo: backGroundImageView.trailingAnchor, constant: -50),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            
            magnifyglassButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            //magnifyglassButton.centerXAnchor.constraint(equalTo: backGroundImageView.centerXAnchor, constant: 0),
            magnifyglassButton.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 0),
            magnifyglassButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            magnifyglassButton.heightAnchor.constraint(equalToConstant: 40),
            magnifyglassButton.widthAnchor.constraint(equalToConstant: 0),
            
            currentLocationButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 80),
            currentLocationButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            currentLocationButton.heightAnchor.constraint(equalToConstant: 35),
            currentLocationButton.widthAnchor.constraint(equalToConstant: 35),
            
            conditionImageView.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 40),
            conditionImageView.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: -130),
            conditionImageView.heightAnchor.constraint(equalToConstant: 120),
            conditionImageView.widthAnchor.constraint(equalToConstant: 120),
            
            temperatureLabel.topAnchor.constraint(equalTo: conditionImageView.bottomAnchor, constant: 30),
            temperatureLabel.leadingAnchor.constraint(equalTo: conditionImageView.leadingAnchor, constant: 0),
            
            cityLabel.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 10),
            cityLabel.leadingAnchor.constraint(equalTo: conditionImageView.leadingAnchor, constant: 0),
        ])
    }
    
    
    
    @objc func searchButtonPressed() {
        //print("It is printing")
        print(searchTextField.text!, "This is our searched pressed")
        searchTextField.endEditing(true)
    }
    
    @objc func locationPressed() {
        locationManager.requestLocation()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //searchTextField.endEditing(true)
        print(searchTextField.text!)
        searchTextField.endEditing(true)
        return true
    }
    
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type Something"
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // Use searchTextField.text to get the weather for that city
        if let city = searchTextField.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
        print("Entering here")
        //searchTextField.placeholder = "Please type Something."
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
        
        print("Printing from weather view controller",weather.temperature)
    }
    func didFailWithError(error: Error) {
        print(error)
    }
}
// MARK: - CLLocationManagerDelegate

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.last {
            locationManager.stopUpdatingLocation()
            let lat = location.coordinate.latitude
            let lon =  location.coordinate.longitude
            weatherManager.fetchWeather(latitude: lat , longitude: lon)
            print(lat)
            print(lon)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
}
