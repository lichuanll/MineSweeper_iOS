//
//  GamePlay.m
//  MineSweeper
//
//  Created by 312 on 2023/12/6.
//  Copyright © 2023 312. All rights reserved.
//

#import "GamePlay.h"
#import "Mines.h"
#import "GameManager.h"
#import "Number.h"
@implementation GamePlay
-(BOOL)OnBounds:(NSInteger)x :(NSInteger)y
{
    if(x>=0 && y>=0 && x<Row_Count && y<Col_Count)
    {
        return TRUE;
    }
    return false;
}
-(void)InitGame
{
    [self InitMines];
    [self InirNumber];
}
-(void)InitMines
{
    Mines* mine=[Mines new];
    [mine SetupMines];
    for(int i=0;i<MineCount;i++)
    {
        Grids[MinePos[i].x][MinePos[i].y].IsMine=TRUE;
        Grids[MinePos[i].x][MinePos[i].y].SelfId=Mine;
        Grids[MinePos[i].x][MinePos[i].y].AroundMineCount=-1;
    }
}
-(void)InirNumber
{
    Number *num=[Number new];
    [num SetupNumber];
    for(int i=0;i<Row_Count;i++)
    {
        for(int j=0;j<Col_Count;j++)
        {
            switch (Grids[i][j].AroundMineCount) {
                case 1:
                    Grids[i][j].SelfId=Num1;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                case 2:
                    Grids[i][j].SelfId=Num2;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                case 3:
                    Grids[i][j].SelfId=Num3;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                case 4:
                    Grids[i][j].SelfId=Num4;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                case 5:
                    Grids[i][j].SelfId=Num5;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                case 6:
                    Grids[i][j].SelfId=Num6;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                case 7:
                    Grids[i][j].SelfId=Num7;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                case 8:
                    Grids[i][j].SelfId=Num8;
                    //NSLog(@"%ld", Grids[i][j].SelfId);
                    break;
                default:
                    break;
                
            }
        }
    }
}
-(void)OpenSpace: (Grid*) grid
{
    grid.IsOpen=TRUE;
    [grid ChangeImage];
    [grid.uibutton setEnabled:NO];
    if(grid.SelfId == Nullptr)
    {
        int x = (int)grid.Row;
        int y = (int)grid.Col;
        
        for(int i=x-1; i <= x+1; i++)
        {
            for(int j=y-1; j <= y+1 ;j++)
            {
                if((i!=x||j!=y) && [self OnBounds:i :j])
                {
                    if(!Grids[i][j].IsOpen && !Grids[i][j].IsMine)
                    {
                        Grids[i][j].IsOpen=TRUE;
                        [Grids[i][j] ChangeImage];
                        [Grids[i][j].uibutton setEnabled:NO];
                        [self OpenSpace:Grids[i][j]];
                    }
                }
            }
        }
    }
}
-(void)RePlay
{
    for(int i=0;i<Row_Count;i++)
    {
        for(int j=0;j<Col_Count;j++)
        {
            Grids[i][j].SelfId=Nullptr;
            [Grids[i][j] ChangeImage];
            Grids[i][j].uibutton = nil;
        }
    }
}
-(void)DisableAllButton
{
    for(int i=0;i<Row_Count;i++)
    {
        for(int j=0;j<Col_Count;j++)
        {
            [Grids[i][j].uibutton setEnabled:NO];
        }
    }
}
-(BOOL)IsLose:(Grid*) grid
{
    if(grid.IsMine)
    {
        for(int i=0;i<Row_Count;i++)
        {
            for(int j=0;j<Col_Count;j++)
            {
                if(Grids[i][j].IsMine)
                {
                    Grids[i][j].SelfId=Mine;
                    [Grids[i][j] ChangeImage];
                }
            }
        }
        [self DisableAllButton];
        return true;
    }
    
    return false;
}
-(BOOL)IsWin
{
    NSInteger NoOpenCount=0;
    for(int i=0;i<Row_Count;i++)
    {
        for(int j=0;j<Col_Count;j++)
        {
            if(!Grids[i][j].IsOpen)
            {
                NoOpenCount++;
            }
        }
    }
    if(NoOpenCount==MineCount)
    {
        for(int i=0;i<Row_Count;i++)
        {
            for(int j=0;j<Col_Count;j++)
            {
                if(Grids[i][j].IsMine)
                {
                    Grids[i][j].SelfId=Win;
                    [Grids[i][j] ChangeImage];
                }
            }
        }
        [self DisableAllButton];
        return true;
    }
    return false;
}
@end
