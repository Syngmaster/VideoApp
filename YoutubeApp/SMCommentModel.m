//
//  SMCommentModel.m
//  YoutubeApp
//
//  Created by Syngmaster on 27/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCommentModel.h"

@implementation SMCommentModel

- (instancetype)initWithData:(NSDictionary *) dataDict {
    self = [super init];
    if (self) {
        self.username = [dataDict objectForKey:@"username"];
        self.commentBody = [dataDict objectForKey:@"comment"];
        self.commentID = [dataDict objectForKey:@"_id"];
        self.commentDate = [dataDict objectForKey:@"created_at"];
    }
    
    return self;
}

@end
