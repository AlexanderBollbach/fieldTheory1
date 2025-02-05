//
//  UIBezierPath+forEachElement.m
//  PathTest
//
//  Created by alexanderbollbach on 11/1/15.
//  Copyright © 2015 alexanderbollbach. All rights reserved.
//




#import "UIBezierPath+forEachElement.h"

typedef void (^UIBezierPath_forEachElement_Block)(CGPathElement const *element);

@implementation UIBezierPath (forEachElement)

static void applyBlockToPathElement(void *info, CGPathElement const *element) {
   __unsafe_unretained UIBezierPath_forEachElement_Block block =(__bridge  UIBezierPath_forEachElement_Block)info;
   block(element);
}

- (void)forEachElement:(void (^)(const CGPathElement *))block {
   CGPathApply(self.CGPath, (__bridge void *)block, applyBlockToPathElement);
}

@end