using { bookstall as my } from '../db/schema.cds';
using { northwind as external } from './external/northwind';
@path : '/service/bookstallService'
service bookstallService
{
     @restrict : [{ grant : 'READ', to : 'Manager'}]
    entity books as projection on my.Books;
     @requires :['Manager']
    entity authors as projection on my.Authors;
entity Products as projection on external.Products;
}
annotate bookstallService.books with @( 
    odata.draft.enabled : true, 
    fiori.draft.enabled : true,
    odata.draft.bypass:true, 
   UI.LineItem : [
        {
         $Type : 'UI.DataField',
         Label : 'title' ,
          Value : Title
           },
           {
         $Type : 'UI.DataField',
         Label : 'description' ,
          Value : Description
           },
 {
         $Type : 'UI.DataField',
         Label : 'Price' ,
          Value : price
           }],
     UI.SelectionFields : [
             Title,
            ],
            UI.HeaderInfo : {
                 Title :
                 {
                 $Type : 'UI.DataField',
                 Label :  'Title',
                  Value : Title 
                  },
                  TypeName : 'Book', 
                  TypeNamePlural : 'Books',
                   Description :{ 
                    $Type : 'UI.DataField',
                    Lable : 'Description',
                     Value : Description } 
                     } ,
                      UI.Identification : [
        {
            $Type : 'UI.DataField',
            Label : 'Title',
            Value : Title
        },
        {
            $Type : 'UI.DataField',
            Label : 'Description',
            Value : Description
        }],
        UI.Facets : [
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Book Details',
        Target : '@UI.Identification'
    }
]
                     );
            
    
annotate bookstallService with @requires :
[
    'authenticated-user'
];
