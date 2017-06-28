//
//  ViewController.m
//  YoutubeApp
//
//  Created by Syngmaster on 22/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMViewController.h"
#import "SMDataService.h"
#import "SMVideoCell.h"
#import "SMVideoModel.h"
#import "SMDetailVideoController.h"


@interface SMViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray *videoList;

@end

@implementation SMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

    [[SMDataService sharedInstance] getVideos:^(NSArray *dataArray, NSString *errorMessage) {
        
        if (dataArray) {
            NSLog(@"Array: %@", dataArray.debugDescription);
            self.videoList = dataArray;
            
            [self updateTableData];
            
        } else if (errorMessage) {
            //handle the error
        }
    }];
    
}



- (void)updateTableData {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tableView reloadData];
    });
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.videoList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SMVideoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"videoCell"];
    
    if (!cell) {
        cell = [[SMVideoCell alloc] init];
    }
        
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    SMVideoCell *videoCell = (SMVideoCell *)cell;
    SMVideoModel *video = [self.videoList objectAtIndex:indexPath.row];
    [videoCell configureCell:video];
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SMVideoModel *video = [self.videoList objectAtIndex:indexPath.row];
    
    [self performSegueWithIdentifier:@"videoVC" sender:video];
    
}

#pragma mark - Segue method

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    SMDetailVideoController *detailVC = segue.destinationViewController;
    SMVideoModel *video = sender;
    detailVC.video = video;
    
}


@end
