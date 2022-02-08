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
        
    private lazy var headerTotalView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var calendarIconImgView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "calendarIcon")
        $0.contentMode = .scaleToFill
    }
    
    private lazy var titleLbl = UILabel().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "캘린더"
        $0.font = UIFont.systemFont(ofSize: 24)
        $0.textColor = UIColor(red: 24, green: 24, blue: 24)
    }
    
    private lazy var calendarMoveTotalView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var calendarLeftArrowImgView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "calendarLeftArrow")
        $0.contentMode = .scaleToFill
    }
    
    private lazy var calendarRightArrowImgView = UIImageView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(named: "calendarRightArrow")
        $0.contentMode = .scaleToFill
    }
    
    private lazy var weekTitleTotalView = UIView().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .vertical
            $0.estimatedItemSize = CGSize(width: UIScreen.main.bounds.width, height: 60)
            $0.sectionInsetReference = .fromSafeArea
            $0.minimumInteritemSpacing = 3
            $0.minimumLineSpacing = 3
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
        $0.delegate = self
        $0.dataSource = self
    }
    
    private var calendarDayArray: [String] = .init()
    
    override func loadView() {
        super.loadView()
            
        self.view.addSubview(self.headerTotalView)
        self.headerTotalView.snp.makeConstraints {
            $0.leading.trailing.top.equalToSuperview()
            let window = UIApplication.shared.windows.first { $0.isKeyWindow }
            let topPadding = window?.safeAreaInsets.top ?? 0
            $0.height.equalTo(topPadding + 60)
        }
        
        self.headerTotalView.addSubview(self.calendarIconImgView)
        self.calendarIconImgView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.equalTo(32)
        }
        
        self.headerTotalView.addSubview(self.titleLbl)
        self.titleLbl.snp.makeConstraints {
            $0.leading.equalTo(self.calendarIconImgView.snp.trailing).offset(6)
            $0.centerY.equalTo(self.calendarIconImgView.snp.centerY)
            $0.height.equalTo(26)
        }
        
        self.view.addSubview(self.calendarMoveTotalView)
        self.calendarMoveTotalView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.top.equalTo(self.headerTotalView.snp.bottom)
            $0.height.equalTo(60)
        }
        
        self.calendarMoveTotalView.addSubview(self.calendarLeftArrowImgView)
        self.calendarLeftArrowImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(20)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.equalTo(30)
        }
        
        self.calendarMoveTotalView.addSubview(self.calendarRightArrowImgView)
        self.calendarRightArrowImgView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-20)
            $0.bottom.equalToSuperview().offset(-14)
            $0.width.height.equalTo(30)
        }
        
        self.view.addSubview(self.weekTitleTotalView)
        self.weekTitleTotalView.snp.makeConstraints {
            $0.top.equalTo(self.calendarMoveTotalView.snp.bottom)
            $0.leading.equalToSuperview()            
            $0.width.height.equalTo(30)
        }
        
        self.view.addSubview(self.collectionView)
        self.collectionView.snp.makeConstraints {
            $0.top.equalTo(self.weekTitleTotalView.snp.bottom)
            $0.leading.equalToSuperview().offset(11)
            $0.trailing.equalToSuperview().offset(-10)
            $0.bottom.equalToSuperview()
        }
    }

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
        let cellWith = (UIScreen.main.bounds.width - (6 * 3) - 21) / 7
        let cellHeight = (60 / 48) * cellWith
        return CGSize(width: cellWith, height: cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("DidSelectItem")
    }
}
