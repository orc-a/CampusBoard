//
//  NoteEditVC-DragDrop.swift
//  CampusScoreboard
//

//

import Foundation

// MARK: - UICollectionViewDragDelegate
extension NoteEditVC: UICollectionViewDragDelegate{

    func collectionView(_ collectionView: UICollectionView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {

        let photo = photos[indexPath.item]
        let dragItem = UIDragItem(itemProvider: NSItemProvider(object: photo))
        dragItem.localObject = photo //放下cell时，移动photos数组里的数据时需用到;在同一app内拖放时，localObject可以加快数据传递
        
        return [dragItem]
        
    }

}

// MARK: - UICollectionViewDropDelegate
extension NoteEditVC: UICollectionViewDropDelegate{
    

    func collectionView(_ collectionView: UICollectionView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UICollectionViewDropProposal {

        
        if collectionView.hasActiveDrag{
            return UICollectionViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
        }
        return UICollectionViewDropProposal(operation: .forbidden)
    }
    

    func collectionView(_ collectionView: UICollectionView, performDropWith coordinator: UICollectionViewDropCoordinator) {

        
        if coordinator.proposal.operation == .move,
           let item = coordinator.items.first,
           let sourceIndexPath = item.sourceIndexPath,
           let destinationIndexPath = coordinator.destinationIndexPath{
            

            collectionView.performBatchUpdates {
                photos.remove(at: sourceIndexPath.item)
                photos.insert(item.dragItem.localObject as! UIImage, at: destinationIndexPath.item)
                collectionView.moveItem(at: sourceIndexPath, to: destinationIndexPath)
            }

            coordinator.drop(item.dragItem, toItemAt: destinationIndexPath)
            
        }
    }
    
    
}
