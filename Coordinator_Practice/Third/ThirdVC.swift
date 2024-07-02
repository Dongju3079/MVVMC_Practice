import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ThirdVC: UIViewController {
    
    private let defaultButton = CustomButton(type: .start)
    private let reuseButton = CustomButton(type: .reuse)
    
    private lazy var buttonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [defaultButton, reuseButton])
        sv.axis = .horizontal
        sv.spacing = 50
        sv.alignment = .fill
        sv.distribution = .fillEqually
        return sv
    }()
    
    var viewModel: ThirdViewModel?
    var disposeBag = DisposeBag()
    
    init(changeColor: Bool) {
        super.init(nibName: nil, bundle: nil)
        
        if changeColor {
            changeBackColor()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "-viewDid ")
        setupUI()
        bindInputEvent()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemPink
        self.view.addSubview(buttonStackView)
        
        defaultButton.snp.makeConstraints { make in
            make.width.height.equalTo(100)
        }
        
        buttonStackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    private func bindInputEvent() {
        self.defaultButton.rx.tap
            .asDriver()
            .drive(with: self, onNext: { vc, _ in
                vc.viewModel?.buttonTapped.onNext(())
            })
            .disposed(by: disposeBag)
        
        self.reuseButton.rx.tap
            .asDriver()
            .drive(with: self, onNext: { vc, _ in
                vc.viewModel?.reuseButtonTapped.onNext(())
            })
            .disposed(by: disposeBag)
    }
    
    private func changeBackColor() {
        let randomColor: [UIColor] = [.black, .blue, .brown,
                                      .cyan, .systemGray2, .systemGreen,
                                      .systemIndigo, .systemPurple]
        
        self.view.backgroundColor = randomColor.randomElement()
    }
    
}
