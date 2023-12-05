//
//  Constants.swift
//  CampusScoreboard
//
//  Created by on 11/12/23.
//

import Foundation

let kFollowVCID = "FollowVCID"
let kCollectionVCID = "CollectionVCID"
let kDiscoveryVCID = "DiscoveryVCID"
let kWaterfallCellID = "WaterfallCellID"
let kWaterfallVCID = "WaterfallVCID"
let kwaterfallvcpadding: CGFloat = 4
let kNoteEditVCID = "NoteEditVCID"
let kChannelTableVCID = "ChannelTableVCID"
let kSubChannelCellID = "SubChannelCellID"
let kDraftNoteWaterfallCellID = "DraftNoteWaterfallCellID"


let kChannels = [
    "ALL",
    "Weather",
    "Academics",
    "Social Life",
    "Sports",
    "Food",
    "Activities",
    "Health"
]

let mainColor = UIColor(named: "main")!
let blueColor = UIColor(named: "main")!
let imagePH = UIImage(named: "imagePH")!




let kPhotoCellID = "photoCellID"
let kPhotoFooterID = "PhotoFooterID"


let kMaxCameraZoomFactor: CGFloat = 5
let kMaxPhotoCount = 9
let kSpacingBetweenItems: CGFloat = 2


let kMaxNoteTitleCount = 20
let kMaxNoteTextCount = 1000

let kAllSubChannels = [
 ["all"],           // Entertainment
 ["Temperature", "Sunshine", "Precipitation", "Wind"], // Weather
 ["Courses", "Homework", "Exams", "Projects"],        // Academics
 ["Clubs", "Parties", "Events", "Networking"],        // Social Life
 ["Football", "Basketball", "Tennis", "Swimming"],    // Sports
 ["Breakfast", "Lunch", "Dinner", "Snacks"],          // Food
 ["Workshops", "Volunteering", "Camping", "Tours"],   // Activities
 ["Fitness", "Mental Health", "Nutrition", "Wellness"] // Health
]



// MARK: - CoreData
let appDelegate = UIApplication.shared.delegate as! AppDelegate
let persistentContainer = appDelegate.persistentContainer
let context = persistentContainer.viewContext
let backgroundContext = persistentContainer.newBackgroundContext()

let screenRect = UIScreen.main.bounds

let kWaterfallPadding: CGFloat = 4
let kDraftNoteWaterfallCellBottomViewH: CGFloat = 84


//
let kNoteTable = "Note"
let kUserLikeTable = "UserLike"
let kUserFavTable = "UserFav"
let kCommentTable = "Comment"
let kReplyTable = "Reply"
let kUserInfoTable = "UserInfo"


//
let kNickNameCol = "nickName"
let kAvatarCol = "avatar"
let kGenderCol = "gender"
let kIntroCol = "intro"
let kIDCol = "id"

//
let kCoverPhotoCol = "coverPhoto"
let kCoverPhotoRatioCol = "coverPhotoRatio"
let kPhotosCol = "photos"
let kVideoCol = "video"
let kTitleCol = "title"
let kTextCol = "text"
let kChannelCol = "channel"
let kSubChannelCol = "subChannel"
let kPOINameCol = "poiName"
let kIsVideoCol = "isVideo"
let kLikeCountCol = "likeCount"
let kFavCountCol = "favCount"
let kCommentCountCol = "commentCount"
let kAuthorCol = "author"
let kHasEditCol = "hasEdit"

//
let kUserCol = "user"
let kNoteCol = "note"

//
let kHasReplyCol = "hasReply"

//Reply
let kCommentCol = "comment"
let kReplyToUserCol = "replyToUser"

//UserInfo
let kUserObjectIdCol = "userObjectId"



func largeIcon(_ iconName: String, with color: UIColor = .label) -> UIImage{
    let config = UIImage.SymbolConfiguration(scale: .large)
    let icon = UIImage(systemName: iconName, withConfiguration: config)!
    return icon.withTintColor(color)
}
func fontIcon(_ iconName: String, fontSize: CGFloat, with color: UIColor = .label) -> UIImage{
    let config = UIImage.SymbolConfiguration(font: .systemFont(ofSize: fontSize))
    let icon = UIImage(systemName: iconName, withConfiguration: config)!
    return icon.withTintColor(color)
}

func showGlobalTextHUD(_ title: String){
    let window = UIApplication.shared.windows.last!
    let hud = MBProgressHUD.showAdded(to: window, animated: true)
    hud.mode = .text 
    hud.label.text = title
    hud.hide(animated: true, afterDelay: 2)
}
