
import UIKit
import MySeriesFramework

class MySeriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lbTitle: UILabel!
    
}

extension MySeriesCollectionViewCell {
    func show(serie: GetMySeriesRS) -> Void {
//        imgPoster
        lbTitle.text = serie.show?.title
    }
}
