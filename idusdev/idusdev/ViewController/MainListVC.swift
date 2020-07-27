//
//  MainListVC.swift
//  idusdev
//
//  Created by Hanamobile on 2020/07/25.
//  Copyright © 2020 kr.talq. All rights reserved.
//

import UIKit

class MainListVC: UIViewController {
    
    // -------------------------------------------------------------
    // MARK: - Outlet Definition
    // -------------------------------------------------------------
    
    // MARK: - UITableView
    @IBOutlet weak var tableViewMain: UITableView!
    
    // -------------------------------------------------------------
    // MARK: - Value Definition
    // -------------------------------------------------------------
    ///메인 리스트 배열
    var mArrList:[Appstore_Info] = []
    
    ///다음 페이지 상단 이미지 사이즈 및 기본값.
    var mImageSize:CGSize = .init(width: 392, height: 696)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initData()
        initView()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //빅타이틀 네비게이션 형태 활성화
        if let nc = self.navigationController{
            if #available(iOS 11.0, *) {
                nc.navigationBar.prefersLargeTitles = true
            }
        }
    }
    // -------------------------------------------------------------
    // MARK: - 초기화
    // -------------------------------------------------------------
    func initData(){
        tableViewMain.delegate = self
        tableViewMain.dataSource = self
        requestMainList()
    }
    func initView(){
        
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ListDetailVC, let indexPath = sender as? IndexPath{
            vc.appInfo = mArrList[indexPath.row]
            vc.topImageSize = mImageSize
        }
    }
    
}
// MARK: -
extension MainListVC{
    // -------------------------------------------------------------
    // MARK: Network
    // -------------------------------------------------------------
    
    /**
     - term: 검색어 ( 현재는 핸드메이드 고정으로 설정)
     - country : 국가 ( 현재는 고정이나, 계정별로 변경 가능 )
     - media : Category( 현재는 software로 고정 )
     */
    func requestMainList(term:String = "핸드메이드", country:String = "kr", media:String = "software"){
        AlamofireModel.Main_List(req: REQ_Main.init(term: term, country: country, media: media)) { (response) in
            
            guard let data = response else{
                return
            }
            
            if let resp = try? JSONDecoder().decode(RES_Result.self, from: data){
                //데이터 정상 수신 후 결과값 출력
                self.mArrList = resp.results ?? []
                self.tableViewMain.reloadData()
                
                //다음페이지 이미지 사이즈를 얻기위해 추가 이미지 사이즈 요청
                if let sizeFilter = self.mArrList.first(where: { $0.screenshotUrls?.count ?? 0 > 0}){
                    self.requestImageSize(urlString: sizeFilter.screenshotUrls?.first ?? "")
                }
            }
        }
    }
    //UI 가이드가 별도로 있지 않아, 이미지 사이즈를 임의로 측정해 유동적으로 화면이 변경되도록 선언
    func requestImageSize(urlString:String){
        guard let url = URL.init(string: urlString) else {
            return
        }
        
        if let imageSource = CGImageSourceCreateWithURL(url as CFURL, nil) {
            if let imageProperties = CGImageSourceCopyPropertiesAtIndex(imageSource, 0, nil) as Dictionary? {
                let pixelWidth = imageProperties[kCGImagePropertyPixelWidth] as! Int
                let pixelHeight = imageProperties[kCGImagePropertyPixelHeight] as! Int
                self.mImageSize = CGSize(width: pixelWidth, height: pixelHeight)
            }
        }
    }
}


// MARK: -
extension MainListVC : UITableViewDelegate, UITableViewDataSource{
    // -------------------------------------------------------------
    // MARK: TableView Delegate/Datasource
    // -------------------------------------------------------------
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mArrList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MainListCell", for: indexPath) as? MainListCell{
            cell.setDataToView(delegate: self, data: mArrList[indexPath.row])
            cell.selectionStyle = .none
            return cell
        }
        return UITableViewCell.init()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "ListDetailVC", sender: indexPath)
    }
}
