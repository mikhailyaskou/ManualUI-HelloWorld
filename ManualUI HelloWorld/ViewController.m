//
//  ViewController.m
//  ManualUI HelloWorld
//
//  Created by Mikhail Yaskou on 24.04.17.
//  Copyright © 2017 Mikhail Yaskou. All rights reserved.
//

#import "ViewController.h"
#import "ViewControllerHello.h"


@interface ViewController ()

@property (nonatomic, retain) UILabel *labelFirstName;
@property (nonatomic, retain) UILabel *labelLastName;
@property (nonatomic, retain) UILabel *labelHelloWorld;
@property (nonatomic, retain) UITextField *textFirstName;
@property (nonatomic, retain) UITextField *textLastName;
@property (nonatomic, assign) ViewControllerHello *viewHello;
@property (nonatomic, retain) UIButton *buttonHello;

@end

@implementation ViewController

float const leftIndent = 40;
float  const topIndent = 60;
float const ySize = 30;

@synthesize labelFirstName = _labelFirstName,
            labelLastName = _labelLastName,
            labelHelloWorld = _labelHelloWorld,
            textFirstName = _textFirstName,
            textLastName=_textLastName,
            viewHello = _viewHello,
            buttonHello = _buttonHello;

- (void)setLabelFirstName:(UILabel *)labelFirstName{
    
    if (_labelFirstName != labelFirstName) {
        [_labelFirstName release];
        _labelFirstName = [labelFirstName retain];
    }
}

-(UILabel *)labelFirstName{
    return _labelFirstName;
}

- (void)setLabelLastName:(UILabel *)labelLastName{
    
    if (_labelLastName != labelLastName){
        [_labelLastName release];
        _labelLastName = [labelLastName retain];
    }
}

-(UILabel *)labelLastName{
    return _labelLastName;
}

-(void)setLabelHelloWorld:(UILabel *)labelHelloWorld{
    if (_labelHelloWorld != labelHelloWorld) {
        [_labelHelloWorld release];
        _labelHelloWorld = [labelHelloWorld retain];
    }
}

-(void)setViewHello:(ViewControllerHello *)viewHello{
    _viewHello = viewHello;
}

-(ViewControllerHello *)viewHello{
    return _viewHello;
}


-(UILabel *)labelHelloWorld{
    return _labelHelloWorld;
}

-(void)setTextFirstName:(UITextField *)textFirstName{
    if (_textFirstName!=textFirstName){
        [_textFirstName release];
        _textFirstName = [textFirstName retain];
    }
}

-(UITextField *)textFirstName{
    return _textFirstName;
}

-(void)setTextLastName:(UITextField *)textLastName{
    if (_textLastName!=textLastName){
        [_textLastName release];
        _textLastName = [textLastName retain];
    }
}

-(UITextField *)textLastName{
    return _textLastName;
}

-(void)setButtonHello:(UIButton *)buttonHello{
    if (buttonHello!= _buttonHello){
        [_buttonHello release];
        _buttonHello = [buttonHello retain];
    }
}

-(UIButton *)buttonHello{
    return _buttonHello;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor blackColor];
    

    float xSize = (self.view.frame.size.width-leftIndent*2);

    float X_Co = (self.view.frame.size.width-xSize)/2;
    float Y_Co = (self.view.frame.size.height-ySize)/2;
    
    float yInterval = ySize;
    
    
    _labelFirstName = [[UILabel alloc] initWithFrame:CGRectMake(leftIndent, topIndent, xSize, ySize)];
    [self.labelFirstName setText:@"First name"];
    [self.labelFirstName setTextColor: [UIColor orangeColor]];
    
    
    _textFirstName = [[UITextField alloc] initWithFrame:CGRectMake(leftIndent, (self.labelFirstName.frame.origin.y + yInterval), xSize, ySize)];
    [self.textFirstName setBorderStyle:UITextBorderStyleRoundedRect];
    
    _labelLastName =[[UILabel alloc] initWithFrame:CGRectMake(leftIndent, (self.textFirstName.frame.origin.y + yInterval), xSize, ySize)];
    [self.labelLastName setText:@"Last name"];
    [self.labelLastName setTextColor: [UIColor orangeColor]];
    
    
    _textLastName = [[UITextField alloc] initWithFrame:CGRectMake(leftIndent, (self.labelLastName.frame.origin.y + yInterval), xSize, ySize)];
    [self.textLastName setBorderStyle:UITextBorderStyleRoundedRect];

 
    _buttonHello = [[UIButton alloc] init];
    [self.buttonHello setFrame:CGRectMake(X_Co, Y_Co, xSize, ySize)];
    [self.buttonHello setTitle:@"Hello!" forState:UIControlStateNormal];
    [self.buttonHello setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    self.buttonHello.layer.cornerRadius = 5;
    self.buttonHello.layer.borderWidth = 1;
    [self.buttonHello.layer setBorderColor:[[UIColor orangeColor] CGColor]];
    [self.buttonHello addTarget: self action: @selector(buttonClicked:) forControlEvents: UIControlEventTouchUpInside];

    
    
    _labelHelloWorld =[[UILabel alloc] initWithFrame:CGRectMake(leftIndent, (self.buttonHello.frame.origin.y
                                                                                    - (yInterval * 2)), xSize, ySize)];
    self.labelHelloWorld.textAlignment = NSTextAlignmentCenter;
    [self.labelHelloWorld setTextColor: [UIColor orangeColor]];

    [self.view addSubview:self.labelFirstName];
    [self.view addSubview:self.textFirstName];
    [self.view addSubview:self.labelLastName];
    [self.view addSubview:self.textLastName];
    [self.view addSubview:self.labelHelloWorld];
    [self.view addSubview:self.buttonHello];
    
    _viewHello = [[ViewControllerHello alloc] init];
}

- (IBAction) buttonClicked: (id)sender
{
    if (self.trimedFirstName.length > 0
        && self.trimedLastName.length >0){
        
        if (self.viewHello.helloLabel == nil){
            [self.viewHello initHelloLabel];
        }
        
        self.viewHello.helloLabel.text = [NSString stringWithFormat:@"Welcome %@ %@!", self.trimedFirstName, self.trimedLastName];
        [self presentViewController:self.viewHello animated:YES completion:nil];
        
    }else{
        
        [self shakeView];
    }
}


-(void)shakeView {
    
    CABasicAnimation *shake = [CABasicAnimation animationWithKeyPath:@"position"];
    [shake setDuration:0.1];
    [shake setRepeatCount:2];
    [shake setAutoreverses:YES];
    [shake setFromValue:[NSValue valueWithCGPoint: CGPointMake(self.buttonHello.center.x - 5, self.buttonHello.center.y)]];
    [shake setToValue:[NSValue valueWithCGPoint: CGPointMake(self.buttonHello.center.x + 5, self.buttonHello.center.y)]];
    [self.buttonHello.layer addAnimation:shake forKey:@"position"];
}

- (NSString*) trimedFirstName{
    
    return [self.textFirstName.text stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceCharacterSet]];
}

- (NSString*) trimedLastName{
    
    return [self.textLastName.text stringByTrimmingCharactersInSet:
            [NSCharacterSet whitespaceCharacterSet]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc{
    [_labelLastName release];
    [_labelFirstName release];
    [_labelHelloWorld release];
    [_textLastName release];
    [_textFirstName release];
    [_buttonHello release];
    [super dealloc];
    
}



@end
