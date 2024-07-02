import RxSwift

class ThirdCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    var changeColor: Bool = false
    
    override func start() {
        print(#fileID, #function, #line, "-first ")
        let viewController = ThirdVC(changeColor: changeColor)

        let viewModel = ThirdViewModel()
        viewController.viewModel = viewModel
        
        // Coordinator subscribes to events and notifies parentCoordinator
        viewModel.buttonTapped
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SignInListener)?.thirdVCButtonTapped()
            })
            .disposed(by: self.disposeBag)
        
        viewModel.reuseButtonTapped
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SignInListener)?.reuseVCButtonTapped()
            })
            .disposed(by: self.disposeBag)
        
        self.navigationController.viewControllers = [viewController]
    }
    
    init(changeColor: Bool) {
        self.changeColor = changeColor
    }
}
