import UIKit
import Cartography

class ProgressBarView: UIView {
    
    // MARK: - NSObject
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        addSubview(dividerLine)
        addSubview(dummyLabel)
    }
    
    // MARK: - Subviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        constrain(dividerLine, dummyLabel) { divider, label in
            divider.width   == divider.superview!.width
            divider.height  == 0.5
            divider.top     == divider.superview!.top
            divider.centerX == divider.superview!.centerX
            
            label.width   == label.superview!.width
            label.height  == 30.0
            label.centerX == label.superview!.centerX
            label.centerY == label.superview!.centerY
        }
    }
    
    fileprivate lazy var dummyLabel: UILabel = {
        let dummyLabel = UILabel(frame: .zero)
        dummyLabel.font = UIFont(name: "HelveticaNeue", size: 15.0)
        dummyLabel.text = "Progress Bar Dummy Label"
        dummyLabel.textAlignment = .center
        
        return dummyLabel
    }()
    
    fileprivate lazy var dividerLine: UIView = {
        let dividerLine = UIView(frame: .zero)
        dividerLine.backgroundColor = UIColor(white: 0.5, alpha: 1.0)
        
        return dividerLine
    }()
}
