//
//  SMDetailVideoController.h
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SMVideoModel;

@interface SMDetailVideoController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

- (IBAction)doneAction:(UIButton *)sender;

@property (strong, nonatomic) SMVideoModel *video;

@end
