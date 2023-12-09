//
//  Number.m
//  MineSweeper
//
//  Created by 312 on 2023/12/6.
//  Copyright © 2023 312. All rights reserved.
//

#import "Number.h"
#import "GameManager.h"
#import "Mines.h"
@implementation Number
-(BOOL)OnBounds:(NSInteger)x :(NSInteger)y
{
    if(x>=0 && y>=0 && x<Col_Count && y<Row_Count)
    {
        return TRUE;
    }
    return false;
}
-(void)SetupNumber
{
    for(int i=0;i<MineCount;i++)
    {
        if([self OnBounds:MinePos[i].x+1 :MinePos[i].y])
        {
            if(Grids[MinePos[i].x+1][MinePos[i].y]!=NULL)
            {
                if(!Grids[MinePos[i].x+1][MinePos[i].y].IsMine)
                {
                    Grids[MinePos[i].x+1][MinePos[i].y].AroundMineCount++;
                }
            }
        }
        
        if([self OnBounds:MinePos[i].x-1 :MinePos[i].y])
        {
            if(Grids[MinePos[i].x-1][MinePos[i].y]!=NULL)
            {
                if(!Grids[MinePos[i].x-1][MinePos[i].y].IsMine)
                {
                    Grids[MinePos[i].x-1][MinePos[i].y].AroundMineCount++;
                }
            }
        }
        
        if([self OnBounds:MinePos[i].x :MinePos[i].y+1])
        {
            if(Grids[MinePos[i].x][MinePos[i].y+1]!=NULL)
            {
                if(!Grids[MinePos[i].x][MinePos[i].y+1].IsMine)
                {
                    Grids[MinePos[i].x][MinePos[i].y+1].AroundMineCount++;
                }
            }
        }
        
        if([self OnBounds:MinePos[i].x :MinePos[i].y-1])
        {
            if(Grids[MinePos[i].x][MinePos[i].y-1]!=NULL)
            {
                if(!Grids[MinePos[i].x][MinePos[i].y-1].IsMine)
                {
                    Grids[MinePos[i].x][MinePos[i].y-1].AroundMineCount++;
                }
            }
        }
        
        if([self OnBounds:MinePos[i].x+1 :MinePos[i].y+1])
        {
            if(Grids[MinePos[i].x+1][MinePos[i].y+1]!=NULL)
            {
                if(!Grids[MinePos[i].x+1][MinePos[i].y+1].IsMine)
                {
                    Grids[MinePos[i].x+1][MinePos[i].y+1].AroundMineCount++;
                }
            }
        }
        
        if([self OnBounds:MinePos[i].x+1 :MinePos[i].y-1])
        {
            if(Grids[MinePos[i].x+1][MinePos[i].y-1]!=NULL)
            {
                if(!Grids[MinePos[i].x+1][MinePos[i].y-1].IsMine)
                {
                    Grids[MinePos[i].x+1][MinePos[i].y-1].AroundMineCount++;
                }
            }
        }
        
        if([self OnBounds:MinePos[i].x-1 :MinePos[i].y+1])
        {
            if(Grids[MinePos[i].x-1][MinePos[i].y+1]!=NULL)
            {
                if(!Grids[MinePos[i].x-1][MinePos[i].y+1].IsMine)
                {
                    Grids[MinePos[i].x-1][MinePos[i].y+1].AroundMineCount++;
                }
            }
        }
        
        if([self OnBounds:MinePos[i].x-1 :MinePos[i].y-1])
        {
            if(Grids[MinePos[i].x-1][MinePos[i].y-1]!=NULL)
            {
                if(!Grids[MinePos[i].x-1][MinePos[i].y-1].IsMine)
                {
                    Grids[MinePos[i].x-1][MinePos[i].y-1].AroundMineCount++;
                }
            }
        }
            
    }
}
@end
