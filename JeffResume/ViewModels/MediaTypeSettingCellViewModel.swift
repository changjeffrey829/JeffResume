//
//  MediaTypeSettingCellViewModel.swift
//  JeffResume
//
//  Created by Jeffrey Chang on 1/17/20.
//  Copyright © 2020 Dream Factory. All rights reserved.
//

import UIKit

class MediaTypeSettingCellViewModel: NSObject, UIPickerViewDelegate, UIPickerViewDataSource {
    
    //MARK:- PROPERTIES
    let mediaType: MediaType
    let mediaSetting: MediaSetting
    let ituneURLComponents: [String]
    let currentIndex: Int
    
    //MARK:- LIFE CYCLE
    init(mediaType: MediaType, mediaSetting: MediaSetting, ituneURLComponents: [String], currentIndex: Int) {
        self.mediaType = mediaType
        self.mediaSetting = mediaSetting
        self.ituneURLComponents = ituneURLComponents
        self.currentIndex = currentIndex
    }
    
    //MARK:- PICKERVIEW DELEGATE AND DATASOURCE
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ituneURLComponents.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let tuple = (mediaType: mediaType, mediaSetting: mediaSetting, ituneURLComponent: ituneURLComponents[row])
        let userInfo = [NotificationUserInfoType.mediaTuple: tuple]
        NotificationCenter.default.post(name: .ituneURLComponentUpdated, object: nil, userInfo: userInfo)
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        return AStringCreator.HelveticaAString(style: .HelveticaNeue, text: ituneURLComponents[row], size: 16, foregroundColor: .white, backgroundColor: .clear)
    }
}
