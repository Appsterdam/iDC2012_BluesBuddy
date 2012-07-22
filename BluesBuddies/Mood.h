//
//  Mood.h
//  BluesBuddies
//
//  Created by Sijmen Mulder on 22-07-12.
//  Copyright (c) 2012 iosSatellite. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const MoodNameHappy;
extern NSString * const MoodNameCool;
extern NSString * const MoodNameDazed;
extern NSString * const MoodNameSad;
extern NSString * const MoodNameSadIsh;
extern NSString * const MoodNameHopeful;
extern NSString * const MoodNameEcstatic;
extern NSString * const MoodNameAnxious;
extern NSString * const MoodNameLove;

@interface Mood : NSObject

@property NSString *name;
@property (readonly) NSString *localizedName;
@property (readonly) UIImage *image;

+ (NSArray *)allMoods;
+ (NSArray *)allMoodNames;
+ (Mood *)currentMood;
+ (Mood *)moodByName:(NSString *)name;

- (void)makeCurrent;

@end
