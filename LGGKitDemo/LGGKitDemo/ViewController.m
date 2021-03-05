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
    
    self.view.backgroundColor = UIColorFromRGB(0xda5144);
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    NSArray *arr;
    
    BOOL a = ObjectIsNilOrNull(arr);
    
    
    NSLog(@"%.2f",a);
}

@end
