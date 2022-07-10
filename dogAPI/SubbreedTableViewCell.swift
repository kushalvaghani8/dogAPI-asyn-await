

import UIKit

class SubbreedTableViewCell: UITableViewCell {

    @IBOutlet weak var subBreedName: UILabel!
    @IBOutlet weak var breedName: UILabel!
    
    @IBOutlet weak var imgView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        subBreedName.alpha = 1
    }

}
