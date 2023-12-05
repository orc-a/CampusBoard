//
//  NoteEditVC-UI.swift
//  CampusScoreboard
//

//
extension NoteEditVC{
    func setUI(){
        setDraftNoteEditUI()
        print(NSHomeDirectory())
    }
}


extension NoteEditVC{
    private func setDraftNoteEditUI(){
        if let draftNote = draftNote{
            titleTextField.text = draftNote.title
            textView.text = draftNote.text
            channel = draftNote.channel!
            subChannel = draftNote.subChannel!
            
            if !subChannel.isEmpty{ updateChannelUI() }
        }
    }
    
    func updateChannelUI(){
        channelIcon.tintColor = blueColor
        channelLabel.text=subChannel
        channelLabel.textColor = blueColor
        channelPlaceholderLabel.isHidden = true
    }
    
}
