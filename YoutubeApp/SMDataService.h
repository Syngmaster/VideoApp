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
typedef void (^dataPosted)(void);

@interface SMDataService : NSObject

+ (SMDataService *) sharedInstance;

- (void)getVideos:(onComplete) completionHandler;
- (void)getAllCommentsOfVideo:(SMVideoModel *) video onComplete:(onComplete) completionHandler;
- (void)postComment:(NSDictionary *) comment toVideo:(SMVideoModel *) video onComplete:(dataPosted) completionHandler;

@end
