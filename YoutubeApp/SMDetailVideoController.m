//
//  SMDetailVideoController.m
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMDetailVideoController.h"
#import "SMVideoModel.h"

@interface SMDetailVideoController () <UIWebViewDelegate>

@end

@implementation SMDetailVideoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self;
    self.titleLabel.text = self.video.videoTitle;
    self.descriptionLabel.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.videoIFrame baseURL:nil];

}

- (IBAction)doneAction:(UIButton *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    NSString *css = @".container { position: relative;width: 100%;height: 0;padding-bottom: 56.25%}.video {position: absolute;top: 0;left: 0;width: 100%;height: 100%;}";
    NSString* js = [NSString stringWithFormat:
                    @"var styleNode = document.createElement('style');\n"
                    "styleNode.type = \"text/css\";\n"
                    "var styleText = document.createTextNode('%@');\n"
                    "styleNode.appendChild(styleText);\n"
                    "document.getElementsByTagName('head')[0].appendChild(styleNode);\n",css];
    //NSLog(@"js:\n%@",js);
    [self.webView stringByEvaluatingJavaScriptFromString:js];
}


@end
