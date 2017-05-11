//
//  ViewControllerHello.m
//  ManualUI HelloWorld
//
//  Created by Mikhail Yaskou on 10.05.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import "ViewControllerHello.h"

//constsnt import;
#import "ViewController.h"

@interface ViewControllerHello ()


@end

@implementation ViewControllerHello

@synthesize helloLabel = _helloLabel;

- (void)initHelloLabel{
    

    float xSize = (self.view.frame.size.width-leftIndent*2);
    
    float Y_Co = (self.view.frame.size.height- ySize)/2;
    
    _helloLabel = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, Y_Co, xSize, ySize)];
    
    self.helloLabel.textColor = [UIColor orangeColor];
    self.helloLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.helloLabel];
    
}

- (void)setHelloLabel:(UILabel *)helloLabel{
    if (helloLabel!=_helloLabel){
        [_helloLabel release];
        _helloLabel = [helloLabel retain];
    }
}

-(UILabel *)helloLabel{
    return _helloLabel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UINavigationBar *navBar = [[[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)] autorelease];
    
    UINavigationItem *navItem = [[[UINavigationItem alloc] init] autorelease];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backShow:)];
    navItem.leftBarButtonItem = leftButton;
    navBar.items = @[ navItem ];
    [self.view addSubview:navBar];

}

- (IBAction)backShow:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES
                                                      completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc{
    [_helloLabel dealloc];
    [super dealloc];
}

@end
