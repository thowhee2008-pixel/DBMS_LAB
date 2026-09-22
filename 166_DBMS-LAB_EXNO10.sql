LIBRARY MANAGEMENT SYSTEM 
Select or Create Database 
  use library 
OUTPUT: 
  switched to db library 
Insert Authors 
  db.authors.insertMany([ { 
  AuthorID: 1, 
  FirstName: "George", 
  LastName: "Orwell" }, 
  { 
  AuthorID: 2, 
  FirstName: "Aldous", 
  LastName: "Huxley" 
  },
  { 
  AuthorID: 3, 
  FirstName: "J.K.", 
  LastName: "Rowling" 
  } ]) 
OUTPUT: 
  { 
  acknowledged: true, 
  insertedIds: { 
  '0': ObjectId('...'), 
  '1': ObjectId('...'), 
  '2': ObjectId('...') 
  } 
  } 
  Insert Books 
  db.books.insertMany([ 
  { 
  BookID: 1, 
  Title: "1984", 
  Genre: "Dystopian", 
  PublicationYear: 1949, 
  Authors: [1] 
  }, 
  { 
  BookID: 2, 
  Title: "Brave New World", 
  Genre: "Dystopian", 
  PublicationYear: 1932, 
  Authors: [2] 
  }, 
  { 
  BookID: 3, 
  Title: "Harry Potter and the Sorcerer's Stone", 
  Genre: "Fantasy", 
  PublicationYear: 1997, 
  Authors: [3] 
  } ]) 
OUTPUT: 
  { 
  acknowledged: true, 
  insertedIds: 
  { 
  '0': ObjectId('...'), 
  '1': ObjectId('...'), 
  '2': ObjectId('...') 
  } }
Insert Borrowers 
  db.borrowers.insertMany([ 
  { 
  BorrowerID: 1, 
  FirstName: "John", 
  LastName: "Doe", 
  MembershipDate: new Date("2023-01-01") 
  }, 
  { 
  BorrowerID: 2, 
  FirstName: "Jane", 
  LastName: "Smith", 
  MembershipDate: new Date("2023-02-15") 
  } ]) 
OUTPUT: 
  { 
  acknowledged: true, 
  insertedIds: { 
  '0': ObjectId('...'), 
  '1': ObjectId('...') 
  }
  } 
  Step 5: Insert Borrowed Books 
  db.borrowedBooks.insertMany([ 
  { 
  BorrowerID: 1, 
  BookID: 1, 
  BorrowedDate: new Date("2023-03-01"), 
  ReturnDate: new Date("2023-03-15") 
  }, 
  { 
  BorrowerID: 2, 
  BookID: 3, 
  BorrowedDate: new Date("2023-03-05"), 
  ReturnDate: new Date("2023-03-20") 
  } ]) 
OUTPUT: 
  { 
  acknowledged: true, 
  insertedIds: { 
  '0': ObjectId('...'), 
  '1': ObjectId('...') 
  }
  } 
Update Data
  db.authors.updateOne( 
  {AuthorID: 1 
  }, 
  { 
  $set: { LastName: "Smith" } 
  } ) 
OUTPUT: 
  { 
  acknowledged: true, 
  matchedCount: 1, 
  modifiedCount: 1 
  } 
Step 7: Query  Read Data Display all authors: 
  db.authors.find().pretty() 
OUTPUT: 
  [ {
  _id: ObjectId('...'), 
  AuthorID: 1, 
  FirstName: "George", 
  LastName: "Smith" 
  }, 
  {
  _id: ObjectId('...'), 
  AuthorID: 2, 
  FirstName: "Aldous", 
  LastName: "Huxley" 
  }, 
  { 
  _id: ObjectId('...'), 
  AuthorID: 3, 
  FirstName: "J.K.", 
  LastName: "Rowling" 
  } ] 
  Display all books: 
  db.books.find().pretty() 
  OUTPUT: 
  [ { 
  _id: ObjectId('...'),
  BookID: 1, 
  Title: "1984", 
  Genre: "Dystopian", 
  PublicationYear: 1949, 
  Authors: [1] 
  }, 
  { 
  _id: ObjectId('...'), 
  BookID: 2, 
  Title: "Brave New World", 
  Genre: "Dystopian", 
  PublicationYear: 1932, 
  Authors: [2] 
  }, 
  { 
  _id: ObjectId('...'), 
  BookID: 3, 
  Title: "Harry Potter and the Sorcerer's Stone", 
  Genre: "Fantasy", 
  PublicationYear: 1997, 
  Authors: [3] 
  } ] 
  Display all borrowers: 
  db.borrowers.find().pretty() 
OUTPUT: 
  [ { 
  _id: ObjectId('...'), 
  BorrowerID: 1, 
  FirstName: "John", 
  LastName: "Doe", 
  MembershipDate: ISODate("2023-01-01T00:00:00.000Z") 
  }, 
  { 
  _id: ObjectId('...'), 
  BorrowerID: 2, 
  FirstName: "Jane", 
  LastName: "Smith", 
  MembershipDate: ISODate("2023-02-15T00:00:00.000Z") 
  } ] 
  Display all borrowed books: 
  db.borrowedBooks.find().pretty()
OUTPUT: 
  [ { 
  _id: ObjectId('...'), 
  BorrowerID: 1, BookID: 1, 
  BorrowedDate: ISODate("2023-03-01T00:00:00.000Z"), R
  eturnDate: ISODate("2023-03-15T00:00:00.000Z") 
  },
  { 
  _id: ObjectId('...'), 
  BorrowerID: 2, 
  BookID: 3, 
  BorrowedDate: ISODate("2023-03-05T00:00:00.000Z"), 
  ReturnDate: ISODate("2023-03-20T00:00:00.000Z") 
  } ] 
  Delete Data Delete author whose AuthorID is 1. 
  db.authors.deleteOne( { AuthorID: 1 } ) 
OUTPUT: 
  { 
  acknowledged: true, 
  deletedCount: 1 
  }
  Verify Deletion 
  db.authors.find().pretty() 
OUTPUT: 
  [ { 
  _id: ObjectId('...'), 
  AuthorID: 2, 
  FirstName: "Aldous", 
  LastName: "Huxley" 
  }, 
  { 
  _id: ObjectId('...'), 
  AuthorID: 3, 
  FirstName: "J.K.", 
  LastName: "Rowling" 
  } ]
