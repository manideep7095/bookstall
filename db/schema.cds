namespace bookstall;

@odata.draft.enabled
entity Books
{
    key ID : UUID;
    Createdby : String @cds.on.insert : $user;
    DateTime : DateTime @cds.on.insert : $now;
    Title : String(100);
    Description : String(100);
    price : Integer;
    stock : Integer;
    author : Association to one Authors;
}

entity Authors
{
    key ID : UUID;
    Author : String(100);
    books : Association to many Books on books.author = $self;
}
