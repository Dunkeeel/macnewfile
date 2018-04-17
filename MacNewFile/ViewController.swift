//
//  ViewController.swift
//  MacNewFile
//
//  Created by Tobias Dunkel on 17.04.18.
//  Copyright © 2018 MajorEssense. All rights reserved.
//

import AppKit

class ViewController : NSViewController {
    
    let imageView: NSImageView = {
        let view = NSImageView()
        view.image = NSImage(named: NSImage.Name(rawValue: "AppIcon"))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isEditable = false
        return view
    }()
    
    let titleLabel: NSText = {
        let label = NSText()
        label.isEditable = false
        label.isSelectable = false
        label.alignment = .center
        label.drawsBackground = false
        //label.backgroundColor = .clear
        label.string = "MacNewFile"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let subtitleLabel: NSText = {
        let label = NSText()
        label.isEditable = false
        label.isSelectable = false
        label.alignment = .center
        label.drawsBackground = false
        label.string = "First activate the Finder extension in the System settings. \n\nAfter that the Finder Toolbar Icon will be available."
        label.textColor = .black
        label.font = .systemFont(ofSize: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func loadView() {
        let view = NSView(frame: NSRect(x: 0, y: 0, width: 200, height: 250))
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        view.addSubview(titleLabel)
        view.addSubview(imageView)
        view.addSubview(subtitleLabel)


        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 8)
            ])
        
        NSLayoutConstraint.activate([
            subtitleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8),
            subtitleLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8),
            subtitleLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
            ])
    }
    
}

