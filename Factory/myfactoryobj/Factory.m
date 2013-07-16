//
//  Factory.m
//  Factory
//
//  Created by 紫冬 on 13-7-16.
//  Copyright (c) 2013年 qsji. All rights reserved.
//

#import "Factory.h"

@implementation Factory

//利用NSObject，和向上转型来创建一个通用对象，当我们要创建一个具体的对象的时候，我们获取该对象以后，还要向下转型
//利用id也是可以的，id和NSObject *的区别就是
/*
 在objc.h中，可以看到id的定义如下
 
 typedef struct objc_class *Class;
 typedef struct objc_object {
 Class isa;
 } *id;
 
 
 在NSObject.h中，可以看到NSObject类的定义如下
 @interface NSObject <NSObject> {
 Class isa;
 }
 
 
 + (void)load;
 
 
 + (void)initialize;
 - (id)init;
 
 
 + (id)new;
 + (id)allocWithZone:(NSZone *)zone;
 + (id)alloc;
 - (void)dealloc;
 
 
 // 很多其它方法，这里省了......
 
 
 @end
 
 
 两个类型都含有Class isa，但NSObject同时包含了一些其它的方法，并需要实现NSObject协议。
 所以NSObject*可以用id来表示。但id不能用NSObject*来表示。
 */
+(NSObject *)createObject:(NSString *)objName
{
    NSObject *obj = nil;
    
    //通过string得到类的结构体
    Class class = NSClassFromString(objName);
    
    //通过转化的class得到实例对象
    obj = [(NSObject *)[[class alloc] init] autorelease];
    
    return obj;
}

//利用反射来创建一个类对象
+(Fruit *)createFruit1:(NSString *)fruitName
{
    Fruit *fruit = nil;
    
    //通过string得到类的结构体
    Class class = NSClassFromString(fruitName);
    
    //通过转化的class得到实例对象
    fruit = [(Fruit *)[[class alloc] init] autorelease];
    
    return fruit;
}

//如果使用if--else分支来创建一个对象，这样我们发现如果新创建一个对象，就要重新修改createFruit1方法，新增加一个if分支
//而利用反射的话，会根据传入的参数，创建不同的
+(Fruit *)createFruit2:(NSString *)fruitName
{
    Fruit *fruit = nil;
    
    if ([fruitName isEqualToString:@"Apple"])
    {
        fruit = [[[Apple alloc] init] autorelease];
    }
    else if ([fruitName isEqualToString:@"Banana"])
    {
        fruit = [[[Banana alloc] init] autorelease];
    }
    else if ([fruitName isEqualToString:@"Pear"])
    {
        fruit = [[[Pear alloc] init] autorelease];
    }
    else if ([fruitName isEqualToString:@"Banana"])
    {
        fruit = [[[Orange alloc] init] autorelease];
    }
    
    return fruit;
}

@end
