//
//  UserTableViewCell.m
//  MenuSelectView
//
//  Created by Weefeng Ma on 2018/1/8.
//  Copyright © 2018年 maweefeng. All rights reserved.
//

#import "UserTableViewCell.h"
@interface UserTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *userIconV;
@property (weak, nonatomic) IBOutlet UILabel *addressL;
@property (weak, nonatomic) IBOutlet UILabel *nameL;

@end
@implementation UserTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
