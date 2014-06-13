//
//  BWBookShelfCollectionViewLayout.h
//  BookWhiz
//
//  Created by Michał Zaborowski on 13.06.2014.
//  Copyright (c) 2014 Michał Zaborowski. All rights reserved.
//
// This project is an rewritten version of grid layout by Mark Pospesel there: http://markpospesel.wordpress.com/2012/12/11/decorationviews/

#import <UIKit/UIKit.h>
#import "LXReorderableCollectionViewFlowLayout.h"

extern NSString *const MZBookshelfCollectionViewLayoutDecorationViewKind;

@class MZBookshelfCollectionViewLayout;

@protocol MZBookshelfCollectionViewLayoutDelegate <UICollectionViewDelegateFlowLayout>
@required
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout referenceSizeForDecorationViewForRow:(NSInteger)row inSection:(NSInteger)section;

@optional
- (UIOffset)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout decorationViewAdjustmentForRow:(NSInteger)row inSection:(NSInteger)section;
@end

@interface MZBookshelfCollectionViewLayout : LXReorderableCollectionViewFlowLayout
@end
