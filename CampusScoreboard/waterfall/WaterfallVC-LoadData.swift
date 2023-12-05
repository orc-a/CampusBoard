//
//  WaterfallVC-LoadData.swift
//  CampusScoreboard
//

//

import CoreData

extension WaterfallVC{
    func getDraftNotes(){

        let request = DraftNote.fetchRequest() as NSFetchRequest<DraftNote>

        let sortDescriptor1 = NSSortDescriptor(key: "updatedAt", ascending: false)

        request.sortDescriptors = [sortDescriptor1]
        

        request.propertiesToFetch = ["coverPhoto", "title", "updatedAt", "isVideo"]
        
        showLoadHUD()
        backgroundContext.perform {
            if let draftNotes = try? backgroundContext.fetch(request){
                self.draftNotes = draftNotes
                DispatchQueue.main.async {
                    self.collectionView.reloadData()
                }
            }
            self.hideLoadHUD()
        }
        
        
        
    }
}
