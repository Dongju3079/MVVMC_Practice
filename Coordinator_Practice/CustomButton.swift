import UIKit

class CustomButton: UIButton {
    
    enum ButtonType {
        case basic
        case start
        case reuse
        
        var title: String {
            switch self {
            case .basic:
                "다음"
            case .start:
                "처음"
            case .reuse:
                "재사용"
            }
        }
    }
    
    init(type: ButtonType) {
        
        super.init(frame: .zero)
        
        self.setTitle(type.title, for: .normal)
        self.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.layer.cornerRadius = 10
        self.layer.masksToBounds = true
        self.backgroundColor = .systemYellow
        self.setTitleColor(.black, for: .normal)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
