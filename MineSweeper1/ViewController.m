//
//  ViewController.m
//  MineSweeper
//
//  Created by 312 on 2023/12/5.
//  Copyright © 2023 312. All rights reserved.
//

#import "ViewController.h"
#import "GameManager.h"
#import "GamePlay.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *FlagButton;

- (IBAction)MakeFlag:(id)sender;

- (void)AddButton;
- (void)ClickEvent:(UIButton*) sender;
- (IBAction)RePlay:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *RePlayButton;
@property (nonatomic,strong) GameManager *game;
@property (nonatomic,strong) GamePlay *gameplay;
@end

@implementation ViewController
- (IBAction)MakeFlag:(id)sender {
    if(IsFlag)
    {
        UIImage* ButtonImage=[UIImage imageNamed:@"buttonflag"];
        [self.FlagButton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
        IsFlag=false;
        
    }
    else if(!IsFlag)
    {
        UIImage* ButtonImage=[UIImage imageNamed:@"leiflag"];
        [self.FlagButton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
        IsFlag=true;
    }
}

-(void)AddButton
{
    for(int i=0;i<Row_Count;i++)
    {
        for(int j=0;j<Col_Count;j++)
        {
            [Grids[i][j] SetGrid];
            //Grids[2][1].uibutton.backgroundColor = [UIColor redColor];
            [Grids[i][j].uibutton addTarget:self action:@selector(ClickEvent:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:Grids[i][j].uibutton];
        }
    }
}
- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage* ButtonImage=[UIImage imageNamed:@"over"];
    UIImage* ButtonImage1=[UIImage imageNamed:@"buttonflag"];
    [self.FlagButton setBackgroundImage:ButtonImage1 forState:UIControlStateNormal];
    [self.RePlayButton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
    
    
    _game=[[GameManager alloc] initGameManager];//分配了内存
    [_game InitGrids];//为每一个Grid创建了按钮
    _gameplay = [GamePlay new];
    [_gameplay InitGame];
    [self AddButton];
    // Do any additional setup after loading the view, typically from a nib.
}


//- (IBAction)DeBugFun:(id)sender {
//
////    NSMutableArray<NSMutableArray<Grid*>*>* temp=Grids;
////    [temp[2][2] SetGrid];
////    [self.view addSubview:temp[2][2].uibutton];
////    self.DeBugText.text = [temp[2][2] GetDebug];
////    [temp[1][2] GetDebug];
////    temp[1][2].Row=5;
////    NSLog([NSString stringWithFormat:@"%ld",temp[1][2].Row]);
//}
- (void)ClickEvent:(UIButton*) sender
{
    
    NSInteger tag = sender.tag;
    NSInteger x=(NSInteger)tag / 10;
    NSInteger y=(NSInteger)tag % 10;
    if(IsFlag)
    {
        if(Grids[x][y].IsFlag)
        {
            UIImage* ButtonImage=[UIImage imageNamed:@"top.JPEG"];
            [Grids[x][y].uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            Grids[x][y].IsFlag=false;
        }
        else
        {
            UIImage* ButtonImage=[UIImage imageNamed:@"flag.gif"];
            [Grids[x][y].uibutton setBackgroundImage:ButtonImage forState:UIControlStateNormal];
            Grids[x][y].IsFlag=TRUE;
        }
    }
    else
    {
        [_gameplay OpenSpace: Grids[x][y]];
        if([_gameplay IsWin])
        {
            [self.FlagButton setEnabled:NO];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你赢了" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                
            }];
            [alert addAction:OK];
            [self presentViewController:alert animated:YES completion:nil];
        }
        if([_gameplay IsLose:Grids[x][y]])
        {
            [self.FlagButton setEnabled:NO];
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"你输了" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *OK = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action){
                
            }];
            [alert addAction:OK];
            [self presentViewController:alert animated:YES completion:nil];
        }
        
    }
    //    Grid *g = [Grid new];
    //    g=Grids[x][y];
    
}

- (IBAction)RePlay:(id)sender {
    [self.FlagButton setEnabled:YES];
    [_gameplay RePlay];
    [self viewDidLoad];
}
@end
