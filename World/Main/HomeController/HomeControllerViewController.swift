//
//  HomeControllerViewController.swift
//  World
//
//  Created by APCMBP001 on 20/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit

class HomeControllerViewController: UIViewController,UIScrollViewDelegate,ExpandableHomeViewDelegate,UITableViewDelegate,UITableViewDataSource {




    // MARK : - Variables

    var Sections = [
        priceInformation(paket: "Silver", paket_model: ["Nelfon 60 menit","Quota Internet 10 GB","Quota Internet Malam 12 GB","SMS 300 Semua operator"], paket_harga: 200000, paket_available: "Tersedia", Expanded: true),
        priceInformation(paket: "Platinum", paket_model: ["Nelfon 120 menit","Quota Internet 40 GB","Quota Internet Malam 120 GB","SMS 1.000 Semua operator"], paket_harga: 200000, paket_available: "Tersedia", Expanded: true),
        priceInformation(paket: "VVIP", paket_model: ["Nelfon 999 menit","Quota Internet 9999 GB","Quota Internet Malam 999 GB","SMS 999999 Semua operator"], paket_harga: 200000, paket_available: "Tersedia", Expanded: true)
    ]

    @IBOutlet weak var content_1View: UIView!
    @IBOutlet weak var tableview: UITableView!
    @IBOutlet weak var ScrollerView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    var SliderView:[SliderView] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()


        // MARK : - InitSlider
        SliderView = createSlide()
        setupViewController(Slides: SliderView)

        ScrollerView.delegate = self

        pageControl.currentPage = 0
        pageControl.numberOfPages = SliderView.count
        view.bringSubview(toFront: pageControl)

        ScrollerView.contentSize = CGSize(width: ScrollerView.contentSize.width, height: 0)


        // Mark : - Content Radius

        content_1View.layer.cornerRadius = 5
        content_1View.layer.shadowColor = UIColor.black.cgColor
        content_1View.layer.shadowOffset = CGSize(width: 0, height: 0)
        content_1View.layer.shadowOpacity = 0.15

        tableview.layer.cornerRadius = 5



        // MARK : - Setting Content Offset

        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(autoPreview), userInfo: nil, repeats: true)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



    // MARK : - ScrollView

    func createSlide() -> [SliderView] {

        // Image URL //
        var imageURI = URL(string: "https://images.unsplash.com/photo-1512036849132-48508f294900?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80")


        // Slider Satu //
        let slider_1 = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
        slider_1.imageHolder.sd_setImage(with: imageURI, completed: nil)

        // Slider Dua //
        imageURI = URL(string: "https://images.unsplash.com/photo-1507041957456-9c397ce39c97?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80")
        let slider_2 = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! SliderView
        slider_2.imageHolder.sd_setImage(with: imageURI, completed: nil)


        return [slider_1,slider_2]
    }

    func setupViewController(Slides:[SliderView]){
        ScrollerView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        ScrollerView.contentSize = CGSize(width: view.frame.width * CGFloat(Slides.count), height: view.frame.height)
        ScrollerView.isPagingEnabled = true

        for i in 0 ..< Slides.count {
            Slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            ScrollerView.addSubview(Slides[i])
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }

    @objc func autoPreview(){

        let ScrollerViewOffset = ScrollerView.contentSize.width/2
        if(ScrollerView.contentOffset.x == 0){
            ScrollerView.setContentOffset(CGPoint(x: ScrollerViewOffset, y: 0), animated: true)
        }else{
            ScrollerView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
        print(ScrollerViewOffset)
    }
    // MARK : - Table

    func numberOfSections(in tableView: UITableView) -> Int {
        return Sections.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Sections[section].paket_model.count
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (Sections[indexPath.section].Expanded) {
            return 44
        } else {
            return 0
        }
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 2
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableHomeView()
        header.titleLabel.text = ""
        header.arrowLabel.text = ">"
        header.customInit(title: Sections[section].paket, section: section, delegate: self)
        return header
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeHolderTable") as! ExpandableTableViewCell
        cell.labelHarga.text = "" 
        cell.labelNama.text = Sections[indexPath.section].paket_model[indexPath.row]
        return cell
    }



    func toggleSection(header: ExpandableHomeView, section: Int) {
        Sections[section].Expanded = !Sections[section].Expanded

        tableview.beginUpdates()
        for i in 0 ..< Sections[section].paket_model.count{
            tableview.reloadRows(at: [IndexPath(item: i, section: section)], with: .automatic)
        }
        tableview.endUpdates()
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
