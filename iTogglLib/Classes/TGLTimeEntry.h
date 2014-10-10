//
//  TGLTimeEntry.h
//  iToggl
//
//  Created by Christoph Krautz on 05/05/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TGLTimeEntry : NSObject

@property (nonatomic, readwrite) NSInteger identifier;
@property (nonatomic, readwrite) NSString *entryDescription;
@property (nonatomic, readwrite) NSInteger pid;
@property (nonatomic, readwrite) NSDate *start;
@property (nonatomic, readwrite) NSDate *stop;

- (BOOL)isEqualToTimeEntry:(TGLTimeEntry *)entry;

@end
