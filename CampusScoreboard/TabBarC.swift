//
//  TabBarC.swift
//  CampusScoreboard
//
//

import UIKit
import YPImagePicker

class TabBar: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        delegate = self
    }
    

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        if viewController is PostVC{
            
            
            
            
            var config = YPImagePickerConfiguration()
 
            config.isScrollToChangeModesEnabled = false
            config.onlySquareImagesFromCamera = false
            config.albumName = Bundle.main.appName
            config.startOnScreen = .library
            config.screens = [.library, .video, .photo]
            config.maxCameraZoomFactor = 5
            
            config.library.defaultMultipleSelection = true
            config.library.maxNumberOfItems = kMaxPhotoCount
            config.library.spacingBetweenItems = 2
        
            config.gallery.hidesRemoveButton = false
            
            
            
            
            let picker = YPImagePicker(configuration: config)
            
        
            picker.didFinishPicking { [unowned picker] items, cancelled in
                if cancelled{
                    picker.dismiss(animated: true)
                }else{
                    var photos: [UIImage] = []
                    var videoURL: URL?
                    
                    for item in items {
                        switch item {
                        case let .photo(photo):
                            photos.append(photo.image)
                        case .video:
     
                            let url = URL(fileURLWithPath: "recordedVideoRAW.mov", relativeTo: FileManager.default.temporaryDirectory)
                            photos.append(url.thumbnail)
                            videoURL = url
                        }
                    }
                    
                    let vc = self.storyboard!.instantiateViewController(identifier: kNoteEditVCID) as! NoteEditVC
                    vc.photos = photos
                    vc.videoURL = videoURL
                    picker.pushViewController(vc, animated: true)
                }
            }
            present(picker, animated: true)
            return false
        }
        
        return true
        
    }
    
    
}

