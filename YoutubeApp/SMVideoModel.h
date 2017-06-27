//
//  SMVideoModel.h
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMVideoModel : NSObject

@property (nonatomic, strong) NSString *videoID;
@property (nonatomic, strong) NSString *videoTitle;
@property (nonatomic, strong) NSString *videoDescription;
@property (nonatomic, strong) NSString *videoIFrame;
@property (nonatomic, strong) NSString *videothumbnailURL;

- (instancetype)initWithData:(NSDictionary *) dataDict;

@end
