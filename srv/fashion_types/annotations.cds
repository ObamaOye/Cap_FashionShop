using {FasionShop_Service } from '../fashionShop_srv';

annotate FasionShop_Service.Fashion_Types with @(
    //Para ocultar el filtro Search
    Capabilities.SearchRestrictions: {
        $Type : 'Capabilities.SearchRestrictionsType',
        Searchable : true
    },
    //Filtros de busqueda
    UI.SelectionFields : [
        typename
    ],

    //Resaltar camplo clave
    Common.SemanticKey : [
        id
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : id
        },
        {
            $Type : 'UI.DataField',
            Value : section_id
        },
        
        {
            $Type : 'UI.DataField',
            Value : typename
        },
        {
            $Type : 'UI.DataField',
            Value : description
        }
    ]
);
