//
//  CalendarCell.swift
//  ReadMoon
//
//  Created by 박현진 on 2021/10/23.
//

import Foundation
import UIKit
import Then
import SnapKit

internal final class CalendarCell: UICollectionViewCell {
    internal lazy var dayBtn = UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("", for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        $0.isUserInteractionEnabled = false
        $0.setTitleColor(UIColor.init(r: 247, g: 247, b: 247), for: .normal)
    }

    internal var cellDate: Date = .init()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.makeUI()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.makeUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    deinit {
        print("\(type(of: self)): DEINIT")
    }

    private func makeUI() {
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        let cellWidth = (UIScreen.main.bounds.width - 58) / 7
        let cellHeight = (32 / 34) * cellWidth        
        self.contentView.snp.makeConstraints {
            $0.width.equalTo(cellWidth)
            $0.height.equalTo(cellHeight)
        }

        self.contentView.addSubview(self.dayBtn)
        self.dayBtn.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.height.equalTo(cellHeight)
        }

        self.dayBtn.isSelected = false
    }

    internal func bind(dateStr: String, index _: Int) {
        if !dateStr.isEmpty {
            self.cellDate = dateStr.toDate(dateFormat: "yyyy-MM-dd")!
            self.dayBtn.setTitle(self.cellDate.toString(dateFormat: "d"), for: .normal)

//            if dateStr == selectedDate {
//                self.dayBtn.isSelected = true
//                self.dayBtn.setTitleColor(.white, for: .normal)
//            } else {
//                self.dayBtn.isSelected = false
//                let day = Calendar.current.component(.weekday, from: self.cellDate)
//                if day == 1 { // 일요일 표시
//                    self.dayBtn.setTitleColor(UIColor(red: 255, green: 0, blue: 0), for: .normal)
//                } else if day == 7 { // 토요일 표시
//                    self.dayBtn.setTitleColor(UIColor(red: 0, green: 145, blue: 255) , for: .normal)
//                } else {
//                    self.dayBtn.setTitleColor(UIColor(red: 108, green: 108, blue: 108), for: .normal)
//                }
//            }

            _ = Calendar.current
            //            if calendar.compare(Date(), to: self.cellDate, toGranularity: .day) == .orderedDescending {
            //                self.dateBtn.isEnabled = false
            //            } else {
//            let checkArray = reservationDateList.filter { $0.contains(dateStr) }
//            self.dayBtn.isEnabled = !checkArray.isEmpty
            //            }
        } else {
            self.dayBtn.isSelected = false
            self.dayBtn.setTitle("", for: .normal)
        }
    }
}
