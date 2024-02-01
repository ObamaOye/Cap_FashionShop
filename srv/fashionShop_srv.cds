using app.fasionShop from '../db/fashionShop';

service FasionShop_Service  {

    entity Sections as projection on fasionShop.Sections;
         
    entity Fashion_Items as projection on fasionShop.Fashion_Items;
        annotate Fashion_Items with @odata.draft.enabled; 
    
    @cds.redirection.target: true
    entity Fashion_Types as projection on fasionShop.Fashion_Types; 
        
        
    entity Srv_FashionShop as projection on fasionShop.YC_FashionShop;
        annotate Srv_FashionShop with @odata.draft.enabled;

    entity YC_FashionType as projection on fasionShop.YC_FashionType;
        
} 

