using { FasionShopService } from '../fashionShop_srv';

annotate FasionShopService.Items with {
        id          @title :'ID';
        itemname    @title: 'Name';
        brand       @title: 'Brand';
        size        @title: 'Size';
        material    @title: 'Material';
        price       @title: 'Price';
        currency    @title: 'Currency';
        isAvailable @title: 'Available';


       /* f_type @Common : {
        Text : f_type.id,
        TextArrangement : #TextOnly,
    }*/
};

annotate FasionShopService.Items with @(
    UI: {

        //ocultar campos sensibles de odata.draft. Ocultará loc campos create, delete, y update
        UpdateHidden : true,
        CreateHidden : true,
        DeleteHidden : true,

        //info de cabecera
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Online Fashion Shop',
            TypeNamePlural : 'Online Fashion Shop',
            Title : {
                Value : itemname
            },
            Description : {
                Value : 'Online Fashion Shop'
            }
        },

        //campos de busqueda
        SelectionFields  : [
            f_type_id,
            itemname,
            brand,
            size,
            price
        ],

        //campos a mostrar de un objeto en cada fila
        LineItem  : [
            
            {
                Value : f_type.section.name
            },
            {
                Value : f_type.typename
            },
            {Value : itemname},
            {Value : brand},
            {Value : size},
            {Value : price},
            {Value : currency_code},
        ],


        Facets  : [
            {
                $Type : 'UI.CollectionFacet',
                ID : '1',
                Label : 'Fashion Type & Section',
                Facets : [{
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#TypeSection'
                }],
            }
            ,
            {
                $Type : 'UI.CollectionFacet',
                ID : '2',
                Label : 'Fashion Item',
                Facets : [{
                    $Type : 'UI.ReferenceFacet',
                    Target : '@UI.FieldGroup#ItemDetails'
                }],
            }
            
        ],
        FieldGroup #TypeSection  : {
            $Type : 'UI.FieldGroupType',
            Data : [                              
                 {
                    Value: f_type_id,
                    Label: 'Type ID'
                },
                {
                    Value : f_type.typename,
                    Label: 'Type Name '
                }
                ,
                {
                    Value : f_type.description,
                    Label: 'Description '
                },
                {
                    Value : f_type.section_id,
                    Label: 'Section ID'
                },
                {
                    Value: f_type.section.name,
                    Label: 'Section Name'
                },                           
            ]           
        },
        FieldGroup #ItemDetails : {
            Data : [
               {
                    Value: id,
                    Label: 'Item ID'
                },
                {
                    Value : itemname,
                    Label: 'Item Name'
                },
                {
                    Value: brand,
                    Label: 'Brand'
                },
                {
                    Value: material,
                    Label: 'Material'
                },
                {
                    Value: size,
                    Label: 'Size'
                },
                {
                    Value : price,
                    Label : 'Price'
                }
                ,
                {
                    Value : currency_code,
                    Label : 'Currency'
                }
            ]            
        },
    }
);
