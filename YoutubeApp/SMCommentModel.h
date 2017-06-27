//
//  SMCommentModel.h
//  YoutubeApp
//
//  Created by Syngmaster on 27/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SMCommentModel : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *commentBody;

- (instancetype)initWithData:(NSDictionary *) dataDict;

@end
