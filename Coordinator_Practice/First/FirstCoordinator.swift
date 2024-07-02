import RxSwift

class FirstCoodinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        print(#fileID, #function, #line, "-first ")
        let viewController = FirstVC()

        let viewModel = FirstViewModel()
        viewController.viewModel = viewModel
        
        // Coordinator subscribes to events and notifies parentCoordinator
        viewModel.buttonTapped
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SignInListener)?.firstVCButtonTapped()
            })
            .disposed(by: self.disposeBag)
        
        self.navigationController.viewControllers = [viewController]
    }
}
