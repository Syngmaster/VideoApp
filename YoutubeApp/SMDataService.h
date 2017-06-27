//
//  SMDataService.h
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SMVideoModel;

typedef void (^onComplete)(NSArray *dataArray, NSString *errorMessage);

@interface SMDataService : NSObject

+ (SMDataService *) sharedInstance;
- (void) getVideos:(onComplete) completionHandler;
- (void)postComment;
- (void)getAllCommentsOfVideo:(SMVideoModel *) video onComplete:(onComplete) completionHandler;

@end
