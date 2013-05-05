//
//  SheetCell.m
//  GooSheetSample
//
//  Created by Hokila Jan on 13/5/2.
//  Copyright (c) 2013年 Hokila Jan. All rights reserved.
//

#import "SheetCell.h"

@implementation SheetCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
