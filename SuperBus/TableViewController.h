//
//  ViewController.h
//  CollapseClick
//
//  Created by Ben Gordon on 2/28/13.
//  Copyright (c) 2013 Ben Gordon. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollapseClick.h"

@interface TableViewController : UIViewController <CollapseClickDelegate,UITextFieldDelegate> {
    IBOutlet UIView *test1View;
    IBOutlet UIView *test2View;
    IBOutlet UIView *test3View;
    
    __strong IBOutlet CollapseClick *myCollapseClick;
}


@end
