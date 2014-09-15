//
//  TGLProject.m
//  iTogglLib
//
//  Created by Christoph Krautz on 15/09/14.
//  Copyright (c) 2014 Christoph Krautz. All rights reserved.
//

#import "TGLProject.h"

@interface TGLProject ()

@property (nonatomic, readwrite) NSInteger identifier;
@property (nonatomic, readwrite) NSString *name;
@property (nonatomic, readwrite) NSInteger workspaceId;
@property (nonatomic, readwrite) NSInteger clientId;
@property (nonatomic, readwrite) BOOL active;
@property (nonatomic, readwrite) BOOL isPrivate;
@property (nonatomic, readwrite) BOOL template;
@property (nonatomic, readwrite) NSInteger templateId;
@property (nonatomic, readwrite) BOOL billable;
@property (nonatomic, readwrite) BOOL autoEstimates;
@property (nonatomic, readwrite) NSInteger estimatedHours;
@property (nonatomic, readwrite) NSDate *at;
@property (nonatomic, readwrite) NSInteger color;
@property (nonatomic, readwrite) float rate;
@property (nonatomic, readwrite) NSDate *createdAt;

@end

@implementation TGLProject

@end
