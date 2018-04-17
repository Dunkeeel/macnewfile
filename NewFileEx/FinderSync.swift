//
//  FinderSync.swift
//  NewFileEx
//
//  Created by 陈冰峰 on 01/09/2017.
//  Copyright © 2017 MajorEssense. All rights reserved.
//

import Cocoa
import FinderSync

class FinderSync: FIFinderSync {
    
    // MARK: - Properties
    
    private let templateDirectory = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("MacNewFile")
    
    // MARK: - Toolbar Item
    
    override var toolbarItemName: String {
        return "NewFile"
    }
    
    override var toolbarItemToolTip: String {
        return "New File"
    }
    
    override var toolbarItemImage: NSImage {
        return NSImage(named: NSImage.Name.addTemplate)!
    }
    
    override func menu(for menuKind: FIMenuKind) -> NSMenu {
        createFolderIfNeeded()
        
        let menu = NSMenu()
        let templates = getTemplateFiles()
        
        if templates.count == 0 {
            let noTemplatesItem = NSMenuItem(title: "templates folder is empty", action: nil, keyEquivalent: "")
            noTemplatesItem.isEnabled = false
            menu.addItem(noTemplatesItem)
        }
        
        // add templates to the menu
        for file in templates {
            let menuItem = NSMenuItem(title: file.lastPathComponent, action: #selector(addFile(_:)), keyEquivalent: "")
            menuItem.image = NSWorkspace.shared.icon(forFile: file.path)
            menu.addItem(menuItem)
        }
        
        // add line separator
        let line = NSMenuItem(title: "______________________", action: nil, keyEquivalent: "")
        line.isEnabled = false
        menu.addItem(line)
        
        // add shortcut to template folder
        menu.addItem(withTitle: "open template folder", action: #selector(openTemplateFolder), keyEquivalent: "")
        
        return menu
    }
    
    // MARK: - Methods
    
    // created the template directory if it doesn't exist already
    private func createFolderIfNeeded() {
        if !FileManager.default.fileExists(atPath: templateDirectory.path) {
            do {
                try FileManager.default.createDirectory(at: templateDirectory, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                NSLog(error.localizedDescription);
            }
        }
    }
    
    private func getTemplateFiles() -> [URL]{
        do {
            let files = try FileManager.default.contentsOfDirectory(at: templateDirectory, includingPropertiesForKeys: nil, options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants])
            return files
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    private func renameIfExist(file fileName: String, in folderURL: URL) -> URL {
        
        var file = folderURL.appendingPathComponent(fileName)
        var fileExtists = false
        var suffix = 1
        
        let fileNameWithoutExtension = file.deletingPathExtension().lastPathComponent
        let fileExtension = file.pathExtension
        
        repeat {
            if FileManager.default.fileExists(atPath: file.path){
                fileExtists = true
                let newFileName = "\(fileNameWithoutExtension) copy\(suffix > 1 ? " \(suffix)" : "")"
                suffix += 1
                file = folderURL.appendingPathComponent(newFileName).appendingPathExtension(fileExtension)
            } else {
                fileExtists = false
            }
        } while fileExtists == true
        
        return file
    }
    
    // MARK: - MenuItem Actions
    
    @objc private func openTemplateFolder() {
        createFolderIfNeeded()
        
        NSWorkspace.shared.selectFile(nil, inFileViewerRootedAtPath: templateDirectory.path)
    }
    
    @objc private func addFile(_ item: NSMenuItem){
        guard let destinationURL = FIFinderSyncController.default().targetedURL() else { return }

        let fileName = item.title
        let sourceFile = templateDirectory.appendingPathComponent(fileName)
        let destinationFile = renameIfExist(file: fileName, in: destinationURL)
                
        if !FileManager.default.fileExists(atPath: destinationFile.path) {
            do {
                try FileManager.default.copyItem(at: sourceFile, to: destinationFile)
            } catch { print(error) }
            
            // selects the created file or directory
            NSWorkspace.shared.selectFile(destinationFile.path, inFileViewerRootedAtPath: "")
        }
    }
}
