//
//  WeatherCell.swift
//  Weathered
//
//  Created by Eugene Baung on 12/20/17.
//  Copyright © 2017 Baung. All rights reserved.
//

import Cocoa

class WeatherCell: NSCollectionViewItem {
    
    //Outlets
    @IBOutlet weak var weatherCellImage: NSImageView!
    @IBOutlet weak var cellDate: NSTextField!
    @IBOutlet weak var highTemp: NSTextField!
    @IBOutlet weak var lowTemp: NSTextField!
    @IBOutlet weak var cellTime: NSTextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.wantsLayer = true
        self.view.layer?.backgroundColor = CGColor(red: 0.69, green: 0.85, blue: 0.99, alpha: 0.5)
        self.view.layer?.cornerRadius = 5
    }
    
    func configureCell(weatherCell: Forecast) {
        weatherCellImage.image = NSImage(named: NSImage.Name(rawValue: weatherCell.weatherType))
        highTemp.stringValue = "\(weatherCell.highTemp)°"
        lowTemp.stringValue = "\(weatherCell.lowTemp)°"
        cellDate.stringValue = weatherCell.date
        cellTime.stringValue = weatherCell.time
    }
}
