//
//  SubCustomCell.h
//  TreeView
//
//  Created by  on 28/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Node.h"
@interface SubCustomCell : UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;
-(void)fillCellWithNode:(Node *)node;
@end
