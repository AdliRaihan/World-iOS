//
//  SideMenuViewController.swift
//  World
//
//  Created by APCMBP001 on 18/02/19.
//  Copyright © 2019 Adli Raihan. All rights reserved.
//

import UIKit


class SideMenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollerVIew: UIScrollView!
    var slides:[Slide] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        slides = createSlide()
        setupSlideViewController(slides: slides)

        scrollerVIew.delegate = self
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: pageControl)


        Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(setTest), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - TableView Init
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SliderMenuAttr") as! SlideMenuTableViewCell
        return cell
    }


    // MARK: - Carousel Initilization
    var currentPage = 0
    @objc func setTest(){
        if(scrollerVIew.contentOffset.x == 414.0){
            scrollerVIew.setContentOffset(CGPoint(x: 0, y: 0), animated: true)

        }else{
            scrollerVIew.setContentOffset(CGPoint(x: 414, y: 0), animated: true)
        }
    }


    func createSlide() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! Slide

        var urlImage = URL(string: "https://images.unsplash.com/photo-1550332781-aecd27f7434f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80")

        slide1.imageSlide.sd_setImage(with: urlImage , completed: nil)
        slide1.imageSlide.contentMode = UIViewContentMode.scaleToFill
        slide1.descSlide.text = "Halo test"
        slide1.titleSlide.text = "Halo Title Test"

        let slide2:Slide = Bundle.main.loadNibNamed("View", owner: self, options: nil)?.first as! Slide

        urlImage = URL(string: "https://images.unsplash.com/photo-1550525811-d71cdbc59cc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=334&q=80")

        slide2.imageSlide.sd_setImage(with: urlImage , completed: nil)
        slide2.imageSlide.contentMode = UIViewContentMode.scaleToFill
        slide2.descSlide.text = "Halo test"
        slide2.titleSlide.text = "Halo Title Test"


        return [slide1,slide2]
    }

    func setupSlideViewController(slides:[Slide]){
        scrollerVIew.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollerVIew.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollerVIew.isPagingEnabled = true

        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            scrollerVIew.addSubview(slides[i])
        }

    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)

        let maxHorizontalOffset = scrollView.contentSize.width - scrollView.frame.width
        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x

        // vertical
        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y

        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maxHorizontalOffset
        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset


        let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)

        print(pageIndex)
        print(scrollView.contentOffset)
        print(scrollerVIew.contentOffset)
//        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {
//            slides[0].imageSlide.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
//            slides[1].imageSlide.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)
//
//        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
//            slides[1].imageSlide.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
//            slides[2].imageSlide.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)
//
//        } else if(percentOffset.x > 0.50 && percentOffset.x <= 0.75) {
//            slides[2].imageSlide.transform = CGAffineTransform(scaleX: (0.75-percentOffset.x)/0.25, y: (0.75-percentOffset.x)/0.25)
//            slides[3].imageSlide.transform = CGAffineTransform(scaleX: percentOffset.x/0.75, y: percentOffset.x/0.75)
//
//        } else if(percentOffset.x > 0.75 && percentOffset.x <= 1) {
//            slides[3].imageSlide.transform = CGAffineTransform(scaleX: (1-percentOffset.x)/0.25, y: (1-percentOffset.x)/0.25)
//            slides[4].imageSlide.transform = CGAffineTransform(scaleX: percentOffset.x, y: percentOffset.x)
//        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        setupSlideViewController(slides: slides)
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
