//
//  Patient.m
//  BlockHomework
//
//  Created by Stepan Paholyk on 6/30/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import "Patient.h"
#import <UIKit/UIKit.h>


@implementation Patient;

/*
- (instancetype)initPatientWithName:(NSString *)name patientTemperature:(float)temperature problemPlace:(Patient*)problem patientBlock:(void (^)(Patient *))patientBlock {
    
    if (self = [super init]) {
        _name = name;
        _temperature = temperature;
        float delay = arc4random()%11;
        NSLog(@"%f",delay);
        [self performSelector:@selector(feelsWorse:) withObject:patientBlock afterDelay:delay];
    }
    return self;
}
*/

#pragma mark - Class Methods

+ (id) paitentWithName:(NSString *)name temperature:(float)temperature andBlock:(void (^)(Patient *))block {
    Patient* anyPatient = [[Patient alloc] init];
    
    anyPatient.name = name;
    anyPatient.temperature = temperature;
    
    NSInteger delay = arc4random() % 3 + 5;
    
    [anyPatient performSelector:@selector(feelsWorse:) withObject:block afterDelay:delay];
    return  anyPatient;
}

- (void) makeShot {
    NSLog(@"%@ makes a shot", self.name);
}

- (void) takePill {
    NSLog(@"%@ take a pill", self.name);
}

- (void) feelsWorse:(void (^)(Patient *))mainBlock {
    __weak Patient* weakSelf = self;
    mainBlock(weakSelf);
}



@end
