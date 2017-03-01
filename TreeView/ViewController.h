//
//  ViewController.h
//  TreeView
//
//  Created by  on 21/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Node.h"
#import "CustomTableView.h"
#import "CustomCellDelegate.h"
@interface ViewController : UIViewController<CustomCellDelegate>
@property (weak, nonatomic) IBOutlet CustomTableView *aTV;
//@property (nonatomic,strong)CustomTableView *aTV;
@property (nonatomic,strong)Node *node;
@property (nonatomic,strong)NSDictionary *json;
@property (weak, nonatomic) IBOutlet UIButton *abc;

- (IBAction)abcd:(id)sender;
//-(void)reloadview:(CustomTableView *)ctv;
@end
