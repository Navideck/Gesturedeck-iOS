//
//  ViewController.m
//  GdeckObjC
//
//  Created by Rohit Sangwan on 13/10/23.
//

#import "ViewController.h"
@import GesturedeckiOS;

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (weak, nonatomic) IBOutlet UIButton *btnStop;

@property (strong, nonatomic) GesturedeckMedia *gesturedeckMedia;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad]; 
    self.gesturedeckMedia = [[GesturedeckMedia alloc] init];
}

//- (IBAction)onStartButtonTap:(UIButton *)sender {
//    [self.gesturedeckMedia start];
//}
//
//- (IBAction)onStopButtonTap:(UIButton *)sender {
//    [self.gesturedeckMedia stop];
//}
@end
