//
//  SMDataService.m
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMDataService.h"
#import "SMVideoModel.h"
#import "SMCommentModel.h"

#define URL_BASE "http://localhost:6361/method"
#define URL_VIDEOS "/video.getAll"
#define URL_COMMENTS "/video.getComments="
#define URL_POST_COMMENT "/video.postComment="
#define URL_DELETE_COMMENT "/video.deleteComment="



@implementation SMDataService

+ (SMDataService *)sharedInstance {
    
    static SMDataService *sharedInstance = nil;
    
    @synchronized (self) {
        if (sharedInstance == nil) {
            sharedInstance = [[self alloc] init];
        }
    }
    return sharedInstance;
}

- (void) getVideos:(onComplete)completionHandler {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s", URL_BASE, URL_VIDEOS]];
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (data) {
            
            NSError *error;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            NSMutableArray *resultArray = [NSMutableArray array];
            
            for (NSDictionary *dict in json) {
                SMVideoModel *video = [[SMVideoModel alloc] initWithData:dict];
                [resultArray addObject:video];
            }
            
            if (!error) {
                
                completionHandler(resultArray, nil);
                
            } else {
                
                completionHandler(resultArray, @"Data is corrupt, try again");
            }
            
        } else {
            
            completionHandler(nil, @"No connection with the server");

            NSLog(@"Error: %@", error.debugDescription);
        }
        
    }] resume];
    
}

- (void)getAllCommentsOfVideo:(SMVideoModel *)video onComplete:(onComplete)completionHandler  {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s%@", URL_BASE, URL_COMMENTS, video.videoID]];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (data) {
            NSError *error;
            NSArray *json = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
            
            NSMutableArray *resultArray = [NSMutableArray array];
            
            for (NSDictionary *dict in json) {
                SMCommentModel *comment = [[SMCommentModel alloc] initWithData:dict];
                [resultArray addObject:comment];
            }
            
            if (!error) {
                
                completionHandler(resultArray, nil);
                
            } else {
                
                completionHandler(resultArray, @"Data is corrupt, try again");
            }
            
        } else {
            
            completionHandler(nil, @"No connection with the server");
            
            NSLog(@"Error: %@", error.debugDescription);
        }
        
    }] resume];
    
}

- (void)postComment:(NSDictionary *)comment toVideo:(SMVideoModel *)video onComplete:(completionBlock)completionHandler {
    
    NSError *error;
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s%@",URL_BASE,URL_POST_COMMENT, video.videoID]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    [request setHTTPMethod:@"POST"];
    
    NSData *postData = [NSJSONSerialization dataWithJSONObject:comment options:0 error:&error];
    
    [request setHTTPBody:postData];
    
    NSURLSessionDataTask *postDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

        completionHandler();

    }];
    
    [postDataTask resume];
    
}

- (void)deleteComment:(SMCommentModel *)comment fromVideo:(SMVideoModel *)video onComplete:(completionBlock)completionHandler {
    
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%s%s%@&%@", URL_BASE, URL_DELETE_COMMENT, video.videoID, comment.commentID]];
    NSURLSession *session = [NSURLSession sharedSession];

    [[session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                
    }] resume];
    
    
}

@end
