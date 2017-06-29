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
    
}


- (void)configureCell:(SMCommentModel *) comment {
    
    self.usernameLabel.text = comment.username;
    self.commentLabel.text = comment.commentBody;;
    self.comment = comment;
}

@end
