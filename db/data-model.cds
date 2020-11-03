namespace store.commerce;
using {cuid, Country, managed } from '@sap/cds/common';


entity Products:cuid,managed {
  categoryid: UUID;     @FieldControl.Mandatory 
  subcategoryid: UUID;   @FieldControl.Mandatory
  name  :  String;
  category: Association to many Category on category.ID = $self.categoryid;  @assert.integrity:true
  subcategory : Association to many SubCategory on subcategory.ID = $self.subcategoryid;  @assert.integrity:true
  image : LargeBinary @Core.MediaType: 'image/jpg';
  imageType : String  @Core.IsMediaType;
}

entity SubCategory:cuid,managed {
  categoryid : UUID;   @FieldControl.Mandatory 
  name   : String;
  category: Association to many Category on category.ID = $self.categoryid ; @assert.integrity:true
  product:Association to many Products on product.subcategoryid = $self.ID; @assert.integrity:true
  image : LargeBinary @Core.MediaType: 'image/jpg';
  imageType : String  @Core.IsMediaType;
}

entity Category:cuid,managed {
 name   : String;
 subcategory : Association to many SubCategory on subcategory.categoryid = $self.ID;
}