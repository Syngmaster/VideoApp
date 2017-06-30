//
//  SMCustomButton.m
//  YoutubeApp
//
//  Created by Syngmaster on 30/06/2017.
//  Copyright © 2017 Syngmaster. All rights reserved.
//

#import "SMCustomButton.h"

@implementation SMCustomButton

- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = [UIColor colorWithRed:81.0/255.0 green:164.0/255.0 blue:255.0/255.0 alpha:1.0];
    self.layer.cornerRadius = 5.0;
    self.layer.borderWidth = 1.0;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    
    self.layer.shadowOffset = CGSizeMake(0.0, 2.0);
    self.layer.shadowOpacity = 2.0;
    self.layer.shadowColor = [UIColor grayColor].CGColor;
    self.layer.shadowRadius = 1.0;
    
    UIFont *font = [UIFont fontWithName:@"Avenir Heavy" size:20];
    
    NSDictionary *attributes = @{NSForegroundColorAttributeName : [UIColor whiteColor], NSFontAttributeName : font};
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithString:@"Ok" attributes:attributes];
    
    [self setAttributedTitle:attrString forState:UIControlStateNormal];

}

@end
