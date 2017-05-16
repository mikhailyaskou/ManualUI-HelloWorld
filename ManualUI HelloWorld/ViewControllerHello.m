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

- (void)dealloc{
    [_helloLabel release];
    [super dealloc];
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

- (void)prepearAndSetTextInHelloLabel{
    

    CGRect frame = self.view.frame;

    CGFloat xSize = CGRectGetWidth(frame) - leftIndent *2;
    CGFloat yCoordinat = (CGRectGetHeight(frame) - ySize) / 2;
    
    self.helloLabel = [[[UILabel alloc] initWithFrame:CGRectMake(leftIndent, yCoordinat, xSize, ySize)]autorelease];
    self.helloLabel.textColor = [UIColor orangeColor];
    self.helloLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.helloLabel];
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationBar *navBar = [[[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)] autorelease];
    
    UINavigationItem *navItem = [[[UINavigationItem alloc] init] autorelease];
    
    UIBarButtonItem *leftButton = [[[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backButtonTapped:)] autorelease];
    navItem.leftBarButtonItem = leftButton;
    navBar.items = @[ navItem ];
    [self.view addSubview:navBar];

}


- (IBAction)backButtonTapped:(id)sender {
    
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
