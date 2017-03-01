//
//  NodeList.m
//  TreeView
//
//  Created by  on 25/06/15.
//  Copyright (c) 2015 None. All rights reserved.
//

#import "Node.h"

@implementation Node
/*
 Node *node=[[Node alloc]init];
 node.NodeId=@"1";
 node.Desc=@"n-1.0";
 node.NodeType=0;
 
 node.NodeList=[[NSMutableArray alloc]init];
 Node *node11=[[Node alloc]init];
 node11.NodeId=@"1.1";
 node11.Desc=@"n-1.1.0";
 node11.NodeType=0;
 node11.NodeList=[[NSMutableArray alloc]init];
 Node *node111=[[Node alloc]init];
 node111.NodeId=@"1.1.1";
 node111.Desc=@"n-1.1.1";
 node111.NodeType=0;
 [node11.NodeList addObject:node111];
 [node.NodeList addObject:node11];
 
 
 Node *node12=[[Node alloc]init];
 node12.NodeId=@"1.2";
 node12.Desc=@"n-1.2.0";
 node12.NodeType=0;
 node11.NodeList=[[NSMutableArray alloc]init];
 Node *node112=[[Node alloc]init];
 node112.NodeId=@"1.1.2";
 node112.Desc=@"n-1.1.2";
 node112.NodeType=0;
 [node12.NodeList addObject:node112];
 [node.NodeList addObject:node12];

 */
-(NSString *)toJSON {
    NSMutableString *nodeList=[[NSMutableString alloc]init];
    bool firstIteration=true;
    for(id obj in _NodeList)
    {
        if (firstIteration) {
            [nodeList appendFormat:@"%@",[obj toJSON]];
            firstIteration=false;
        }else{
            [nodeList appendFormat:@",%@",[obj toJSON]];
        }
        
    }
    return  [NSString stringWithFormat:@"{\"NodeId\":\"%@\",\"Desc\":\"%@\",\"NodeType\":\"%d\",\"IsExpanded\":\"%@\",\"NodeList\":[%@]}",_NodeId,_Desc,_NodeType,_IsExpanded,nodeList];
}
@end
