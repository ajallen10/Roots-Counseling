//
//  OrientationViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/18/24.
//  Copyright © 2024 Abby Allen. All rights reserved.
//

import Foundation
import UIKit
import PDFKit
import FirebaseStorage
import FirebaseAuth
import CoreData
import FirebaseFirestore

class OrientationViewController: UIViewController{
    var urls = [String]()
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 6.0
        
        urls = ["gs://rootscapstoneproj.appspot.com/(1) Orientaion Module.pdf"]
        
        for i in urls{
            let storage = Storage.storage()
            let storageRef = storage.reference(forURL: i)
            storageRef.getData(maxSize: 1*8192*8192) { data, error in
                if error != nil {
                    print(error!)
                } else {
                    let file = PDFDocument(data: data!)
                    let pdfView = PDFView()
                    pdfView.autoScales = true
                    pdfView.contentMode = .scaleAspectFit
                    pdfView.document = file
                    self.stackView.addArrangedSubview(pdfView)
                }
            }
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
}
