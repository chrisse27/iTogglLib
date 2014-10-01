//
//  TGLTimeEntry.h
//  iToggl
//
//  Created by Christoph Krautz on 05/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGLTimeEntry : NSObject

@property (nonatomic, readonly) NSInteger identifier;
@property (nonatomic, readonly) NSString *description;
@property (nonatomic, readonly) NSInteger pid;
@property (nonatomic, readonly) NSDate *start;
@property (nonatomic, readonly) NSDate *stop;

- (id)initWithIdentifier:(NSInteger) identifier andDescription:(NSString *)description andStart:(NSDate *)start andStop:(NSDate *)stop andPid:(NSInteger) pid;
- (BOOL)isEqualToTimeEntry:(TGLTimeEntry *)entry;

@end
