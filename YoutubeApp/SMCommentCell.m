//
//  SMCommentCell.m
//  YoutubeApp
//
//  Created by Syngmaster on 24/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCommentCell.h"
#import "SMCommentModel.h"

@implementation SMCommentCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    /*self.layer.cornerRadius = 2.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 1.0);*/
    
}

- (void)configureCell:(SMCommentModel *) comment {
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd MM yyyy"];
    
    self.usernameLabel.text = comment.username;
    self.commentLabel.text = comment.commentBody;
    self.commentDateLabel.text = [NSString stringWithFormat:@"Posted at: %@", [comment.commentDate substringToIndex:10]];
    self.comment = comment;
}

@end
