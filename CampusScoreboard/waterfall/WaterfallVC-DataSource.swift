//
//  WaterfallVC-DataSource.swift
//  CampusScoreboard
//

//

import Foundation

extension WaterfallVC{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) ->
    Int {
        if isMyDraft{
            return draftNotes.count
        }else{
            return 13
        }
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if isMyDraft{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kDraftNoteWaterfallCellID, for: indexPath) as! DraftNoteWaterfallCell
            cell.draftNote = draftNotes[indexPath.item]
            cell.deleteBtn.tag = indexPath.item
            cell.deleteBtn.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kWaterfallCellID, for: indexPath) as! WaterfallCell
            cell.imageview.image = UIImage(named: "\(indexPath.item + 1)")
            return cell
        }
    }
}


extension WaterfallVC{
    private func deleteDraftNote(_ index: Int){
        backgroundContext.perform {
            let draftNote = self.draftNotes[index]

            backgroundContext.delete(draftNote)
            appDelegate.saveBackgroundContext()

            self.draftNotes.remove(at: index)
            
            //UI
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()
                self.showTextHUD("Deletion successful")
            }
        }
    }
}

// MARK: - 
extension WaterfallVC{
    @objc private func showAlert(_ sender: UIButton){
        let index = sender.tag
        
        let alert = UIAlertController(title: "promt", message: "delete this draft?", preferredStyle: .alert)
        let action1 = UIAlertAction(title: "cancel", style: .cancel)
        let action2 = UIAlertAction(title: "confirm", style: .destructive) { _ in self.deleteDraftNote(index) }
        alert.addAction(action1)
        alert.addAction(action2)
        
        present(alert, animated: true)
    }
}
