using app.fasionShop from '../db/fashionShop';

@(path: 'FashionShop')
service FasionShopService  {

    entity Sections as projection on fasionShop.Sections;
        annotate Sections  with @odata.draft.enabled; 
    entity Items as projection on fasionShop.F_Items;
        annotate Items  with @odata.draft.enabled; 
    entity Types as projection on fasionShop.F_Types;
        annotate Types  with @odata.draft.enabled; 
        

    entity Srv_FashionShop as projection on fasionShop.V_FashionShop
}