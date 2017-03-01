//
//  SubCustomCell.m
//  TreeView
//
//  Created by  on 28/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import "SubCustomCell.h"
#import "Node.h"
@implementation SubCustomCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)fillCellWithNode:(Node *)node {
    [self.textLabel setText:node.Desc];
}

@end
