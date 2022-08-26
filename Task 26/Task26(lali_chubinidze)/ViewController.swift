import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!

    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    private var model = [Notes]()
    var segmentControl = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "My Notes"
        tableView.delegate = self
        tableView.dataSource = self
        getAllNote()
    }
// MARK: - Add Note

    @IBAction func addNote(_ sender: Any) {
        let alert = UIAlertController(title: "Add New Note", message: "Enter new note", preferredStyle: .alert)
        alert.addTextField { field in
            field.placeholder = "note name"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel,handler: nil))
        alert.addAction(UIAlertAction(title: "Create",style: .default,handler: { _ in
            guard let field = alert.textFields?.first, let text = field.text, !text.isEmpty else{
                return
            }
            self.createNote(title: text, created: "", isFavourite: false)

            if self.segmentControl == 0 {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }else {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                    self.getDataUsingPredicate()
                }
            }
        }))
        present(alert,animated: true)
    }

// MARK: - SegmentedControl
    @IBAction func changeSegment(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            segmentControl = 0
            getAllNote()
        }else if sender.selectedSegmentIndex == 1{
            segmentControl = 1
            getDataUsingPredicate()
        }
    }

    func getAllNote() {
        do{
            model = try context.fetch(Notes.fetchRequest())

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }catch{
            print(error)
        }
    }

    func getDataUsingPredicate() {
        let request = Notes.fetchRequest()
        let mulutiPredicate = NSPredicate(format: "isFavourite == YES")
        request.predicate = mulutiPredicate
        let notes = try! context.fetch(request)
        self.model = notes
        tableView.reloadData()
    }
// MARK: - Create, Delete, Edit

    func createNote(title:String,created:String,isFavourite: Bool) {
        let newNote = Notes(context: context)
        newNote.title = title
        newNote.created = created
        newNote.isFavourite = isFavourite

        do{
            try context.save()
            getAllNote()

        }catch{
            print(error)
        }
    }

    func deleteNote(note:Notes) {
        context.delete(note)
        do{
           try context.save()
            getAllNote()
        }catch{
            print(error)
        }
    }

    func editNote(note:Notes, newTitle:String, isFavourite:Bool) {
        note.title = newTitle
        note.isFavourite = isFavourite
        do {
            try context.save()
            getAllNote()
        }catch{
            print(error)
        }
    }
}
// MARK: - Extension

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotesCell") as! NotesCell
        cell.textLabel?.text = model[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let note = model[indexPath.row]
        let sheet = UIAlertController(title: "Edit your note",
                                      message: nil,
                                      preferredStyle: .actionSheet)
        sheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        sheet.addAction(UIAlertAction(title: "Edit", style: .default, handler: { _ in
            let alert = UIAlertController(title: "Edit Note",
                                          message: "Edit your note",
                                          preferredStyle: .alert)
            alert.addTextField(configurationHandler: nil)
            alert.textFields?.first?.text = note.title
            alert.addAction(UIAlertAction(title: "Save", style: .cancel, handler: {[weak self] _ in
                guard let field = alert.textFields?.first, let newTitle = field.text, !newTitle.isEmpty else{
                    return
                }

                self?.editNote(note: note, newTitle: newTitle, isFavourite: false)

            }))
            self.present(alert,animated: true)

        }))
        sheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: {[weak self] _ in
            self?.deleteNote(note: note)
        }))
        present(sheet, animated: true)
    }

    // MARK: - Favourite or UnFavourite

    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let note = model[indexPath.row]
        var favourite = UIContextualAction(style: .normal, title: "⭐️") { _, _, completion in
            guard let newTitle = note.title else {
                return
            }
            
            self.editNote(note: self.model[indexPath.row], newTitle:newTitle , isFavourite: true)
            completion(true)
        }
        if self.model[indexPath.row].isFavourite == true{
            let note = model[indexPath.row]
            favourite = UIContextualAction(style: .normal, title: "★") { _, _, completion in
                guard let newTitle = note.title else {
                    return
                }

                self.editNote(note: self.model[indexPath.row], newTitle: newTitle , isFavourite: false)
                if self.segmentControl == 0 {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }else {
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                        self.getDataUsingPredicate()
                    }
                }
                completion(true)
            }
        }
        let swipeConf = UISwipeActionsConfiguration (actions: [favourite])
        return swipeConf
    }
}

