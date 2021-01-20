//
//  ViewController.swift
//  Collection_View_Infinite_Paging
//
//  Created by taehy.k on 2021/01/20.
//

import UIKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let list = [ #colorLiteral(red: 0.5843137255, green: 0.8823529412, blue: 0.8274509804, alpha: 1) ,#colorLiteral(red: 0.9529411765, green: 0.5058823529, blue: 0.5058823529, alpha: 1), #colorLiteral(red: 0.9882352941, green: 0.8901960784, blue: 0.5411764706, alpha: 1), #colorLiteral(red: 0.5843137255, green: 0.8823529412, blue: 0.8274509804, alpha: 1), #colorLiteral(red: 0.9529411765, green: 0.5058823529, blue: 0.5058823529, alpha: 1)]
    
    // MARK: - IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    // 보여줄 항목 개수
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    // cell 가져오기 및 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath)
        cell.contentView.backgroundColor = list[indexPath.row]
        return cell
    }

    // 스크롤 움직임 탐지
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        print("스크롤뷰 contentOffset: \(scrollView.contentOffset.x)")
        // contentOffset은 point이다.
        // 스크롤 한다는 자체가 contentOffset이 변하는 것이다.
        
        let pageFloat = (scrollView.contentOffset.x / scrollView.frame.size.width)
        let pageInt = Int(round(pageFloat))
        
        
        // 아 케이스가 왜 0이랑 list.count - 1로 나눠져 있는지 알겠다.
        // 맨 처음과 맨 끝으로 갔을떄 다시 위치를 조정시켜주기 위함.
        // 무한 스크롤 위해
        switch pageInt {
        case 0:
            collectionView.scrollToItem(at: [0, 3], at: .left, animated: false)
        case list.count - 1:
            collectionView.scrollToItem(at: [0, 1], at: .left, animated: false)
        default:
            break
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let flowlayout = UICollectionViewFlowLayout()
        flowlayout.itemSize = CGSize(width: UIScreen.main.bounds.width, height: collectionView.frame.size.height)
        flowlayout.minimumInteritemSpacing = 0  // 항목 간 간격 0
        flowlayout.minimumLineSpacing = 0 // 줄 간격 0
        flowlayout.scrollDirection = .horizontal // 수평으로 스크롤
        collectionView.collectionViewLayout = flowlayout
    }
  
    override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      self.collectionView.scrollToItem(at: IndexPath(item: 1, section: 0), at: .left, animated: false)
    }

}
