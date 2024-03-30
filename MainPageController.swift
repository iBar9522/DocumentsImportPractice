//
//  MainPageController.swift
//  DocumentsImportPractice
//
//  Created by Aibar Abylgazin on 29.03.2024.
//

import UIKit
import SnapKit

final class MainPageController: UIViewController {

    // MARK: - Private Properties
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Press", for: .normal)
        button.backgroundColor = .blue
        button.addTarget(self, action: #selector(buttonIsTapped), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
}

// MARK: - UIDocumentPickerDelegate

extension MainPageController: UIDocumentPickerDelegate {
    
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentsAt urls: [URL]) {
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: urls.first!.absoluteString)) else {
            debugPrint("Could not convert url to data")
            return
        }
        debugPrint(data)
    }
}

// MARK: - Actions

private extension MainPageController {
    
    @objc func buttonIsTapped() {
        let documentPickerVC = UIDocumentPickerViewController(forOpeningContentTypes: [.pdf, .png])
        documentPickerVC.delegate = self
        navigationController?.present(documentPickerVC, animated: true)
    }
}

// Private Extension

private extension MainPageController {
    
    func setViews() {
        view.addSubview(button)
        button.snp.makeConstraints {
            $0.width.equalTo(200.0)
            $0.height.equalTo(56.0)
            $0.centerY.centerX.equalToSuperview()
        }
    }
}
