namespace store.commerce;
using { Country, managed } from '@sap/cds/common';


entity Products {
  key ID  : UUID;
  categoryid: UUID;
  subcategoryid: UUID;
  name  :  String;
  category: Association to many Category on category.ID = $self.categoryid;
  subcategory : Association to many SubCategory on subcategory.ID = $self.subcategoryid;
  image : LargeBinary @Core.MediaType: imageType;
  imageType : String  @Core.IsMediaType;
}

entity SubCategory {
  key ID  : UUID;
  categoryid : UUID;
  name   : String;
  image : LargeBinary @Core.MediaType: imageType;
  imageType : String  @Core.IsMediaType;
  category: Association to many Category on category.ID = $self.categoryid;
}

entity Category {
 key ID  : UUID;
 name   : String;
}


