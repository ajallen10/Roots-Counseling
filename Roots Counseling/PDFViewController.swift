//
//  PDFViewController.swift
//  Roots Counseling
//
//  Created by Abby Allen on 1/15/24.
//  Copyright © 2024 Abby Allen. All rights reserved.
//

import Foundation
import UIKit
import PDFKit
import FirebaseStorage
import FirebaseAuth
import CoreData
import FirebaseFirestore

class PDFViewController: UIViewController{
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
        
        let storage = Storage.storage()
        let folder: () = storage.reference().child("DistressTolerance").listAll(completion: {
            (result,error) in
            for i in result!.items{
                i.getData(maxSize: 1*8192*8192) { data, error in
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
            DispatchQueue.main.async {
                self.stackView.reloadInputViews()
            }
        })
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return image
    }
    
}

