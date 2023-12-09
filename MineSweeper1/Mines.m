//
//  Mines.m
//  MineSweeper
//
//  Created by 312 on 2023/12/6.
//  Copyright © 2023 312. All rights reserved.
//

#import "Mines.h"
#import "GameManager.h"
@implementation Mines
 NSMutableArray<Vector2*>* MinePos;

-(void)SetupMines
{
    MinePos = [NSMutableArray<Vector2*> new];
    BOOL flag=true;
    for(int i=0;i< MineCount;i++)
    {
        Vector2* m =[Vector2 new];
        m.x = arc4random_uniform((uint32_t)Col_Count);
        m.y = arc4random_uniform((uint32_t)Row_Count);
        for(int j=0;j<i;j++)
        {
            if(m.x==MinePos[j].x && m.y==MinePos[j].y)
            {
                i--;
                flag=false;
                break;
            }
        }
        if(flag)
        {
            [MinePos addObject:m];
            //MinePos[i]=m;
            //NSLog([NSString stringWithFormat:@"%ld:%ld",m.x,m.y]);
            //NSLog([NSString stringWithFormat:@"%ld",y]);
        }
        else
        {
            m=NULL;
        }
        flag=true;
    }
}
@end
