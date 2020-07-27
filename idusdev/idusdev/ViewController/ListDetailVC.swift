//
//  ListDetailVC.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit

enum CellType:String {
    case Title
    case Size = "크기"
    case Age = "연령"
    case NewFunc = "새로운 기능"
    case NewFuncDesc
    case DetailDesc
    case Category
}
class ListDetailVC: UIViewController {
    // -------------------------------------------------------------
    // MARK: - Outlet Definition
    // -------------------------------------------------------------
    
    // MARK: - UIView
    @IBOutlet weak var stackTableHeader: UIStackView!
    @IBOutlet var viewTableHeader: UIView!
    
    // MARK: - TableView
    @IBOutlet weak var tableViewMain: UITableView!
    
    // MARK: - Constraint
    @IBOutlet weak var constWidthStackView: NSLayoutConstraint!
    
    // -------------------------------------------------------------
    // MARK: - Value Definition
    // -------------------------------------------------------------
    var appInfo:Appstore_Info?
    var topImageSize:CGSize = .init()
    var arrTopImages:[UIImageView] = []
    var mArrListTypes:[CellType] = []
    var isSelectNewFunc:Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initData()
        initView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //빅타이틀 네비게이션 형태 취소
        if let nc = self.navigationController{
            if #available(iOS 11.0, *) {
                nc.navigationBar.prefersLargeTitles = false
            } 
        }
    }


    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
    // -------------------------------------------------------------
    // MARK: - 초기화
    // -------------------------------------------------------------
    func initData(){
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        
        //상단 탭 이미지 초기화
        arrTopImages.removeAll()
        for url in appInfo?.screenshotUrls ?? []{
            let imageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: topImageSize.width / 2, height: topImageSize.height / 2))
            if let url = URL.init(string: url){
                imageView.kf.setImage(with: url)
            }
            arrTopImages.append(imageView)
        }
        
        
        //데이터로 테이블뷰 셀타입 추가
        if let info = appInfo{
            mArrListTypes.append(.Title)
            if !(info.fileSizeBytes ?? "").isEmpty{
                mArrListTypes.append(.Size)
            }
            if !(info.trackContentRating ?? "").isEmpty{
                mArrListTypes.append(.Age)
            }
            if !(info.version ?? "").isEmpty{
                mArrListTypes.append(.NewFunc)
            }
            if !(info.description ?? "").isEmpty{
                mArrListTypes.append(.DetailDesc)
            }
            if info.genres?.count ?? 0 > 0{
                mArrListTypes.append(.Category)
            }
        }
    }
    func initView(){
        constWidthStackView.constant = CGFloat(arrTopImages.count) * (topImageSize.width / 2 + 5)
        
        //테이블뷰 설정
        viewTableHeader.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: topImageSize.height / 2)
        
        tableViewMain.tableHeaderView = viewTableHeader
        self.stackTableHeader.spacing = 5
        tableViewMain.separatorStyle = .none
        
        //스택뷰에 이미지 추가
        arrTopImages.forEach{ self.stackTableHeader.addArrangedSubview($0)}
        
    }
}
extension ListDetailVC : UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mArrListTypes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let type = mArrListTypes[indexPath.row]
        switch type {
        case .Title:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "AppTitlesCell", for: indexPath) as? AppTitlesCell{
                cell.setDataToView(delegate: self, data: appInfo)
                return cell
            }
        case .Size:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InfosCell", for: indexPath) as? InfosCell{
                cell.setDataToView(delegate: self, type:type, data: appInfo?.fileSizeBytes)
                return cell
            }
        case .Age:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InfosCell", for: indexPath) as? InfosCell{
                cell.setDataToView(delegate: self, type:type, data: appInfo?.trackContentRating)
                return cell
            }
        case .NewFunc:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InfosCell", for: indexPath) as? InfosCell{
                cell.setDataToView(delegate: self, type:type, isSelect: isSelectNewFunc, data: appInfo?.version)
                return cell
            }
        case .NewFuncDesc:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "InfosDetailCell", for: indexPath) as? InfosDetailCell{
                cell.setDataToView(delegate: self, data: appInfo?.releaseNotes)
                return cell
            }
            
        case .DetailDesc:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as? DescriptionCell{
                cell.setDataToView(delegate: self, data: appInfo?.description)
                return cell
            }
        case .Category:
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as? CategoryCell{
                cell.setDataToView(delegate: self, data: appInfo?.genres)
                return cell
            }
            break
        }
        return UITableViewCell.init()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = mArrListTypes[indexPath.row]
        if type == .NewFunc{
            let arrDescIn = mArrListTypes.filter{ $0 == .NewFuncDesc}
            guard let newFuncIndex = mArrListTypes.lastIndex(of: .NewFunc) else {
                return
            }
            if arrDescIn.count > 0 {
                mArrListTypes.remove(at: newFuncIndex + 1)
                isSelectNewFunc = false
            }else{
                mArrListTypes.insert(.NewFuncDesc, at: newFuncIndex + 1)
                isSelectNewFunc = true
            }
            tableView.reloadData()
        }
    }
}
