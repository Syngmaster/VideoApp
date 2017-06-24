//
//  SMVideoModel.m
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMVideoModel.h"

@implementation SMVideoModel

- (instancetype)initWithData:(NSDictionary *) dataDict {
    
    self = [super init];
    if (self) {
        
        self.videoTitle = [dataDict objectForKey:@"title"];
        self.videoDescription = [dataDict objectForKey:@"description"];
        self.videothumbnailURL = [dataDict objectForKey:@"thumbnail"];
        self.videoIFrame = [dataDict objectForKey:@"iframe"];
        
    }
    return self;
}

@end
