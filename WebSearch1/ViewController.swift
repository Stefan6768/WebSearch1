//
//  ViewController.swift
//  WebSearch1
//
//  Created by Stefan Schreiber on 06.12.22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var leftButton: UIButton!
    @IBOutlet weak var rightButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Url laden
        let url = URL(string: "https://www.apple.com")!
        webView.load(URLRequest(url: url))
        webView?.allowsBackForwardNavigationGestures = true
        webView.navigationDelegate = self
        
        //search Bar
        searchBar.text = url.absoluteString
        searchbar.delegate = self
    }
    
    //Mark: - IBActions Buttons
    @IBAction func leftButtonTapped(_ sender: UIButton) {
        webView.goBack()
    }
    
    @IBAction func rightButtonTapped(_ sender: UIButton) {
        webView?.goForward()
    }

    //Mark: Suche über Searchbar einrichten
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchText = searchBar.text!
        searchBar.resignFirstResponder()
        let newURL = URL(string:  searchText)!
        let urlRequest = URLRequest(url: newURL)
        webView.load(urlRequest)
        searchBar.text = newURL.absoluteString
    }

}

//Mark: - Dynamische Anpassung des SearchBarTextes
extension ViewController: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        searchBar.text = webView.url!.absoluteString
    }
}

