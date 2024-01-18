using { FasionShopService } from '../fashionShop_srv';

annotate FasionShopService.Types with {
        id                  @title : 'ID';
        //section             @title  : 'Section ID';
        typename            @title : 'Type';
        description         @title : 'Description';

        //section es un atributo que apunta a otra entidad
        /*section @Common : {
        Text : section,
        TextArrangement : #TextOnly,
    }*/
};


annotate FasionShopService.Types with @(
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
