using {FasionShop_Service} from '../fashionShop_srv';


annotate FasionShop_Service.Fashion_Items with @(UI: {

    //ocultar campos sensibles de odata.draft. Ocultará loc campos create, delete, y update poniendo a true
    UpdateHidden           : false,
    CreateHidden           : false,
    DeleteHidden           : false,

    //info de cabecera
    HeaderInfo             : {
        $Type         : 'UI.HeaderInfoType',
        TypeName      : 'Online Fashion Shop',
        TypeNamePlural: 'Online Fashion Shop',
        Title         : {Value: itemname},
        Description   : {Value: 'Online Fashion Shop'}
    },

    //campos de busqueda
    SelectionFields        : [
        fashionType_id,
        itemname,
        brand,
        size,
        price
    ],

    //campos a mostrar de un objeto en cada fila
    LineItem               : [

        {Value: fashionType.section.name},
        {Value: fashionType.typename},
        {Value: itemname},
        {Value: brand},
        {Value: size},
        {Value: price},
        {Value: currency_code},
    ],


    Facets                 : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : '1',
            Label : 'Fashion Type & Section',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#TypeSection'
            }],
        },
        {
            $Type : 'UI.CollectionFacet',
            ID    : '2',
            Label : 'Fashion Item',
            Facets: [{
                $Type : 'UI.ReferenceFacet',
                Target: '@UI.FieldGroup#ItemDetails'
            }],
        }

    ],
    FieldGroup #TypeSection: {
        $Type: 'UI.FieldGroupType',
        Data : [
            {
                Value: fashionType_id               
            },
            {
                Value: fashionType.typename,
                ![@Common.FieldControl] : #ReadOnly           
            },
            {
                Value: fashionType.description,
                ![@Common.FieldControl] : #ReadOnly              
            },
            {
                Value: fashionType.section.id,
                ![@Common.FieldControl] : #ReadOnly               
            },
            {
                Value: fashionType.section.name,
                ![@Common.FieldControl] : #ReadOnly               
            }
        ]
    },
    FieldGroup #ItemDetails: {Data: [
        {Value: id},
        { Value: itemname},
        {Value: brand},
        {Value: material},
        {Value: size},
        {Value: price},
        {Value: currency_code}
    ]},
});

annotate FasionShop_Service.Fashion_Items with {
    fashionType @(
        title         : 'Fashion type',
        sap.valie.list: 'fixed-values',
        Common        : {
            ValueListWithFixedValues,
            ValueList: {
                $Type         : 'Common.ValueListType',
                CollectionPath: 'YC_FashionType',
                Parameters    : [
                    {
                        $Type            : 'Common.ValueListParameterInOut',
                        ValueListProperty: 'fashionTypeId',
                        LocalDataProperty: fashionType_id
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'sectionName'
                    },
                    {
                        $Type            : 'Common.ValueListParameterDisplayOnly',
                        ValueListProperty: 'fashionTypeName'
                    }
                ]
            },

        }
    )
};
