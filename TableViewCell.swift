
import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var Label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(labelTapped))
    Label.addGestureRecognizer(tapGesture)
    Label.isUserInteractionEnabled = true
        
    for subview in subviews {
    if NSStringFromClass(type(of: subview)) == "UISwipeActionPullView" {
    subview.frame = bounds
    }
    }
    }
        
    @objc func labelTapped() {
    }
        
    override func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
    if gestureRecognizer is UISwipeGestureRecognizer && touch.view == Label {
    return false
    }
    return true
    }
    }

