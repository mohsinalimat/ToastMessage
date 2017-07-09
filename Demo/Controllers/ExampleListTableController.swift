//
//  ExampleListTableController.swift
//  ToastMessage
//
//  Created by Sergey Shatunov on 7/8/17.
//  Copyright © 2017 SHS. All rights reserved.
//

import UIKit

class ExampleListTableController: UITableViewController {

    private enum Sections: Int {
        case toast
        case notification

        func title() -> String {
            switch self {
            case .toast:
                return "Toasts"
            case .notification:
                return "Notificaitons"
            }
        }

        func segueName() -> String {
            switch self {
            case .toast:
                return "ToastSegue"
            case .notification:
                return "NotificationSegue"
            }
        }

        static func count() -> Int {
            return 2
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = Sections(rawValue: indexPath.section)?.title()
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        guard let section = Sections(rawValue: indexPath.section) else {
            return
        }

        self.performSegue(withIdentifier: section.segueName(), sender: self)
    }

}
