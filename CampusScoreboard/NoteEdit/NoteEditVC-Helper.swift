//
//  NoteEditVC-Helper.swift
//  CampusScoreboard
//
//  Created by 高瑞鸿 on 11/14/23.
//

extension NoteEditVC{
    func isValidateNote() -> Bool{
        
        guard !photos.isEmpty else {
            showTextHUD("at least one")
            return false
        }
        return true
    }
    
    func handleTFEditChanged(){

        guard titleTextField.markedTextRange == nil else { return }
        
        if titleTextField.unwrappedText.count > kMaxNoteTitleCount{
            
            titleTextField.text = String(titleTextField.unwrappedText.prefix(kMaxNoteTitleCount))
            
            showTextHUD("max\(kMaxNoteTitleCount)words")
            

            DispatchQueue.main.async {
                let end = self.titleTextField.endOfDocument
                self.titleTextField.selectedTextRange = self.titleTextField.textRange(from: end, to: end)
            }
        }
        titleCountLabel.text = "\(kMaxNoteTitleCount - titleTextField.unwrappedText.count)"
    }
}
