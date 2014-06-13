//
//  BSViewController.m
//  BookShelfExample
//
//  Created by Michał Zaborowski on 13.06.2014.
//  Copyright (c) 2014 Michał Zaborowski. All rights reserved.
//

#import "BSViewController.h"
#import "MZBookShelfCollectionViewLayout.h"

@interface BSViewController () <UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, MZBookshelfCollectionViewLayoutDelegate>

@end

@implementation BSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    MZBookshelfCollectionViewLayout *layout = (id)self.collectionView.collectionViewLayout;
    [layout registerNib:[UINib nibWithNibName:@"MZBookShelfDecorationView" bundle:nil] forDecorationViewOfKind:MZBookshelfCollectionViewLayoutDecorationViewKind];
}

- (CGFloat)widthForSection:(NSInteger)section
{
    UICollectionViewFlowLayout *layout = (id)self.collectionView.collectionViewLayout;
    
    CGFloat availableWidth = layout.collectionViewContentSize.width - (layout.sectionInset.left + layout.sectionInset.right);
    int itemsAcross = floorf((availableWidth + layout.minimumInteritemSpacing) / (layout.itemSize.width + layout.minimumInteritemSpacing));
    int itemCount = [layout.collectionView numberOfItemsInSection:section];
    int rows = ceilf(itemCount/(float)itemsAcross);
    CGFloat itemsInRow = ceilf((double)itemCount /rows);
    
    return itemsInRow * (layout.itemSize.width + layout.minimumInteritemSpacing) + (layout.sectionInset.left + layout.sectionInset.right);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout referenceSizeForDecorationViewForRow:(NSInteger)row inSection:(NSInteger)section
{
    if (section == 0) {
        if (collectionViewLayout.scrollDirection == UICollectionViewScrollDirectionHorizontal) {
            return CGSizeMake([self widthForSection:section], 30);
        } else {
            return CGSizeMake(collectionViewLayout.collectionViewContentSize.width, 30);
        }
        
    }
    return CGSizeZero;
}

- (UIOffset)collectionView:(UICollectionView *)collectionView layout:(MZBookshelfCollectionViewLayout *)collectionViewLayout decorationViewAdjustmentForRow:(NSInteger)row inSection:(NSInteger)section
{
    return UIOffsetMake(0, 0);
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 16;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
    return reusableView;
}

@end
