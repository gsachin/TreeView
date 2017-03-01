//
//  ViewControllerDelegate.h
//  TreeView
//
//  Created by  on 04/07/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomCellDelegate <NSObject>
@property (weak, nonatomic) IBOutlet CustomTableView *aTV;
-(void)reloadview:(CustomTableView *)ctv;
@end
