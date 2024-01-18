using { FasionShopService } from '../fashionShop_srv';

annotate FasionShopService.Sections with {
    id @title: 'ID';
    name @title: 'Section';
    description @title: 'Description';
} ;


annotate FasionShopService.Sections with @(

    //Para ocultar el filtro Search
    Capabilities.SearchRestrictions: {
        $Type : 'Capabilities.SearchRestrictionsType',
        Searchable : false   
    },
    //Filtros de busqueda
    UI.SelectionFields : [
        //id,
        name
    ],

    //Resaltar camplo clave
    Common.SemanticKey : [
        id
    ],

    //Tabla de datos        
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : id            
        },
        {
            $Type : 'UI.DataField',
            Value : name
        }
        ,
        {
            $Type : 'UI.DataField',
            Value : description
        }
    ]
);