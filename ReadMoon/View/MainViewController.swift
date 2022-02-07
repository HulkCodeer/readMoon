//
//  ViewController.swift
//  ReadMoon
//
//  Created by 박현진 on 2021/10/23.
//

import UIKit
import Then
import ReusableKit
import SnapKit

internal final class MainViewController: UIViewController {
    private enum Reusable {
        static let calendarCell = ReusableCell<CalendarCell>(nibName: CalendarCell.reuseID)
    }
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
            $0.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 84)
            $0.sectionInsetReference = .fromSafeArea
            $0.minimumInteritemSpacing = 0
            $0.minimumLineSpacing = 0
            $0.sectionInset = .zero
        }
    ).then {
        $0.register(Reusable.calendarCell)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentInsetAdjustmentBehavior = .automatic
        $0.contentInset = .zero
        $0.backgroundColor = .white
        $0.showsHorizontalScrollIndicator = false
        $0.alwaysBounceVertical = true
    }
    
    private var calendarDayArray: [String] = .init()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.calendarDayArray.removeAll()
        
        let dateFormatter = DateFormatter()
        let date = Date()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let calendar = Calendar.current
        let startComponents = calendar.dateComponents([.year, .month], from: date)
        let startOfMonth = calendar.date(from: startComponents)!

        var endComponents = DateComponents()
        endComponents.month = 1
        endComponents.day = -1
        let endOfMonth = calendar.date(byAdding: endComponents, to: startOfMonth) ?? Date()

        let startOfWeekDay = calendar.component(.weekday, from: startOfMonth) - 1

        var addingDate = startOfMonth

        // 6주 기준 42일
        for i in 0 ..< 42 {
            if i < startOfWeekDay {
                self.calendarDayArray.append("")
            } else if i == startOfWeekDay {
                self.calendarDayArray.append(dateFormatter.string(from: startOfMonth))
            } else {
                var addComponents = DateComponents()
                addComponents.day = 1
                if let _addingDate = calendar.date(byAdding: addComponents, to: addingDate) {
                    addingDate = _addingDate
                    let compareResult = calendar.compare(_addingDate, to: endOfMonth, toGranularity: .month)
                    if compareResult == .orderedSame {
                        self.calendarDayArray.append(dateFormatter.string(from: _addingDate))
                    } else {
                        break
                    }
                } else {
                    break
                }
            }
        }
//
//        if calendar.compare(Date(), to: startOfMonth, toGranularity: .month) == .orderedSame
//            || calendar.compare(Date(), to: startOfMonth, toGranularity: .month) == .orderedDescending {
//            self.calendarHeaderPrevBtn.btn.isEnabled = false
//            self.calendarHeaderPrevBtn.IBimageColor = Colors.contents02xA3A3A3.color
//        } else {
//            self.calendarHeaderPrevBtn.btn.isEnabled = true
//            self.calendarHeaderPrevBtn.IBimageColor = Colors.contents10x2D2D2D.color
//        }
//
//        let currentPlus30Components = DateComponents()
//        endComponents.day = 30
//        let plus30Date = calendar.date(byAdding: currentPlus30Components, to: Date()) ?? Date()
//        let compareResult = calendar.compare(self.currentDate, to: plus30Date, toGranularity: .month)
//        if compareResult == .orderedSame || compareResult == .orderedAscending {
//            self.calendarHeaderNextBtn.btn.isEnabled = true
//            self.calendarHeaderNextBtn.IBimageColor = Colors.contents10x2D2D2D.color
//        } else {
//            self.calendarHeaderNextBtn.btn.isEnabled = false
//            self.calendarHeaderNextBtn.IBimageColor = Colors.contents02xA3A3A3.color
//        }
//
//        self.calendarHeaderTitleLbl.text = "\(startOfMonth.toString(dateFormat: "yyyy")).\(startOfMonth.toString(dateFormat: "MM"))"

        self.collectionView.reloadData()
        
    }
}


extension MainViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        return self.calendarDayArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = collectionView.dequeue(Reusable.calendarCell, for: indexPath)
        cell.bind(dateStr: self.calendarDayArray[indexPath.row], index: index)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let index = indexPath.row
        
        let calendarCellWith = (UIScreen.main.bounds.width - 58) / 7
        let calendarCellHeight = (32 / 34) * calendarCellWith
        return CGSize(width: calendarCellWith, height: calendarCellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DidSelectItem")
    }
}
