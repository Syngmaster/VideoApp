//
//  SMDetailVideoController.m
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMDetailVideoController.h"
#import "SMVideoModel.h"
#import "SMCommentCell.h"
#import "SMDataService.h"
#import "SMCommentModel.h"

@interface SMDetailVideoController () <UIWebViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *testUsername;
@property (strong, nonatomic) NSArray *testComment;
@property (strong, nonatomic) NSArray *commentsList;


@end

@implementation SMDetailVideoController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.webView.delegate = self;
    self.titleLabel.text = self.video.videoTitle;
    self.descriptionLabel.text = self.video.videoDescription;
    [self.webView loadHTMLString:self.video.videoIFrame baseURL:nil];
    
    self.commentsTableView.dataSource = self;
    
    //self.testUsername = @[@"Alex",@"Max",@"Jane", @"Bob"];
    //self.testComment = @[@"Great job! Great job! Great job! Great job! Great job! Great job! Great job! Great job! Great job!",@"Awesome!!",@"I enjoyed that",@"Cool stuff!!"];
    
    [[SMDataService sharedInstance] getAllCommentsOfVideo:self.video onComplete:^(NSArray *dataArray, NSString *errorMessage) {
        
        if (dataArray) {
            
            self.commentsList = dataArray;
            [self updateTableData];
            
        } else {
            
        }

    }];

}

- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.commentsTableView reloadData];
    });
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

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.commentsList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SMCommentCell *cell = [tableView dequeueReusableCellWithIdentifier:@"commentCell"];
    
    if (!cell) {
        cell = [[SMCommentCell alloc] init];
    }
    
    SMCommentModel *comment = [self.commentsList objectAtIndex:indexPath.row];
    
    [cell configureCell:comment];
    
    return cell;
}

@end
