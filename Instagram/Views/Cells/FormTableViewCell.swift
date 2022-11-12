//
//  FormTableViewCell.swift
//  Instagram
//
//  Created by Alonso Alas on 7/11/22.
//

import UIKit

protocol FormTableViewCellDelegate: AnyObject {
    func formTableViewCell(_ cell: FormTableViewCell, didiUpdateField updateModel: EditProfileForModel)
}

class FormTableViewCell: UITableViewCell, UITextFieldDelegate {
    static let identifier = "FormTableViewCell"
    
    private var model: EditProfileForModel?
    
    public weak var delegate: FormTableViewCellDelegate?
    
    private let formLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.numberOfLines = 1
        
        return label
    }()
    
    private let field: UITextField = {
       let field = UITextField()
        field.returnKeyType = .done
        return field
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        clipsToBounds = true
        contentView.addSubview(formLabel)
        contentView.addSubview(field)
        field.delegate = self
        selectionStyle = .none
    }
    
    public func configure(width model: EditProfileForModel) {
        self.model = model
        formLabel.text = model.label
        field.placeholder = model.placeholder
        field.text = model.value
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        formLabel.text = nil
        field.placeholder = nil
        field.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Async frames
        formLabel.frame = CGRect(x: 5,
                                 y: 0,
                                 width: contentView.width/3,
                                 height: contentView.height)
        field.frame = CGRect(x: formLabel.right + 5,
                             y: 0,
                             width: contentView.width-10-formLabel.width,
                             height: contentView.height)
    }
    
    // Field
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        model?.value = textField.text
        guard let model = model else {
            return true
        }

        delegate?.formTableViewCell(self, didiUpdateField: model)
        textField.resignFirstResponder()
        return true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
