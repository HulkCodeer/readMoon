//
//  CommonBaseCollectionViewCell.swift
//  ReadMoon
//
//  Created by 박현진 on 2022/02/08.
//

import UIKit
import RxSwift

internal class CommonBaseCollectionViewCell: UICollectionViewCell {
    internal var cellDisposeBag = DisposeBag()

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
        print("\(type(of: self)): Deinited")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.cellDisposeBag = DisposeBag()
    }

    override var bounds: CGRect {
        didSet {
            self.contentView.frame = self.bounds
        }
    }

    internal func makeUI() {
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
