//
//  NoteEditVC.swift
//  CampusScoreboard
//
//

import UIKit
import YPImagePicker
import AVKit
import MBProgressHUD
import SKPhotoBrowser
import LeanCloud

class NoteEditVC: UIViewController {
    
    var draftNote: DraftNote?
    var updateDraftNoteFinished: (() -> ())?
    var postDraftNoteFinished: (() -> ())?
    var updateNoteFinished: ((String) -> ())?
    
    var photos = [UIImage(named: "1")!, UIImage(named: "2")!]
    
    var videoURL: URL?
    
    var channel = ""
    var subChannel = ""
    var poiName = ""
    var note: LCObject?

    
    @IBOutlet weak var photoCollectionview: UICollectionView!

    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var channelIcon: UIImageView!
    @IBOutlet weak var channelLabel: UILabel!
    @IBOutlet weak var channelPlaceholderLabel: UILabel!
    
    @IBOutlet weak var titleCountLabel: UILabel!
    var photoCount: Int{ photos.count }
    var isVideo: Bool { videoURL != nil }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoCollectionview.dragInteractionEnabled = true
        setUI()
        
        print(NSHomeDirectory())
    }
    
    
    
    
    @IBAction func TFEditBegin(_ sender: Any) {
        titleCountLabel.isHidden = false
        print(NSHomeDirectory())
    }
    
    @IBAction func TFEditEnd(_ sender: Any) {
        titleCountLabel.isHidden = true
    }
    
    @IBAction func TFEndOnExit(_ sender: Any) {}
    
    @IBAction func TFEditChanged(_ sender: Any) { handleTFEditChanged() }
    
    
    
    
    
    @IBAction func saveDraftNote(_ sender: Any) {
        if let draftNote = draftNote{
            updateDraftNote(draftNote)
        }else{
            createDraftNote()
        }
    }
    
    
    @IBAction func postNote(_ sender: Any) {
        guard isValidateNote() else { return }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let channelVC = segue.destination as? ChannelVC{
            view.endEditing(true)
            channelVC.PVDelegate = self
        }
    }
    
    
    
    
}
// MARK: - ChannelVCDelegate
extension NoteEditVC: ChannelVCDelegate{
    func updateChannel(channel: String, subChannel: String) {
        //数据
        self.channel = channel
        self.subChannel = subChannel
        //UI
        updateChannelUI()
    }
    
}



