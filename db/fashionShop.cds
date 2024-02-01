//schema
namespace app.fasionShop;

using {Currency} from '@sap/cds/common';


type Flag : String(1);

entity Sections {
    key id          : UUID @(title: 'Section ID');
        name        : String(16) @(title: 'Section Name');
        description : String(100) @(title: 'Section Description');
}

entity Fashion_Types {
    key id          : UUID @(title: 'Type ID');
        section     : Association to Sections  @(title: 'Section ID');
        typename    : String(16) @(title: 'Type Name');
        description : String(100) @(title: 'Type Description');
}


entity Fashion_Items {
    key id              : UUID @(title: 'Item ID');
        fashionType     : Association to Fashion_Types @(title: 'Type ID');
        itemname        : String(16) @(title: 'Item Name');
        brand           : String(16) @(title: 'Brand');
        size            : String(10) @(title: 'Size');
        material        : String(16) @(title: 'Material'); 
        price           : String(10) @(title: 'Price');
        currency        : Currency @(title: 'Currency');
        isAvailable     : Flag @(title : 'Is Available?'); //Flas is a Type created by me.
}

//View creatin for Fashion Shop
view YC_FashionShop as
    select from Fashion_Items as fItem {
        fItem.fashionType.section.id          as sectionId,
        fItem.fashionType.section.name        as sectionName,
        fItem.fashionType.section.description as sectionDesc,
        fItem.fashionType.id                  as fashionTypeId,
        fItem.fashionType.typename            as fashionTypeName,
        fItem.fashionType.description         as fashionTypeDesc,
       
        fItem.id                         as fashionItemName,
        fItem.brand                      as brand,
        fItem.size                       as size,
        fItem.material                   as material,
        fItem.price                      as price,
        fItem.currency                   as currency,
        //Item.isAvailable as isAvailable,

        concat(
            fItem.brand, concat(
                ' ', fItem.itemname
            )
        )   as ItemDetails : String(32),

        case
            when
                fItem.price >= 500
            then
                'Premium'
            when
                fItem.price     >= 100
                and fItem.price <  500
            then
                'Mid-Range'
            else
                'Low-Range'
        end as priceRange  : String(10)


    } where fItem.isAvailable = 'X';

 view YC_FashionType as
    select from Fashion_Types as fType {
        fType.id  as fashionTypeId,
        fType.typename as fashionTypeName,
        fType.section.name as sectionName,
        fType.description as fashionTypeDesc
    };
