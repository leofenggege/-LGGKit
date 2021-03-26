//
//  ViewController.m
//  LGGKitDemo
//
//  Created by LeoGege on 2/5/21.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = LGGHexColor(@"da5144");
    
    UIView *testV = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    testV.backgroundColor = UIColor.blueColor;
    
//    [testV addTapGestureTarget:self action:@selector(taptap)];
    
    WeakSelf
    [testV addTapGestureEventHandle:^(id  _Nonnull sender, UITapGestureRecognizer * _Nonnull gestureRecognizer) {
        StrongSelf
        
        [self.view LGG_showToasrInCenter:@"LLLLLL"];
    }];
    
    [self.view addSubview:testV];
}


- (void)taptap {
    [self.view LGG_showToasrInCenter:@"gggggg"];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
//    NSArray *arr;
    
//    BOOL a = ObjectIsNilOrNull(arr);
    
    
//    [self.view makeToast:@"aakakak" duration:0.5 position:CSToastPositionBottom];
}

@end
