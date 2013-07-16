//
//  Factory.h
//  Factory
//
//  Created by 紫冬 on 13-7-16.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "Fruit.h"
#import "Apple.h"
#import "Orange.h"
#import "Banana.h"
#import "Pear.h"

/*
 工厂设计方法，主要是使用了反射的原理，通过传入一个类的名字，直接创建出该类的一个对象，
 这样就避免了，使用if---else多分支了，并且当我们要创建新类的类对象的时候，直接传新类的名字，如果要是用if---else分支，
 我们还必须再添加一个if分支语句，在下面的实现中，我们将进行对比
 
 使用方法：调用工厂类，传入要创建的类对象的类名，最后向下转型为该类对象
 */

@interface Factory : Fruit

//通过传入一个类名，来创建一个通用对象
+(NSObject *)createObject:(NSString *)objName;

//通过传入一个类名，来创建一个对象
+(Fruit *)createFruit1:(NSString *)fruitName;

//利用if--else分支来创建对象
+(Fruit *)createFruit2:(NSString *)fruitName;
@end
