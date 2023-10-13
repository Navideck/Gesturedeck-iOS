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
@property (weak, nonatomic) IBOutlet UILabel *txtGestureEvent;
@property (strong, nonatomic) GesturedeckMedia *gesturedeckMedia;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.btnStart addTarget:self action:@selector(onStartButtonTap:) forControlEvents:UIControlEventTouchUpInside];
    [self.btnStop addTarget:self action:@selector(onStopButtonTap:) forControlEvents:UIControlEventTouchUpInside];

    self.gesturedeckMedia = [[GesturedeckMedia alloc] init];
    
    __weak typeof(self) weakSelf = self;
    [self.gesturedeckMedia setTapAction: ^{
        weakSelf.txtGestureEvent.text = @"Gesture Event: tapAction";
    }];
    
    self.gesturedeckMedia.tapAction = ^{
        weakSelf.txtGestureEvent.text = @"Gesture Event: tapAction";
    };
}

- (IBAction)onStartButtonTap:(UIButton *)sender {
    [self.gesturedeckMedia start];
}

- (IBAction)onStopButtonTap:(UIButton *)sender {
    [self.gesturedeckMedia stop];
}

@end
