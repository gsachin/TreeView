//
//  CustomTableView.m
//  TreeView
//
//  Created by  on 03/07/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import "CustomTableView.h"

@implementation CustomTableView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _CellList=[[NSMutableArray alloc]init];
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
