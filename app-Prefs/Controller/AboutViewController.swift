//  )=======_.:   .. . . ..  .   . ... ..`..: ::.:.::.. :... ... :..._xX====X==
//  )o=========X1.__,._..:  .  .    . . .. .          ..._.,,:xs_x==X=X========
//  )n===========X====X}     .-qag, .  .   . . ._qaaa`..  .uX======X===========
//  )n================'.   .  .)xXXmmmme*mm##mmmmm##Z     .x===================
//  )o===============^.   .  . ]g{???V?m{m#Z#SZT#XY?'.     )===================
//  )o==============r   . qp    )s\]"$bw]#m7#m#P^a\r.   _g; $=X================
//  )n==============[     ."5a   -4%(ggg,)(,_ggg7a(   qJ? .::?X================
//  )n==========XXr-.   .    "Aa   "b<w##?!4mmmS2`  qJ?`  .  :{uX==============
//  )=========I-- .       . . `!#a  )NX#P-p4##Z^  aw?-. .    .-=-<X============
//  )n====r-^ . .   .   .       ~Y#a  )4b  Jm?  qmY>`        . :.  .+--{X======
//  )n}-. . .    . .   .      .   <Y#g.    .  aZU}'    .  . .          . --*===
//  )^.        .           . .   . ]5?Wa    am!^`                 .     ..  .+<
//        .  .      .  .  .     .    -;!#agW7`-.       . .    . .    . .   .
//      .       .  .     .             .a#P`,.             .       .         .
//     .   . .         .     .   .  . a#Y5s)WLp     .  .     .   .   .  . .
//    .         . .        .  .,   .gWZ(/' ?iY#L,  ._,    .    .             .
//       .  .  .     . .     .],._ao21P'    /4{1Xap _f.  .   .     . . . .  .
//      .           .     ._._g)5#ZXo~        -{dZXo!sgg,   .   . .
//    .     .  .  .    .  .;-H3~9p)^qag^  . ]qgg?\_@^53( . ,.  .           .
//      .  .         .:_<#I(+(==,-^`<,.. .   .jp ^`.,=+`<)qp,;      . . .    .
//     .      .  . . ;=uK{=+|._:=.. .-.     . .   .`=:_(=|+Ju>,.  .        .
//    .     .   .   ::;===I._*(  .  .     .      . .._S===cj+' =       .     .
//        .    .      - /-9'.:. .  .   . .     .     . :.~?:.--.  .  .    .
//                 . <qa"'. .   .     .      .   . .  .  .-^ggp        .    .
//
//  AboutViewController.swift
//  app-Prefs
//
//  Created by 成殿 on 2017/2/5.
//  Copyright © 2017年 成璐飞. All rights reserved.
//

import UIKit
import RealmSwift
import MessageUI
import SVProgressHUD

// MARK: - display cells
// reset
// export & share
// import form URL
// email me to ask a Application's recommended settings

class AboutViewController: UIViewController {
    
    var documentController: UIDocumentInteractionController?
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height), style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        return tableView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        view.addSubview(tableView)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AboutViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 5 : 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        }
        cell?.accessoryType = .disclosureIndicator
        if indexPath.section == 0 {
            switch indexPath.row {
            case 0:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "Reset Config.")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "Reset to you first installed App's config.")
            case 1:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "Share Config.")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "Export config to a plist file and share it.")
            case 2:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "Download Config.")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "Download a config.")
            case 3:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "Wanted Help.")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "Email me or open a issue in github.")
            case 4:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "Switch Languages.")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "Default, Chinese or English.")
            default: break
            }
        } else {
            switch indexPath.row {
            case 0:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "致谢 @StackOverflowError")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "")
            case 1:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "app-tutorials")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "app-tutorials is is the basis FastOpen")
            case 2:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "Retriever")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "Retriever is An effective tool for finding App's URL-Schemes")
            case 3:
                cell?.textLabel?.text = SwitchLanguageTool.getLocalString(of: "Pin")
                cell?.detailTextLabel?.text = SwitchLanguageTool.getLocalString(of: "Pin is a amazing Application.")
            default: break
            }
        }
        cell?.detailTextLabel?.adjustsFontSizeToFitWidth = true
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let realm = try! Realm()
            
            switch indexPath.row {
            case 0:
                // reset
                
                let alertC = UIAlertController(title: SwitchLanguageTool.getLocalString(of: "Warning"), message: SwitchLanguageTool.getLocalString(of: "ReserWarning"), preferredStyle: .alert)
                let cancelAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Cancel"), style: .cancel, handler: { (_) in
                })
                let sureAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Sure"), style: .destructive, handler: { (_) in
                    
                    SVProgressHUD.show()
                    
                    try! realm.write {
                        realm.deleteAll()
                    }
                    let settings = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Settings", ofType: ".plist")!) as? Dictionary<String, AnyHashable>
                    
                    for dict in (settings?["settings"] as! Array<Dictionary<String, AnyHashable>>) {
                        let model = Setting()
                        model.name = dict["name"] as! String
                        model.action = dict["action"] as! String
                        model.isDeleted = dict["isDeleted"] as! Bool
                        model.type = dict["type"] as! String
                        model.sortNum = dict["sortNum"] as! NSNumber
                        try! realm.write {
                            realm.add(model, update: true)
                        }
                    }
                    
                    if realm.objects(Setting.self).filter("type == 'clipboard'").count == 0 {
                        for i in 0...2 {
                            let model = Setting()
                            switch i {
                            case 0:
                                model.name = "Open URL Scheme from Clipboard."
                                model.action = "Open URL Scheme from Clipboard."
                                break
                            case 1:
                                model.name = "Search Keyword in Clipboard by Google."
                                model.action = "https://google.com/search?q="
                                break
                            case 2:
                                model.name = "JSON tree view."
                                model.action = "FastOpenJSON://"
                                break
                            default: break
                            }
                            model.type = ActionType.clipboard.rawValue
                            model.sortNum = -1
                            model.isDeleted = true
                            try! realm.write {
                                realm.add(model, update: true)
                            }
                        }
                    }
                    
                    SVProgressHUD.showSuccess(withStatus: SwitchLanguageTool.getLocalString(of: "Success!"))
                })
                
                alertC.addAction(sureAction)
                alertC.addAction(cancelAction)
                
                present(alertC, animated: true, completion: {
                })
                
                break
            case 1:
                // share
                
                SVProgressHUD.show()
                let dict = NSMutableDictionary()
                dict.setValue("app-Prefs", forKey: "name")
                
                let arr = NSMutableArray()
                
                let models = realm.objects(Setting.self)
                for model in models {
                    let tempDict = NSMutableDictionary()
                    tempDict.setValue(model.name, forKey: "name")
                    tempDict.setValue(model.action, forKey: "action")
                    tempDict.setValue(model.isDeleted, forKey: "isDeleted")
                    tempDict.setValue(model.sortNum, forKey: "sortNum")
                    tempDict.setValue(model.type, forKey: "type")
                    arr.add(tempDict)
                }
                
                dict.setValue(arr, forKey: "settings")
                
                let tempPath = NSTemporaryDirectory()
                let path = tempPath+"/app-Prefs.plist"
                if FileManager.default.fileExists(atPath: path) {
                    try! FileManager.default.removeItem(atPath: path)
                }
                let ret = dict.write(toFile: tempPath+"/app-Prefs.plist", atomically: true)
                print(ret)
                
                if ret == true {
                    documentController = UIDocumentInteractionController(url: URL.init(fileURLWithPath: path))
                    SVProgressHUD.dismiss()
                    documentController!.presentOptionsMenu(from: view.bounds, in: view, animated: true)
                } else {
                    SVProgressHUD.showError(withStatus: SwitchLanguageTool.getLocalString(of: "Error!"))
                }
                
                print(tempPath)
                break
            case 2:
                
                // download
                var textField: UITextField?
                let alertC = UIAlertController(title: SwitchLanguageTool.getLocalString(of: "Download"), message: SwitchLanguageTool.getLocalString(of: "please type config's URL"), preferredStyle: .alert)
                alertC.addTextField(configurationHandler: { (tf) in
                    textField = tf
                })
                let cancelAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Cancel"), style: .cancel, handler: { (_) in
                })
                let sureAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Sure"), style: .destructive, handler: { (_) in
                    SVProgressHUD.show()
                    let sessionConfig = URLSessionConfiguration.default
                    let session = URLSession(configuration: sessionConfig)
                    let task = session.downloadTask(with: URL.init(string: (textField?.text!)!)!, completionHandler: { (url, response, error) in
                        print(url ?? error ?? "nil")
                        if error != nil {
                            SVProgressHUD.showError(withStatus: SwitchLanguageTool.getLocalString(of: error!.localizedDescription))
                            print(error!.localizedDescription)
                            return
                        }
                        if FileManager.default.fileExists(atPath: NSTemporaryDirectory()+"app-Prefs.plist") {
                            try! FileManager.default.removeItem(atPath: NSTemporaryDirectory()+"app-Prefs.plist")
                        }
                        try! FileManager.default.moveItem(at: url!, to: URL.init(fileURLWithPath: NSTemporaryDirectory()+"app-Prefs.plist"))
                        let fileUrl = URL.init(fileURLWithPath: NSTemporaryDirectory()+"app-Prefs.plist")
                        
                        if let dict = NSDictionary(contentsOf: fileUrl) as? Dictionary<String, AnyObject> {
                            if dict.keys.contains("name") && dict.keys.contains("settings") {
                                if (dict["name"] as! String == "app-Prefs") && (dict["settings"]?.isKind(of: NSArray.self))! {
                                    let tempArr = dict["settings"] as! NSArray
                                    var ret = true
                                    for tempDict in tempArr {
                                        if (tempDict as AnyObject).isKind(of: NSDictionary.self) {
                                            if ((tempDict as! NSDictionary).allKeys as NSArray).contains("action") && ((tempDict as! NSDictionary).allKeys as NSArray).contains("name") && ((tempDict as! NSDictionary).allKeys as NSArray).contains("isDeleted") && ((tempDict as! NSDictionary).allKeys as NSArray).contains("sortNum") && ((tempDict as! NSDictionary).allKeys as NSArray).contains("type") {
                                                if ((tempDict as! NSDictionary)["action"] as AnyObject).isKind(of: NSString.self) && ((tempDict as! NSDictionary)["name"] as AnyObject).isKind(of: NSString.self) && ((tempDict as! NSDictionary)["type"] as AnyObject).isKind(of: NSString.self) && ((tempDict as! NSDictionary)["sortNum"] as AnyObject).isKind(of: NSNumber.self) && (((tempDict as! NSDictionary)["isDeleted"] as? Bool == false) || ((tempDict as! NSDictionary)["isDeleted"] as? Bool == true))  {
                                                    
                                                } else {
                                                    ret = false
                                                }
                                            } else {
                                                ret = false
                                            }
                                        } else {
                                            ret = false
                                        }
                                    }
                                    if ret != true {
                                        self.alertWrongFormat("WrongFormat")
                                        return
                                    }
                                    let alertC = UIAlertController(title: SwitchLanguageTool.getLocalString(of: "Warning"), message: SwitchLanguageTool.getLocalString(of: "importWarning"), preferredStyle: .alert)
                                    let cancelAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Cancel"), style: .cancel, handler: { (_) in
                                    })
                                    let sureAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Sure"), style: .destructive, handler: { (_) in
                                        do {
                                            let realm = try! Realm()
                                            try realm.write {
                                                realm.deleteAll()
                                            }
                                            try realm.write {
                                                let arr = dict["settings"] as! Array<Dictionary<String, Any>>
                                                for subDict in arr {
                                                    let model = Setting()
                                                    model.action = subDict["action"] as! String
                                                    model.name = subDict["name"] as! String
                                                    model.isDeleted = subDict["isDeleted"] as! Bool
                                                    model.sortNum = subDict["sortNum"] as! NSNumber
                                                    model.type = subDict["type"] as! String
                                                    print(model.name)
                                                    realm.add(model)
                                                }
                                            }
                                        } catch {
                                            print(error)
                                        }
                                        
                                        (self.navigationController?.viewControllers.first as! ViewController).refresh()
                                        try! FileManager.default.removeItem(at: fileUrl)
                                        SVProgressHUD.showSuccess(withStatus: SwitchLanguageTool.getLocalString(of: "Success!"))
                                    })
                                    alertC.addAction(cancelAction)
                                    alertC.addAction(sureAction)
                                    SVProgressHUD.dismiss()
                                    self.present(alertC, animated: true, completion: {
                                    })
                                    
                                } else {
                                    print("name' value isn't app-Prefs")
                                    self.alertWrongFormat("WrongFormat")
                                    try! FileManager.default.removeItem(at: fileUrl)
                                }
                            } else {
                                print("no key: name")
                                self.alertWrongFormat("WrongFormat")
                                try! FileManager.default.removeItem(at: fileUrl)
                            }
                            
                        } else {
                            self.alertWrongFormat("WrongFormat")
                        }
                        
                    })
                    task.resume()
                })
                alertC.addAction(cancelAction)
                alertC.addAction(sureAction)
                present(alertC, animated: true, completion: nil)
                break
            case 3:
                // Help.
                
                let alertSheet = UIAlertController(title: SwitchLanguageTool.getLocalString(of: "click to selected"), message: SwitchLanguageTool.getLocalString(of: "askSettingsWarning"), preferredStyle: .actionSheet)
                let cancelAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Cancel"), style: .cancel, handler: { (_) in
                })
                let emailAction = UIAlertAction(title: "E-mail", style: .default, handler: { (_) in
                    
                    if MFMailComposeViewController.canSendMail() {
                        
                        let mailC = MFMailComposeViewController()
                        mailC.mailComposeDelegate = self
                        mailC.setToRecipients(["chengluffy@hotmail.com"])
                        mailC.setSubject("app-Prefs Help")
                        
                        let dict = NSMutableDictionary()
                        dict.setValue("app-Prefs", forKey: "name")
                        
                        let arr = NSMutableArray()
                        
                        let models = realm.objects(Setting.self)
                        for model in models {
                            let tempDict = NSMutableDictionary()
                            tempDict.setValue(model.name, forKey: "name")
                            tempDict.setValue(model.action, forKey: "action")
                            tempDict.setValue(model.isDeleted, forKey: "isDeleted")
                            tempDict.setValue(model.sortNum, forKey: "sortNum")
                            tempDict.setValue(model.type, forKey: "type")
                            arr.add(tempDict)
                        }
                        
                        dict.setValue(arr, forKey: "settings")
                        
                        let data = NSKeyedArchiver.archivedData(withRootObject: dict)
                        
                        mailC.addAttachmentData(data, mimeType: "", fileName: "app-Prefs.plist")
                        
                        self.present(mailC, animated: true, completion: nil)
                        
                    } else {
                        self.alertWrongFormat("accountErrors")
                    }
                    
                })
                let issuesAction = UIAlertAction(title: "Issues", style: .destructive, handler: { (_) in
                    
                    let str = "https://chengluffy.github.io/app-Prefs/"
                    let url = URL.init(string: str)
                    UIApplication.shared.open(url!, options: [:], completionHandler: { (ret) in
                        print(ret)
                    })
                    
                })
                
                alertSheet.addAction(cancelAction)
                alertSheet.addAction(emailAction)
                alertSheet.addAction(issuesAction)
                
                present(alertSheet, animated: true, completion: {
                })
                break
            case 4:
                let alertC = UIAlertController(title: SwitchLanguageTool.getLocalString(of: "Switch Languages."), message: nil, preferredStyle: .actionSheet)
                let cancelAction = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Cancel"), style: .cancel, handler: { (_) in
                })
                
                let defaultLanguage = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Default"), style: .default, handler: { (_) in
                    UserDefaults.init(suiteName: "group.chengluffy.app-Prefs")?.set("default", forKey: "language")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let _ = self.navigationController?.popToRootViewController(animated: true)
                    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC")
                    (appDelegate.window?.rootViewController as! UINavigationController).viewControllers = [vc]
                })
                let EnglishLanguage = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "English"), style: .default, handler: { (_) in
                    UserDefaults.init(suiteName: "group.chengluffy.app-Prefs")?.set("en", forKey: "language")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let _ = self.navigationController?.popToRootViewController(animated: true)
                    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC")
                    (appDelegate.window?.rootViewController as! UINavigationController).viewControllers = [vc]
                })
                let ChineseLanguage = UIAlertAction(title: SwitchLanguageTool.getLocalString(of: "Chinese"), style: .default, handler: { (_) in
                    UserDefaults.init(suiteName: "group.chengluffy.app-Prefs")?.set("zh-Hans", forKey: "language")
                    let appDelegate = UIApplication.shared.delegate as! AppDelegate
                    let _ = self.navigationController?.popToRootViewController(animated: true)
                    let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "VC")
                    (appDelegate.window?.rootViewController as! UINavigationController).viewControllers = [vc]
                })
                alertC.addAction(cancelAction)
                alertC.addAction(defaultLanguage)
                alertC.addAction(EnglishLanguage)
                alertC.addAction(ChineseLanguage)
                present(alertC, animated: true, completion: { 
                })
                break
            default: break
            }
        } else {
            var action = ""
            if indexPath.row == 0 {
                action = "http://weibo.com/0x00eeee"
            } else if indexPath.row == 1 {
                action = "https://github.com/cyanzhong/app-tutorials/blob/master/schemes.md"
            } else if indexPath.row == 2 {
                action = "https://github.com/cyanzhong/Retriever"
            } else if indexPath.row == 3 {
                action = "https://itunes.apple.com/cn/app/pin-%E5%89%AA%E8%B4%B4%E6%9D%BF%E6%89%A9%E5%B1%95/id1039643846?mt=8"
            }
            let url = URL.init(string: action)
            UIApplication.shared.open(url!, options: [:]) { (ret) in
            }
            
        }
        
    }
    
    func alertWrongFormat(_ msg: String) {
        
        SVProgressHUD.showError(withStatus: SwitchLanguageTool.getLocalString(of: msg))
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 75
        } else {
            return 40
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 75))
            let aboutTV = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 50))
            aboutTV.isEditable = false
            aboutTV.backgroundColor = UIColor.clear
            
            let displayText = SwitchLanguageTool.getLocalString(of: "Info")
            let attrStr = NSMutableAttributedString(string: displayText)
            
            let url = URL.init(string: "https://github.com/ChengLuffy/app-Prefs")
            
            let linkStr = "ChengLuffy/app-Prefs"
            let rang = displayText.range(of: linkStr)
            let location: Int = displayText.distance(from: displayText.startIndex, to: rang!.lowerBound)
            
            attrStr.addAttribute(NSLinkAttributeName, value: url!, range: NSRange.init(location: location, length: linkStr.characters.count))
            aboutTV.attributedText = attrStr
            aboutTV.textAlignment = .center
            aboutTV.delegate = self
            aboutTV.isUserInteractionEnabled = true
            aboutTV.isScrollEnabled = false
            aboutTV.center = view.center
            view.addSubview(aboutTV)
            
            return view
        } else {
            return nil
        }
        
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        if section == 0 {
//            let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 150))
//            let aboutTV = UITextView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 125))
//            aboutTV.isEditable = false
//            aboutTV.backgroundColor = UIColor.clear
//            
//            let displayText = SwitchLanguageTool.getLocalString(of: "Thanks")
//            let attrStr = NSMutableAttributedString(string: displayText)
//            
//            // 致谢 @StackOverflowError：\napp-tutorials是这个应用的基础；\nRetriever查询URL Scheme的的有效工具；\nPin 是一个超级优秀的工具应用。
//            let weiboUrl = URL.init(string: "http://weibo.com/0x00eeee")
//            let appTutorialsUrl = URL.init(string: "https://github.com/cyanzhong/app-tutorials/blob/master/schemes.md")
//            let retrieverUrl = URL.init(string: "https://github.com/cyanzhong/Retriever")
//            let pinUrl = URL.init(string: "https://itunes.apple.com/cn/app/pin-%E5%89%AA%E8%B4%B4%E6%9D%BF%E6%89%A9%E5%B1%95/id1039643846?mt=8")
//            
//            let weiboStr = "@StackOverflowError"
//            let appTutorialsStr = "app-tutorials"
//            let retrieverStr = "Retriever"
//            let pinStr = "Pin"
//            
//            let rang = displayText.range(of: weiboStr)
//            let location: Int = displayText.distance(from: displayText.startIndex, to: rang!.lowerBound)
//            attrStr.addAttribute(NSLinkAttributeName, value: weiboUrl!, range: NSRange.init(location: location, length: weiboStr.characters.count))
//            
//            let rang1 = displayText.range(of: appTutorialsStr)
//            let location1: Int = displayText.distance(from: displayText.startIndex, to: rang1!.lowerBound)
//            attrStr.addAttribute(NSLinkAttributeName, value: appTutorialsUrl!, range: NSRange.init(location: location1, length: appTutorialsStr.characters.count))
//            
//            let rang2 = displayText.range(of: retrieverStr)
//            let location2: Int = displayText.distance(from: displayText.startIndex, to: rang2!.lowerBound)
//            attrStr.addAttribute(NSLinkAttributeName, value: retrieverUrl!, range: NSRange.init(location: location2, length: retrieverStr.characters.count))
//            
//            let rang3 = displayText.range(of: pinStr)
//            let location3: Int = displayText.distance(from: displayText.startIndex, to: rang3!.lowerBound)
//            attrStr.addAttribute(NSLinkAttributeName, value: pinUrl!, range: NSRange.init(location: location3, length: pinStr.characters.count))
//            
//            aboutTV.attributedText = attrStr
//            aboutTV.textAlignment = .center
//            aboutTV.delegate = self
//            aboutTV.isUserInteractionEnabled = true
//            aboutTV.center = view.center
//            aboutTV.isScrollEnabled = false
//            view.addSubview(aboutTV)
//            return view
//
//        } else {
//            return nil
//        }
//    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 1 {
            return "Thanks"
        } else {
            return nil
        }
    }
    
}

extension AboutViewController: UITextViewDelegate {
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
        UIApplication.shared.open(URL, options: [:]) { (ret) in
        }
        return true
    }
}

extension AboutViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        self.dismiss(animated: true, completion: nil)
    }
}