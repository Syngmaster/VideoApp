//
//  SMCustomView.m
//  YoutubeApp
//
//  Created by Syngmaster on 24/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCustomView.h"

@implementation SMCustomView

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.cornerRadius = 3.0;
    self.layer.shadowColor = [UIColor colorWithRed:157.0/255.0 green:157.0/255.0 blue:157.0/255.0 alpha:0.8].CGColor;
    self.layer.shadowOpacity = 0.8;
    self.layer.shadowRadius = 5.0;
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    
}

@end
