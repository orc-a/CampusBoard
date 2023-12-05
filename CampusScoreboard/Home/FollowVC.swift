//
//  FollowVC.swift
//  CampusScoreboard
//

//

import UIKit
import XLPagerTabStrip

class FollowVC: UIViewController, IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Follow")
    }

}

class ColorBtn: UIButton{
    var color: UIColor
    

    init(frame: CGRect, color: UIColor){
        self.color = color
        super.init(frame: frame)
        backgroundColor = color
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
