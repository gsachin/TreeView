//
//  NodeList.h
//  TreeView
//
//  Created by  on 25/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Node : NSObject
@property(strong,nonatomic)NSString *NodeId;
@property(strong,nonatomic)NSString *Desc;
@property(nonatomic)int NodeType;
@property(nonatomic,strong)NSString *IsExpanded;
@property(strong,nonatomic)NSMutableArray *NodeList;
-(NSString *)toJSON;
@end
