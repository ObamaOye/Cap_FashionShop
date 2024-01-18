//schema
namespace app.fasionShop;

using {Currency} from '@sap/cds/common';


type Flag : String(1);

entity Sections {
    key id          : UUID;
        name        : String(16);
        description : String(100);
}

entity F_Types {
    key id          : UUID;
        section     : Association to Sections;
        typename    : String(16);
        description : String(100);
}


entity F_Items {
    key id          : UUID;
        f_type      : Association to F_Types;
        itemname    : String(16);
        brand       : String(16);
        size        : String(10);
        material    : String(16);
        price       : String(10);
        currency    : Currency;
        isAvailable : Flag;
}

view V_FashionShop as
    select from F_Items as Item {
        Item.f_type.section.id          as sectionId,
        Item.f_type.section.name        as sectionName,
        Item.f_type.section.description as sectionDesc,
        Item.f_type.id                  as fashionTypeId,
        Item.f_type.typename            as fashionTypeName,
        Item.f_type.description         as fashionTypeDesc,
        Item.id                         as fashionItemName,
        Item.brand                      as brand,
        Item.size                       as size,
        Item.material                   as material,
        Item.price                      as price,
        Item.currency                   as currency,
        //Item.isAvailable as isAvailable,

        concat(
            Item.brand, concat(
                ' ', Item.itemname
            )
        )                               as ItemDetails : String(32),

        case
            when
                Item.price >= 500
            then
                'Premium'
            when
                Item.price     >= 100
                and Item.price <  500
            then
                'Mid-Range'
            else
                'Low-Range'
        end                             as priceRange  : String(10)


    }
    where
        Item.isAvailable = 'X';

view V_FashionType as
    select from F_Types as fType {
        fType.id  as fashiontypeId,
        fType.typename as fashionTypeName,
        fType.section.name as sectionName,
        fType.description as fashionTypeDesc
    };
