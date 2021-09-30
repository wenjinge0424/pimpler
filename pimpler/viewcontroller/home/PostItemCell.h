//
//  PostItemCell.h
//  pimpler
//
//  Created by Techsviewer on 7/23/18.
//  Copyright © 2018 brainyapps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CircleImageView.h"

@interface PostItemCell : UITableViewCell
@property (weak, nonatomic) IBOutlet CircleImageView *img_thumb;
@property (weak, nonatomic) IBOutlet UILabel *lbl_userName;
@property (weak, nonatomic) IBOutlet UIButton *btn_bookMark;
@property (weak, nonatomic) IBOutlet UILabel *lbl_detail;
@property (weak, nonatomic) IBOutlet UILabel *lbl_likeCount;
@property (weak, nonatomic) IBOutlet UIButton *btn_comment;
@property (weak, nonatomic) IBOutlet UIButton *btn_like;
@property (weak, nonatomic) IBOutlet UIButton *btn_play;

@property (weak, nonatomic) IBOutlet UIImageView *img_1_1;
@property (weak, nonatomic) IBOutlet UIImageView *img_2_1;
@property (weak, nonatomic) IBOutlet UIImageView *img_2_2;
@property (weak, nonatomic) IBOutlet UIImageView *img_3_1;
@property (weak, nonatomic) IBOutlet UIImageView *img_3_2;
@property (weak, nonatomic) IBOutlet UIImageView *img_3_3;
@property (weak, nonatomic) IBOutlet UILabel *lbl_morecount;

@property (weak, nonatomic) IBOutlet UIButton *btn_user;

@end
