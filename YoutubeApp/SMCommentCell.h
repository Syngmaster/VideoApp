//
//  SMCommentCell.h
//  YoutubeApp
//
//  Created by Syngmaster on 24/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMCommentModel;

@interface SMCommentCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIView *cellView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentLabel;
@property (weak, nonatomic) IBOutlet UILabel *commentDateLabel;

@property (strong, nonatomic) SMCommentModel *comment;

- (void)configureCell:(SMCommentModel *) comment;

@end
