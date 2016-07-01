//
//  Patient.h
//  BlockHomework
//
//  Created by Stepan Paholyk on 6/30/16.
//  Copyright © 2016 Stepan Paholyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Patient : NSObject

@property (strong, nonatomic) NSString* name;
@property (assign, nonatomic) float temperature;

- (void) takePill;
- (void) makeShot;
- (void) feelsWorse:(void(^)(Patient *))withMainBlock;
+ (id) paitentWithName:(NSString*) name temperature:(float) temperature andBlock: (void(^)(Patient*)) block;

@end
