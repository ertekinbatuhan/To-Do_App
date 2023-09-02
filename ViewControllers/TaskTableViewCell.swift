//
//  TaskTableViewCell.swift
//  To-Do App
//
//  Created by Batuhan Berk Ertekin on 2.09.2023.
//

import UIKit

class TaskTableViewCell: UITableViewCell
{

   
    @IBOutlet weak var taskNameLabel: UILabel!
    override func awakeFromNib()
    {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool)
    {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
