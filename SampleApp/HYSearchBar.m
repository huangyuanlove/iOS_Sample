//
//  HYSearchBar.m
//  SampleApp
//
//  Created by 代烁 on 2020/6/24.
//  Copyright © 2020 huangyuan. All rights reserved.
//

#import "HYSearchBar.h"
#import "ScreenAdapter.h"


@interface HYSearchBar()<UITextFieldDelegate>
@property(nonatomic,strong,readwrite) UITextField *textField;
@end

@implementation HYSearchBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:({
            _textField = [[UITextField alloc]initWithFrame:CGRectMake(UI(10), UI(5), frame.size.width-UI(10)*2, frame.size.height-UI(5)*2)];
            _textField.backgroundColor = [UIColor whiteColor];
            _textField.delegate = self;
            _textField.leftView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon.bundle/icon"]];
            _textField.clearButtonMode = UITextFieldViewModeAlways;
            _textField.placeholder = @"请输入搜索内容";
            
            _textField;
        })];
        
        
    }
    return self;
}

#pragma marl-- delegate




-(void)textFieldDidBeginEditing:(UITextField *)textField{
    NSLog(@"textFieldDidBeginEditing");
    
}

- (void)textFieldDidEndEditing:(UITextField *)textField{
     NSLog(@"textFieldDidEndEditing");
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    NSLog(@"shouldChangeCharactersInRange");
    return YES;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
     NSLog(@"textFieldShouldReturn");
    return YES;
}




@end
