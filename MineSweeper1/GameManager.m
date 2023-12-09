//
//  GameManager.m
//  MineSweeper
//
//  Created by 312 on 2023/12/5.
//  Copyright © 2023 312. All rights reserved.
//

#import "GameManager.h"
@implementation GameManager
 NSInteger MaxWidth  = 360;
 NSInteger MaxHeight = 360;
 NSInteger MineCount = 10;
 NSInteger Row_Count = 9;
 NSInteger Col_Count = 9;
 NSInteger Top_offset = 200;
 NSInteger Left_offset = 7;
 NSInteger Grid_Width;
 NSInteger Grid_Height;
 BOOL IsFlag=false;
 NSMutableArray<NSMutableArray<Grid*>*>* Grids;
-(void) InitGrids
{
    for(int i=0;i<Row_Count;i++)
    {
        NSMutableArray<Grid*>* Row = [NSMutableArray<Grid*> new];
        
        for(int j=0;j<Col_Count;j++)
        {
            Grid* g=[[Grid alloc] initGrid];
            g.uibutton=[UIButton buttonWithType:UIButtonTypeSystem];
            g.uibutton.tag=i*10+j;
            g.Row = i;
            g.Col = j;
            [Row addObject:g];
            //GridCount++;
        }
        [Grids addObject:Row];
    }
}
-(instancetype)initGameManager
{
    self=[super init];
    if(self)
    {
        Grids=[NSMutableArray<NSMutableArray<Grid*>*> new];
        Grid_Width  = (NSInteger)MaxWidth/Col_Count;
        Grid_Height = (NSInteger)MaxHeight/Row_Count;
        //NSLog(@"GameManagerInit");
    }
    return self;
}
@end
