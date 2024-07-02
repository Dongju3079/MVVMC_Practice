import UIKit
import SnapKit
import RxSwift
import RxCocoa

class FirstVC: UIViewController {
    
    private let button = CustomButton(type: .basic)
    
    var viewModel: FirstViewModel?
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#fileID, #function, #line, "-viewDid ")
        setupUI()
        bindInputEvent()
    }
    
    private func setupUI() {
        self.view.backgroundColor = .systemCyan
        self.view.addSubview(button)
        
        button.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
            make.width.height.equalTo(100)
        }
    }
    
    private func bindInputEvent() {
        self.button.rx.tap
            .asDriver()
            .drive(with: self, onNext: { vc, _ in
                vc.viewModel?.buttonTapped.onNext(())
            })
            .disposed(by: disposeBag)
    }
    
}
