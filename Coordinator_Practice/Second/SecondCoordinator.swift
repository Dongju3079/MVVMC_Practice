import RxSwift

class SecondCoordinator: BaseCoordinator {
    
    private let disposeBag = DisposeBag()
    
    override func start() {
        print(#fileID, #function, #line, "-first ")
        let viewController = SecondVC()

        let viewModel = SecondViewModel()
        viewController.viewModel = viewModel
        
        // Coordinator subscribes to events and notifies parentCoordinator
        viewModel.buttonTapped
            .subscribe(onNext: { [weak self] in
                guard let self = self else { return }
                self.navigationController.viewControllers = []
                self.parentCoordinator?.didFinish(coordinator: self)
                (self.parentCoordinator as? SignInListener)?.secondVCButtonTapped()
            })
            .disposed(by: self.disposeBag)
        
        self.navigationController.viewControllers = [viewController]
    }
}
