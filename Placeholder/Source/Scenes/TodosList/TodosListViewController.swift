//
//  TodosListViewController.swift
//  Placeholder
//
//  Created by Eduardo Iglesias Fernández on 10/06/2020.
//  Copyright (c) 2020 Rindus. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol TodosListDisplayLogic: class {
    func displayNavBarData(_ viewModel: TodosList.UpdateNavBar.ViewModel)
    func displayNoDataText(_ viewModel: TodosList.SetText.ViewModel)
    func displayFetchedTodos(_ viewModel: TodosList.FetchTodos.ViewModel)
    func displayCreateTodo(_ viewModel: TodosList.CreateTodo.ViewModel)
    func displayCreatePopup(_ viewModel: TodosList.LaunchCreatePopup.ViewModel)
}

class TodosListViewController: UIViewController {
    var interactor: TodosListBusinessLogic?
    var router: (NSObjectProtocol & TodosListRoutingLogic & TodosListDataPassing)?
    var todoList: [Todo] = []
    var newTodoText: String = ""
    
    private var viewModel: TodosList.FetchTodos.ViewModel?
    
    // MARK: - Outlets
    
    @IBOutlet weak var customNV: CustomNavigationBar!
    @IBOutlet weak var activitiIndicator: UIActivityIndicatorView!
    @IBOutlet weak var todosTableView: UITableView!
    @IBOutlet weak var noTodosLabel: UILabel!
    @IBOutlet weak var createTodoButton: UIImageView!
    
    // MARK: - Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupScene()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupScene()
    }
    
    // MARK: - Setup
    
    private func setupScene() {
        let viewController = self
        let interactor = TodosListInteractor()
        let presenter = TodosListPresenter()
        let router = TodosListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
        
    }
    
    func setupView() {
        todosTableView.register(TodosListTableViewCell.self )
        todosTableView.delegate = self
        todosTableView.dataSource = self
        customNV.delegate = self
        
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.addTarget(self, action: #selector(launchCreatePopUp))
        createTodoButton.addGestureRecognizer(tapGesture)
        createTodoButton.isUserInteractionEnabled = true
        
        applyStyle()
    }
    
    // MARK: Private methods

    fileprivate func reloadData() {
        noTodosLabel(hide: self.todoList.count > 0)
        
        todosTableView.reloadData()
        activitiIndicator.stopAnimating()
        todosTableView.isHidden = !(self.todoList.count > 0)
        createTodoButton.isHidden = !(self.todoList.count > 0)
    }
    
     fileprivate func noTodosLabel(hide: Bool) {
         noTodosLabel.isHidden = hide
     }
    
    fileprivate func applyStyle() {
        view.backgroundColor = UIColor.lightgrey
        todosTableView.tableFooterView = UIView(frame: .zero)
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateNavBar()
        setNoDataText()
        fetchedTodosAction()
    }
    
    @objc func launchCreatePopUp() {
       requestToLaunchCreatePopUp()
    }
    
    // MARK: - Requests
    
    private func updateNavBar() {
        let request = TodosList.UpdateNavBar.Request()
        interactor?.getNavBarData(request)
    }
    
    private func setNoDataText() {
        let request = TodosList.SetText.Request()
        interactor?.getNoDataText(request)
    }
    
    private func requestToFetchTodos() {
        let request = TodosList.FetchTodos.Request()
        interactor?.fetchTodos(request)
    }
   
    private func requestToLaunchCreatePopUp() {
      let request = TodosList.LaunchCreatePopup.Request()
      interactor?.getCreatePopUpText(request)
    }
    
    private func requestToCreateTodo(newTodo: Todo) {
        let request = TodosList.CreateTodo.Request(newTodoData: newTodo)
      interactor?.getCreateTodo(request)
    }
    
    private func requestToSelectTodo(by indexPath: IndexPath) {
      let request = TodosList.SelectTodo.Request(index: indexPath.row)
      interactor?.selectTodo(request)
    }
    
    // MARK: - Alert
    
    func showAlert(title: String, message: String, cancelButtonText: String?, actionButtonText: String?, complention: (() -> Void)?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let alertCancel = UIAlertAction(title: cancelButtonText, style: .default, handler: nil)
        
        let alertAction = UIAlertAction(title: actionButtonText, style: .default, handler: { (_) in
            complention?()
        })
        
        alert.addAction(alertCancel)
        alert.addAction(alertAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    @objc func createTodoAction() {
        let newTodo:Todo = Todo(userId: 0, id: 0, title: self.newTodoText, completed: false)
        self.requestToCreateTodo(newTodo: newTodo)
    }
    
    @objc func fetchedTodosAction() {
        todosTableView.isHidden = true
        noTodosLabel.isHidden = true
        createTodoButton.isHidden = true
        activitiIndicator.isHidden = false
        activitiIndicator.startAnimating()
        
        requestToFetchTodos()
    }
    
    // MARK: - UsersListDisplayLogic
}
extension TodosListViewController: TodosListDisplayLogic {
    
    func displayNavBarData(_ viewModel: TodosList.UpdateNavBar.ViewModel) {
        customNV.updateUI(data: viewModel.navData)
    }
    
    func displayNoDataText(_ viewModel: TodosList.SetText.ViewModel) {
        noTodosLabel.text = viewModel.noDataText
    }
    
    func displayCreatePopup(_ viewModel: TodosList.LaunchCreatePopup.ViewModel) {
        let alert = UIAlertController(title: viewModel.popupTitle, message: "", preferredStyle: .alert)

        alert.addTextField { (textField) in
            textField.text = ""
        }

        alert.addAction(UIAlertAction(title: viewModel.popupCancelText, style: .default, handler: nil))
        
        alert.addAction(UIAlertAction(title: viewModel.popupCreateText, style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields?[0]
            self.newTodoText = textField?.text ?? ""
            self.createTodoAction()
        }))

        self.present(alert, animated: true, completion: nil)
    }
    
    func displayCreateTodo(_ viewModel: TodosList.CreateTodo.ViewModel) {
        self.todoList = viewModel.todos
        reloadData()
        if viewModel.error != "error.message.noerror".localized {
            showAlert(title: "error.title".localized, message: viewModel.error, cancelButtonText: "error.button.cancel".localized, actionButtonText: "error.button.tryagain".localized, complention: createTodoAction)
        }
    }
    
    func displayFetchedTodos(_ viewModel: TodosList.FetchTodos.ViewModel) {
        self.todoList = viewModel.todos
        reloadData()
        if viewModel.error != "error.message.noerror".localized {
            showAlert(title: "error.title".localized, message: viewModel.error, cancelButtonText: "error.button.cancel".localized, actionButtonText: "error.button.tryagain".localized, complention: fetchedTodosAction)
        }
    }
}


// MARK: - Delegates

extension TodosListViewController: CustomNavigationBarDelegate {
        func backButtonAction() {
        self.dismiss(animated: true)
    }
    
        func rightButtonAction() {
            self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
            
    }
    
}

extension TodosListViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.CellIHeights.TodosList
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let todo = self.todoList[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodosListTableViewCell.cellIdentifier) as? TodosListTableViewCell else {
            return UITableViewCell()
        }

        
        cell.updateUI(item: todo)
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        requestToSelectTodo(by: indexPath)
    }
}
