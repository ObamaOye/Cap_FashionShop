//using { FasionShop_Service } from '../fashionShop_srv';
using  from '../fashionShop_srv';

/*annotate FasionShop_Service.Sections with {
    id @title: 'ID';
    name @title: 'Section';
    description @title: 'Description';
} ;*/


annotate FasionShop_Service.Sections with @(

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
            ![@HTML5.CssDefaults] : {
                $Type : 'HTML5.CssDefaultsType',
                width : '20rem',
            },
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
    ],
    //info de cabecera
       UI.HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Online Fashion Shop',
            TypeNamePlural : 'Online Fashion Shop',
            Title : {
                Value : name
            },
            Description : {
                Value : 'Online Fashion Shop Section'
            }
        },

    UI.Facets : [
        
        {
            $Type : 'UI.CollectionFacet',
            Label : 'Section Details',
            Facets : [
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.FieldGroup#SectionDetails'
                }
            ]
        }
    ],
    UI.FieldGroup #SectionDetails : {
        Data : [
            {Value: id },
            {
                Value: description
            },
            { Value: name}
        ]
    }
);